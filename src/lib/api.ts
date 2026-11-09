import { supabase } from "@/integrations/supabase/client";
import type { Tables } from "@/integrations/supabase/types";
import { epley1RM, todayISO } from "./format";

export type Exercise = Tables<"exercises">;
export type WorkoutDay = Tables<"workout_days">;
export type WorkoutExercise = Tables<"workout_exercises"> & { exercises: Exercise };
export type SessionRow = Tables<"workout_sessions">;
export type SetRow = Tables<"sets">;
export type ExerciseSession = Tables<"exercise_sessions">;
export type WorkoutTemplate = Tables<"workout_templates">;

/**
 * `activeTemplateId` scopes which curated (user_id IS NULL) days are visible.
 * Omitted/undefined falls back to showing every curated template's days —
 * needed for callers (e.g. the plan builder) that don't care which template
 * a day belongs to, and as a safe default before a profile has loaded.
 */
export async function fetchDays(userId?: string, activeTemplateId?: string | null) {
  let query = supabase
    .from("workout_days")
    .select("*, workout_exercises(id)")
    .order("sort_order");

  const validUid = typeof userId === "string" && userId.trim() ? userId.trim() : null;
  if (validUid) {
    query = activeTemplateId
      ? query.or(`and(user_id.is.null,template_id.eq.${activeTemplateId}),user_id.eq.${validUid}`)
      : query.or(`user_id.is.null,user_id.eq.${validUid}`);
  } else {
    query = activeTemplateId
      ? query.is("user_id", null).eq("template_id", activeTemplateId)
      : query.is("user_id", null);
  }

  const { data, error } = await query;
  if (error) throw error;
  return data.map((d: any) => ({
    ...d,
    exercise_count: d.workout_exercises?.length ?? 0,
  }));
}

export type DayWithExercises = { day: WorkoutDay; exercises: WorkoutExercise[] };

/**
 * A day and its exercises (with the user's permanent exercise swaps applied).
 * Day slugs are unique, so this is one nested request run in parallel with the
 * replacements lookup, instead of the four sequential round trips it used to take.
 */
export async function fetchDayWithExercises(
  slug: string,
  userId?: string,
): Promise<DayWithExercises | null> {
  const validUid = typeof userId === "string" && userId.trim() ? userId.trim() : null;

  let dayQuery = supabase
    .from("workout_days")
    .select("*, workout_exercises(*, exercises(*))")
    .eq("slug", slug)
    .order("position", { referencedTable: "workout_exercises" });
  dayQuery = validUid
    ? dayQuery.or(`user_id.is.null,user_id.eq.${validUid}`)
    : dayQuery.is("user_id", null);

  const [dayRes, replRes] = await Promise.all([
    dayQuery.maybeSingle(),
    validUid
      ? supabase
          .from("user_exercise_replacements")
          .select(
            "workout_exercise_id, replacement:exercises!user_exercise_replacements_replacement_exercise_id_fkey(*)",
          )
          .eq("user_id", validUid)
      : Promise.resolve({ data: [], error: null }),
  ]);
  if (dayRes.error) throw dayRes.error;
  if (!dayRes.data) return null;

  const { workout_exercises, ...day } = dayRes.data as unknown as WorkoutDay & {
    workout_exercises: WorkoutExercise[];
  };
  const replacements = (replRes.data ?? []) as unknown as {
    workout_exercise_id: string;
    replacement: Exercise | null;
  }[];
  const swapByWorkoutExercise = new Map(
    replacements.filter((r) => r.replacement).map((r) => [r.workout_exercise_id, r.replacement!]),
  );

  const exercises = (workout_exercises ?? []).map((we) => {
    const swap = swapByWorkoutExercise.get(we.id);
    return swap ? { ...we, exercise_id: swap.id, exercises: swap } : we;
  });

  return { day, exercises };
}

/** Shared so pages can prefetch the exact query the workout screen reads. */
export const dayQueryKey = (slug: string, userId: string | undefined) => ["day", slug, userId];

export type LiveSet = {
  id: string;
  set_number: number;
  weight_kg: number | null;
  reps: number | null;
  performed_at: string;
  is_warmup: boolean;
};
export type LiveExerciseSession = {
  id: string;
  workout_exercise_id: string | null;
  exercise_id: string;
  sets: LiveSet[];
};
export type LiveSession = {
  id: string;
  status: string;
  started_at: string;
  session_date: string;
  duration_seconds: number | null;
  day_id: string | null;
  exercise_sessions: LiveExerciseSession[];
};

const LIVE_SESSION_SELECT =
  "id, status, started_at, session_date, duration_seconds, day_id, exercise_sessions(id, workout_exercise_id, exercise_id, sets(id, set_number, weight_kg, reps, performed_at, is_warmup))";

/** Today's in-progress or completed (never abandoned) session for a day, with everything logged so far — one request. */
export async function fetchTodayLiveSession(userId: string, dayId: string) {
  const { data, error } = await supabase
    .from("workout_sessions")
    .select(LIVE_SESSION_SELECT)
    .eq("user_id", userId)
    .eq("day_id", dayId)
    .eq("session_date", todayISO())
    .in("status", ["in_progress", "completed"])
    .order("started_at", { ascending: false })
    .limit(1)
    .maybeSingle();
  if (error) throw error;
  return data as unknown as LiveSession | null;
}

/** Maps each planned workout_exercise to this session's exercise_session row. */
export type ExerciseSessionMap = Record<string, string>;

/**
 * Starts (or resumes) today's session for a day in a single round trip (see the
 * start_workout_session database function) and returns the exercise_session id for
 * every planned exercise, so sets can be written without further lookups.
 */
export async function startLiveSession(
  day: WorkoutDay,
): Promise<{ session: LiveSession; exerciseSessionIds: ExerciseSessionMap }> {
  const { data, error } = await supabase.rpc("start_workout_session", {
    p_day_id: day.id,
    p_session_date: todayISO(),
    p_title: `${day.name} — ${day.focus ?? ""}`.trim(),
  });
  if (error) throw error;
  const session = data as unknown as LiveSession;
  const exerciseSessionIds: ExerciseSessionMap = {};
  for (const es of session.exercise_sessions) {
    if (es.workout_exercise_id) exerciseSessionIds[es.workout_exercise_id] = es.id;
  }
  return { session, exerciseSessionIds };
}

/**
 * Creates any missing exercise_session rows for the planned exercises (e.g. after the
 * plan changed) and returns the full workout_exercise → exercise_session map.
 */
export async function ensureExerciseSessionMap(
  userId: string,
  sessionId: string,
  exercises: WorkoutExercise[],
  existing: Pick<LiveExerciseSession, "id" | "workout_exercise_id">[],
): Promise<ExerciseSessionMap> {
  const map: ExerciseSessionMap = {};
  for (const es of existing) if (es.workout_exercise_id) map[es.workout_exercise_id] = es.id;

  const missing = exercises.filter((we) => !map[we.id]);
  if (missing.length === 0) return map;

  const { data, error } = await supabase
    .from("exercise_sessions")
    .insert(
      missing.map((we) => ({
        user_id: userId,
        session_id: sessionId,
        exercise_id: we.exercise_id,
        workout_exercise_id: we.id,
        position: we.position,
        target_sets: we.sets,
        target_rep_range: we.rep_range,
      })),
    )
    .select("id, workout_exercise_id");
  if (error) throw error;
  for (const es of data ?? []) if (es.workout_exercise_id) map[es.workout_exercise_id] = es.id;
  return map;
}

export async function fetchSessionDetail(sessionId: string) {
  const [{ data: session, error }, { data: exSessions, error: esErr }] = await Promise.all([
    supabase.from("workout_sessions").select("*").eq("id", sessionId).maybeSingle(),
    supabase
      .from("exercise_sessions")
      .select("*, exercises(*)")
      .eq("session_id", sessionId)
      .order("position"),
  ]);
  if (error) throw error;
  if (esErr) throw esErr;
  if (!session) return null;

  const [{ data: sets, error: sErr }, { data: pl }] = await Promise.all([
    supabase
      .from("sets")
      .select("*")
      .in(
        "exercise_session_id",
        (exSessions ?? []).map((e) => e.id),
      )
      .order("set_number"),
    session.day_id
      ? supabase
          .from("workout_exercises")
          .select("*, exercises(*)")
          .eq("day_id", session.day_id)
          .order("position")
      : Promise.resolve({ data: [] as WorkoutExercise[] }),
  ]);
  if (sErr) throw sErr;

  return {
    session,
    exSessions: (exSessions ?? []) as (ExerciseSession & { exercises: Exercise })[],
    sets: sets ?? [],
    planned: (pl ?? []) as WorkoutExercise[],
  };
}

/**
 * Recent working sets for a whole day's exercises in one request (newest first) —
 * replaces one request per exercise. Group with groupPreviousPerformance().
 */
export async function fetchRecentSetsForExercises(userId: string, exerciseIds: string[]) {
  if (exerciseIds.length === 0) return [];
  const { data, error } = await supabase
    .from("sets")
    .select("exercise_id, exercise_session_id, set_number, weight_kg, reps, performed_at")
    .eq("user_id", userId)
    .in("exercise_id", exerciseIds)
    .eq("is_warmup", false)
    .order("performed_at", { ascending: false })
    .limit(Math.min(1000, exerciseIds.length * 40));
  if (error) throw error;
  return data ?? [];
}

export async function logSet(params: {
  userId: string;
  exerciseSessionId: string;
  exerciseId: string;
  setNumber: number;
  weight: number | null;
  reps: number | null;
  rir: number | null;
  isWarmup?: boolean;
  note?: string | null;
  existingId?: string | null;
}) {
  const payload = {
    user_id: params.userId,
    exercise_session_id: params.exerciseSessionId,
    exercise_id: params.exerciseId,
    set_number: params.setNumber,
    weight_kg: params.weight,
    reps: params.reps,
    rir: params.rir,
    is_warmup: params.isWarmup ?? false,
    note: params.note ?? null,
    completed: true,
  };
  if (params.existingId) {
    const { data, error } = await supabase
      .from("sets")
      .update(payload)
      .eq("id", params.existingId)
      .select()
      .single();
    if (error) throw error;
    return data;
  }
  const { data, error } = await supabase.from("sets").insert(payload).select().single();
  if (error) throw error;
  return data;
}

export async function deleteSet(setId: string) {
  const { error } = await supabase.from("sets").delete().eq("id", setId);
  if (error) throw error;
}

export type CustomDayInput = {
  dayOfWeek: number;
  name: string;
  isOptional: boolean;
  exercises: {
    exerciseId: string;
    sets: number;
    repRange: string;
    restSeconds: number;
  }[];
};

export async function createCustomPlan(userId: string, days: CustomDayInput[]) {
  // Enforce Max 1 custom plan by finding and deleting any existing custom plan for this user
  const { data: existing } = await supabase
    .from("workout_days")
    .select("id")
    .eq("user_id", userId)
    .eq("is_custom", true);

  if (existing && existing.length > 0) {
    // Cascade delete handles workout_exercises
    await supabase.from("workout_days").delete().in("id", existing.map(d => d.id));
  }

  // Create the new days
  const dayPayloads = days.map((d) => ({
    name: d.name || "Rest Day",
    slug: `custom-${Date.now()}-${d.dayOfWeek}`,
    day_of_week: d.dayOfWeek,
    is_optional: d.isOptional,
    sort_order: 99,
    is_custom: true,
    user_id: userId,
  }));

  const { data: insertedDays, error: dayErr } = await supabase
    .from("workout_days")
    .insert(dayPayloads)
    .select();

  if (dayErr) throw dayErr;

  // Insert workout_exercises
  const workoutExercises: any[] = [];
  
  for (const insertedDay of insertedDays) {
    const originalInput = days.find(d => d.dayOfWeek === insertedDay.day_of_week);
    if (!originalInput) continue;
    
    originalInput.exercises.forEach((ex, index) => {
      workoutExercises.push({
        day_id: insertedDay.id,
        exercise_id: ex.exerciseId,
        position: index,
        sets: ex.sets || 3,
        rep_range: ex.repRange || "8-12",
        rest_seconds: ex.restSeconds || 120,
      });
    });
  }

  if (workoutExercises.length > 0) {
    const { error: weErr } = await supabase.from("workout_exercises").insert(workoutExercises);
    if (weErr) throw weErr;
  }

  return insertedDays;
}

export async function replaceSessionExercise(
  userId: string,
  sessionId: string | null | undefined,
  workoutExerciseId: string,
  originalExerciseId: string,
  newExerciseId: string,
  reason?: string
) {
  // 1. Record the replacement rule so it applies to future sessions
  const { error: replErr } = await supabase
    .from("user_exercise_replacements")
    .upsert({
      user_id: userId,
      workout_exercise_id: workoutExerciseId,
      original_exercise_id: originalExerciseId,
      replacement_exercise_id: newExerciseId,
      reason: reason ?? null,
    }, { onConflict: "user_id,workout_exercise_id" });

  if (replErr) throw replErr;

  // 2. Update today's in_progress exercise_session so sets logged right now go to the new exercise
  if (sessionId) {
    const { error: sessionErr } = await supabase
      .from("exercise_sessions")
      .update({ exercise_id: newExerciseId })
      .eq("session_id", sessionId)
      .eq("workout_exercise_id", workoutExerciseId);

    if (sessionErr) throw sessionErr;
  }

  return true;
}


/** Detects and stores new personal records for a finished session. */
export async function evaluatePRs(params: { userId: string; sessionId: string }) {
  const { userId, sessionId } = params;
  const detail = await fetchSessionDetail(sessionId);
  if (!detail) return [];

  const { data: existing } = await supabase
    .from("personal_records")
    .select("*")
    .eq("user_id", userId);

  const newPRs: {
    user_id: string;
    session_id: string;
    exercise_id: string;
    record_type: string;
    weight_kg: number | null;
    reps: number | null;
    estimated_1rm: number | null;
    volume_kg: number | null;
    achieved_on: string;
  }[] = [];
  const labels: string[] = [];

  for (const es of detail.exSessions) {
    const sets = detail.sets.filter((s) => s.exercise_session_id === es.id && !s.is_warmup);
    const scored = sets.filter((s) => (s.weight_kg ?? 0) > 0 && (s.reps ?? 0) > 0);
    if (scored.length === 0) continue;

    const best1rm = Math.max(...scored.map((s) => epley1RM(s.weight_kg!, s.reps!)));
    const bestSet = scored.reduce((a, b) =>
      epley1RM(b.weight_kg!, b.reps!) > epley1RM(a.weight_kg!, a.reps!) ? b : a,
    );
    const volume = scored.reduce((sum, s) => sum + s.weight_kg! * s.reps!, 0);

    const prior = (existing ?? []).filter((p) => p.exercise_id === es.exercise_id);
    const prior1rm = Math.max(0, ...prior.map((p) => p.estimated_1rm ?? 0));
    const priorVol = Math.max(0, ...prior.map((p) => p.volume_kg ?? 0));

    if (best1rm > prior1rm + 0.01) {
      newPRs.push({
        user_id: userId,
        session_id: sessionId,
        exercise_id: es.exercise_id,
        record_type: "estimated_1rm",
        weight_kg: bestSet.weight_kg,
        reps: bestSet.reps,
        estimated_1rm: Math.round(best1rm * 10) / 10,
        volume_kg: Math.round(volume * 10) / 10,
        achieved_on: detail.session.session_date,
      });
      labels.push(`${es.exercises.name} — ${bestSet.weight_kg} kg × ${bestSet.reps}`);
    } else if (volume > priorVol + 0.01) {
      newPRs.push({
        user_id: userId,
        session_id: sessionId,
        exercise_id: es.exercise_id,
        record_type: "volume",
        weight_kg: bestSet.weight_kg,
        reps: bestSet.reps,
        estimated_1rm: Math.round(best1rm * 10) / 10,
        volume_kg: Math.round(volume * 10) / 10,
        achieved_on: detail.session.session_date,
      });
      labels.push(`${es.exercises.name} — best volume ${Math.round(volume)} kg`);
    }
  }

  if (newPRs.length > 0) {
    const { error } = await supabase.from("personal_records").insert(newPRs);
    if (error) throw error;
  }
  return labels;
}

export async function finishSession(params: {
  userId: string;
  sessionId: string;
  durationSeconds: number;
  difficulty?: number | null;
  energy?: number | null;
  notes?: string | null;
}) {
  const { error } = await supabase
    .from("workout_sessions")
    .update({
      status: "completed",
      session_date: todayISO(),
      finished_at: new Date().toISOString(),
      duration_seconds: params.durationSeconds,
      difficulty: params.difficulty ?? null,
      energy: params.energy ?? null,
      notes: params.notes ?? null,
    })
    .eq("id", params.sessionId);
  if (error) throw error;
  return evaluatePRs({ userId: params.userId, sessionId: params.sessionId });
}

export async function fetchHistory(userId: string) {
  const { data, error } = await supabase
    .from("workout_sessions")
    .select("*")
    .eq("user_id", userId)
    .order("session_date", { ascending: false })
    .limit(60);
  if (error) throw error;
  return data ?? [];
}

export async function fetchBodyMetrics(userId: string) {
  const { data, error } = await supabase
    .from("body_metrics")
    .select("*")
    .eq("user_id", userId)
    .order("measured_on", { ascending: true })
    .order("created_at", { ascending: true });
  if (error) throw error;
  return data ?? [];
}

export async function fetchPRs(userId: string) {
  const { data, error } = await supabase
    .from("personal_records")
    .select("*, exercises(name, slug)")
    .eq("user_id", userId)
    .order("achieved_on", { ascending: false })
    .limit(30);
  if (error) throw error;
  return data ?? [];
}

export async function fetchExerciseHistory(userId: string, exerciseId: string) {
  const { data, error } = await supabase
    .from("sets")
    .select("*")
    .eq("user_id", userId)
    .eq("exercise_id", exerciseId)
    .eq("is_warmup", false)
    .order("performed_at", { ascending: true });
  if (error) throw error;
  return data ?? [];
}

/** Names only — the full rows are ~1.8 MB across the library. */
export async function fetchExercises() {
  const { data, error } = await supabase.from("exercises").select("id, name").order("name");
  if (error) throw error;
  return data ?? [];
}

export async function logCardio(params: {
  userId: string;
  sessionId?: string | null;
  type: string;
  minutes: number | null;
  incline: number | null;
  speed: number | null;
  notes?: string | null;
}) {
  const { error } = await supabase.from("cardio_sessions").insert({
    user_id: params.userId,
    session_id: params.sessionId ?? null,
    cardio_type: params.type,
    duration_minutes: params.minutes,
    incline_percent: params.incline,
    speed_kph: params.speed,
    notes: params.notes ?? null,
    performed_on: todayISO(),
  });
  if (error) throw error;
}

export async function fetchCardio(userId: string) {
  const { data, error } = await supabase
    .from("cardio_sessions")
    .select("*")
    .eq("user_id", userId)
    .order("performed_on", { ascending: false })
    .limit(30);
  if (error) throw error;
  return data ?? [];
}

export async function fetchSessionCardio(sessionId: string) {
  const { data, error } = await supabase
    .from("cardio_sessions")
    .select("*")
    .eq("session_id", sessionId);
  if (error) throw error;
  return data ?? [];
}

export async function fetchSessionPRs(sessionId: string) {
  const { data, error } = await supabase
    .from("personal_records")
    .select("*, exercises(name)")
    .eq("session_id", sessionId);
  if (error) throw error;
  return data ?? [];
}

export async function fetchLeaderboard(periodDays = 30) {
  const { data, error } = await supabase.rpc("get_leaderboard", {
    period_days: periodDays,
  });
  if (error) throw error;
  return data ?? [];
}

export async function fetchProfile(userId: string) {
  const { data, error } = await supabase
    .from("profiles")
    .select("*")
    .eq("id", userId)
    .maybeSingle();
  if (error) throw error;
  return data;
}

export async function fetchWorkoutTemplate(templateId?: string | null) {
  if (!templateId) return null;
  const { data, error } = await supabase
    .from("workout_templates")
    .select("*")
    .eq("id", templateId)
    .maybeSingle();
  if (error) throw error;
  return data;
}

/** All curated plans available to switch between (e.g. in the Plan page's "Change plan" picker). */
export async function fetchWorkoutTemplates() {
  const { data, error } = await supabase
    .from("workout_templates")
    .select("*")
    .order("created_at");
  if (error) throw error;
  return data ?? [];
}

export async function setActiveTemplate(userId: string, templateId: string) {
  const { error } = await supabase
    .from("profiles")
    .update({ active_template_id: templateId, updated_at: new Date().toISOString() })
    .eq("id", userId);
  if (error) throw error;
}

/** A template's days with their exercises, for previewing a curated plan before switching to it. */
export async function fetchTemplatePreview(templateId: string) {
  const { data: days, error } = await supabase
    .from("workout_days")
    .select("*")
    .eq("template_id", templateId)
    .order("sort_order");
  if (error) throw error;

  const dayIds = (days ?? []).map((d) => d.id);
  if (dayIds.length === 0) return [];

  const { data: exercises, error: exErr } = await supabase
    .from("workout_exercises")
    .select("*, exercises(name)")
    .in("day_id", dayIds)
    .order("position");
  if (exErr) throw exErr;

  return (days ?? []).map((d) => ({
    ...d,
    exercises: (exercises ?? []).filter((e) => e.day_id === d.id) as (WorkoutExercise)[],
  }));
}

export async function fetchWorkoutTemplateBySlug(slug: string) {
  const { data, error } = await supabase
    .from("workout_templates")
    .select("*")
    .eq("slug", slug)
    .maybeSingle();
  if (error) throw error;
  return data;
}

export async function uploadAvatar(userId: string, file: File) {
  const fileExt = file.name.split(".").pop();
  const fileName = `${userId}/profile_picture_${Date.now()}.${fileExt}`;

  const { error: uploadError } = await supabase.storage
    .from("user-profile-picture")
    .upload(fileName, file, { upsert: true });

  if (uploadError) throw uploadError;

  const { data: urlData } = supabase.storage.from("user-profile-picture").getPublicUrl(fileName);

  return urlData.publicUrl;
}

export async function saveProfile(userId: string, patch: Partial<Tables<"profiles">>) {
  const { error } = await supabase
    .from("profiles")
    .upsert({ id: userId, ...patch, updated_at: new Date().toISOString() });
  if (error) throw error;
}

/** All sets for a user, used for lifetime gamification stats. */
export async function fetchAllSets(userId: string) {
  const { data, error } = await supabase
    .from("sets")
    .select("weight_kg, reps, is_warmup, performed_at")
    .eq("user_id", userId)
    .eq("is_warmup", false)
    .order("performed_at", { ascending: true });
  if (error) throw error;
  return data ?? [];
}
