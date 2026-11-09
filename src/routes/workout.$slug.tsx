import { createFileRoute, Link, useRouter } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useCallback, useEffect, useMemo, useReducer, useRef, useState } from "react";
import { createPortal } from "react-dom";
import { toast as notify } from "sonner";
import { AppShell } from "@/components/AppShell";
import { HIITInstructions } from "@/components/HIITInstructions";
import { SubstitutionModal } from "@/components/SubstitutionModal";
import {
  SwipeDeck,
  type SwipeDeckHandle,
  type SwipeDirection,
} from "@/components/workout/SwipeDeck";
import { SetCard } from "@/components/workout/SetCard";
import { ACCENT, Icon, LINE, MUTED, PageSpinner, SubHeader } from "@/components/sk/ui";
import { useAuth } from "@/lib/auth";
import {
  dayQueryKey,
  deleteSet,
  discardSession,
  ensureExerciseSessionMap,
  fetchBestE1rm,
  fetchDayWithExercises,
  fetchRecentSetsForExercises,
  fetchTodayLiveSession,
  finishSession,
  logSet,
  replaceSessionExercise,
  saveSessionMood,
  startLiveSession,
  type DayWithExercises,
  type ExerciseSessionMap,
  type LiveSession,
  type WorkoutExercise,
} from "@/lib/api";
import {
  buildDeck,
  cardDefaults,
  cardKey,
  groupPreviousPerformance,
  type DeckCard,
  type LoggedValues,
} from "@/lib/workoutDeck";
import { epley1RM, fmtDuration, mmss } from "@/lib/format";
import { fmtVolume, fmtW } from "@/lib/skido";
import { useProfile, displayName } from "@/lib/hooks";
import {
  clearWorkoutNotification,
  requestNotificationPermission,
  showWorkoutNotification,
  triggerHapticVibration,
} from "@/lib/notifications";

export const Route = createFileRoute("/workout/$slug")({
  validateSearch: (search: Record<string, unknown>): { start?: boolean } => ({
    start: search["start"] === true || search["start"] === "true",
  }),
  head: () => ({
    meta: [
      { title: "Workout — Skido" },
      {
        name: "description",
        content: "Run your workout one set at a time: swipe right to log, left to skip.",
      },
      { property: "og:title", content: "Workout — Skido" },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: () => (
    <AppShell tab="plan">
      <WorkoutPage />
    </AppShell>
  ),
});

type Card = DeckCard<WorkoutExercise>;
type DoneResult = {
  status: "done";
  weight: number | null;
  reps: number;
  /** Resolves to the saved set's id, or null if saving failed. Never rejects. */
  saved: Promise<string | null>;
  pr?: number;
};
type SkipResult = { status: "skipped"; batch?: number };
type Result = DoneResult | SkipResult;
type Log = { results: Record<string, Result>; order: string[] };
type Ready = { sessionId: string; exerciseSessionIds: ExerciseSessionMap };
type Phase = "loading" | "overview" | "active" | "completed";
type Rest = { endsAt: number; total: number };
type Toast = { text: string; kind: "ok" | "pr" | "skip" | "info"; n: number };
type Summary = {
  duration: number;
  volume: number;
  logged: number;
  skipped: number;
  total: number;
  prs: { name: string; detail: string }[];
  byEx: { id: string; name: string; sets: string; dot: string }[];
};

const EMPTY_LOG: Log = { results: {}, order: [] };
const FEELS = ["Rough", "Hard", "Solid", "Strong", "Great"];
const isDone = (r: Result | undefined): r is DoneResult => r?.status === "done";
const round1 = (v: number) => Math.round(v * 10) / 10;

// Skips aren't stored in the database, so remember them per session on this device.
const skipsKey = (sessionId: string) => `skido:skips:${sessionId}`;
function loadSkips(sessionId: string): string[] {
  try {
    return JSON.parse(localStorage.getItem(skipsKey(sessionId)) ?? "[]") as string[];
  } catch {
    return [];
  }
}
function saveSkips(sessionId: string, keys: string[]) {
  try {
    localStorage.setItem(skipsKey(sessionId), JSON.stringify(keys));
  } catch {
    // best-effort
  }
}
function clearSkips(sessionId: string) {
  try {
    localStorage.removeItem(skipsKey(sessionId));
  } catch {
    // ignore
  }
}

function logFromServer(live: LiveSession, deckKeys: Set<string>): Log {
  const entries: { key: string; at: string; result: Result }[] = [];
  for (const es of live.exercise_sessions) {
    if (!es.workout_exercise_id) continue;
    for (const s of es.sets) {
      const key = cardKey(es.workout_exercise_id, s.set_number);
      if (s.is_warmup || !deckKeys.has(key)) continue;
      entries.push({
        key,
        at: s.performed_at,
        result: {
          status: "done",
          weight: s.weight_kg,
          reps: s.reps ?? 0,
          saved: Promise.resolve(s.id),
        },
      });
    }
  }
  entries.sort((a, b) => a.at.localeCompare(b.at));
  const log: Log = { results: {}, order: [] };
  for (const e of entries) {
    if (log.results[e.key]) continue;
    log.results[e.key] = e.result;
    log.order.push(e.key);
  }
  for (const key of loadSkips(live.id)) {
    if (!deckKeys.has(key) || log.results[key]) continue;
    log.results[key] = { status: "skipped" };
    log.order.push(key);
  }
  return log;
}

const buzz = (pattern: number | number[]) =>
  triggerHapticVibration(Array.isArray(pattern) ? pattern : [pattern]);
const elapsedLabel = (secs: number) =>
  secs >= 3600
    ? `${Math.floor(secs / 3600)}:${String(Math.floor((secs % 3600) / 60)).padStart(2, "0")}:${String(secs % 60).padStart(2, "0")}`
    : mmss(secs);

function WorkoutPage() {
  const { slug } = Route.useParams();
  const search = Route.useSearch();
  const { user } = useAuth();
  const uid = user?.id;
  const qc = useQueryClient();
  const router = useRouter();
  const { data: profile } = useProfile();

  const planQ = useQuery({
    queryKey: dayQueryKey(slug, uid),
    queryFn: () => fetchDayWithExercises(slug, uid),
  });
  const plan = planQ.data;
  const dayId = plan?.day.id;

  // Always fresh: resuming must reflect exactly what's saved right now.
  const liveQ = useQuery({
    queryKey: ["live-session", uid, dayId],
    queryFn: () => fetchTodayLiveSession(uid!, dayId!),
    enabled: !!uid && !!dayId,
    staleTime: 0,
    gcTime: 0,
  });

  const exerciseIds = useMemo(
    () => [...new Set((plan?.exercises ?? []).map((e) => e.exercise_id))].sort(),
    [plan],
  );
  const recentQ = useQuery({
    queryKey: ["recent-sets", uid, exerciseIds.join(",")],
    queryFn: () => fetchRecentSetsForExercises(uid!, exerciseIds),
    enabled: !!uid && exerciseIds.length > 0,
    staleTime: 60_000,
  });
  const bestQ = useQuery({
    queryKey: ["best-e1rm", uid, exerciseIds.join(",")],
    queryFn: () => fetchBestE1rm(uid!, exerciseIds),
    enabled: !!uid && exerciseIds.length > 0,
    staleTime: 60_000,
  });

  const deck = useMemo(() => buildDeck(plan?.exercises ?? []), [plan]);
  const deckKeys = useMemo(() => new Set(deck.map((c) => c.key)), [deck]);

  const [phase, setPhase] = useState<Phase>("loading");
  const [log, setLog] = useState<Log>(EMPTY_LOG);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [ownExerciseSessionIds, setOwnExerciseSessionIds] = useState<Set<string>>(() => new Set());
  const [startedAt, setStartedAt] = useState(() => Date.now());
  const [rest, setRest] = useState<Rest | null>(null);
  const [flipped, setFlipped] = useState(false);
  const [toast, setToast] = useState<Toast | null>(null);
  const [burst, setBurst] = useState(0);
  const [endSheet, setEndSheet] = useState(false);
  const [replacing, setReplacing] = useState<Card | null>(null);
  const [finishing, setFinishing] = useState(false);
  const [summary, setSummary] = useState<Summary | null>(null);

  const readyRef = useRef<Promise<Ready> | null>(null);
  const startFailed = useRef(false);
  const overrides = useRef<Record<string, LoggedValues>>({});
  const initialized = useRef(false);
  const finishingRef = useRef(false);
  const deckRef = useRef<SwipeDeckHandle>(null);
  const pendingBatch = useRef<{ weId: string; batch: number } | null>(null);
  const toastTimer = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);
  const burstTimer = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);
  /** Set saves/removals still on their way to the server. */
  const pendingWrites = useRef(0);
  const track = useCallback(<T,>(p: Promise<T>) => {
    pendingWrites.current++;
    p.finally(() => pendingWrites.current--).catch(() => undefined);
    return p;
  }, []);

  useEffect(
    () => () => {
      clearTimeout(toastTimer.current);
      clearTimeout(burstTimer.current);
    },
    [],
  );

  // Swipes are saved in the background; warn before the tab is closed mid-save.
  useEffect(() => {
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      if (pendingWrites.current > 0) e.preventDefault();
    };
    window.addEventListener("beforeunload", onBeforeUnload);
    return () => window.removeEventListener("beforeunload", onBeforeUnload);
  }, []);

  const showToast = useCallback((text: string, kind: Toast["kind"]) => {
    clearTimeout(toastTimer.current);
    setToast((t) => ({ text, kind, n: (t?.n ?? 0) + 1 }));
    toastTimer.current = setTimeout(() => setToast(null), 2000);
  }, []);
  const fireBurst = useCallback(() => {
    clearTimeout(burstTimer.current);
    setBurst((b) => b + 1);
    burstTimer.current = setTimeout(() => setBurst(0), 1700);
  }, []);

  // The running session's own sets must never count as "last time".
  const excludeFromHistory = useMemo(() => {
    const ids = new Set(ownExerciseSessionIds);
    for (const es of liveQ.data?.exercise_sessions ?? []) ids.add(es.id);
    return ids;
  }, [ownExerciseSessionIds, liveQ.data]);
  const previousByExercise = useMemo(
    () => groupPreviousPerformance(recentQ.data ?? [], excludeFromHistory),
    [recentQ.data, excludeFromHistory],
  );
  const bestFromHistory = useMemo(() => {
    const best: Record<string, number> = { ...(bestQ.data ?? {}) };
    for (const r of recentQ.data ?? []) {
      if (excludeFromHistory.has(r.exercise_session_id) || !r.weight_kg || !r.reps) continue;
      best[r.exercise_id] = Math.max(
        best[r.exercise_id] ?? 0,
        epley1RM(Number(r.weight_kg), r.reps),
      );
    }
    return best;
  }, [bestQ.data, recentQ.data, excludeFromHistory]);

  const loggedValues = useMemo(() => {
    const m: Record<string, LoggedValues> = {};
    for (const [k, r] of Object.entries(log.results))
      if (isDone(r)) m[k] = { weight: r.weight, reps: r.reps };
    return m;
  }, [log]);
  const defaultsFor = useCallback(
    (card: Card) =>
      cardDefaults(card, {
        log: loggedValues,
        prevSets: previousByExercise[card.we.exercise_id]?.sets,
      }),
    [loggedValues, previousByExercise],
  );
  const valuesFor = useCallback(
    (card: Card) => {
      const v = { ...defaultsFor(card), ...overrides.current[card.key] };
      if (card.isCardio) v.weight = null;
      return v;
    },
    [defaultsFor],
  );

  const remaining = useMemo(() => deck.filter((c) => !log.results[c.key]), [deck, log]);
  const current = remaining[0];
  const doneCount = useMemo(() => Object.values(log.results).filter(isDone).length, [log]);
  const handled = log.order.length;

  useEffect(() => setFlipped(false), [current?.key]);

  const adoptLive = useCallback((live: LiveSession, p: DayWithExercises, userId: string) => {
    setSessionId(live.id);
    setStartedAt(new Date(live.started_at).getTime());
    setLog(logFromServer(live, new Set(buildDeck(p.exercises).map((c) => c.key))));
    if (live.status !== "completed") {
      const ready = ensureExerciseSessionMap(
        userId,
        live.id,
        p.exercises,
        live.exercise_sessions,
      ).then((exerciseSessionIds) => ({
        sessionId: live.id,
        exerciseSessionIds,
      }));
      ready.catch((e: Error) => notify.error(e.message || "Couldn't reconnect to your workout"));
      readyRef.current = ready;
    }
  }, []);

  const start = useCallback(() => {
    if (!uid) {
      notify.info("Sign in to start and save workouts");
      router.navigate({ to: "/auth" });
      return;
    }
    if (!plan || readyRef.current) return;
    startFailed.current = false;
    setPhase("active");
    setStartedAt(Date.now());
    buzz(10);
    requestNotificationPermission();

    const started = startLiveSession(plan.day);
    readyRef.current = started.then((r) => ({
      sessionId: r.session.id,
      exerciseSessionIds: r.exerciseSessionIds,
    }));
    started
      .then(({ session, exerciseSessionIds }) => {
        setSessionId(session.id);
        setStartedAt(new Date(session.started_at).getTime());
        setOwnExerciseSessionIds(new Set(Object.values(exerciseSessionIds)));
        // Continuing a session begun before midnight: fold in what was already logged.
        if (session.exercise_sessions.some((es) => es.sets.length > 0)) {
          const server = logFromServer(session, deckKeys);
          setLog((prev) => ({
            results: { ...server.results, ...prev.results },
            order: [...server.order.filter((k) => !prev.results[k]), ...prev.order],
          }));
        }
        qc.invalidateQueries({ queryKey: ["history", uid] });
      })
      .catch((err: Error) => {
        startFailed.current = true;
        readyRef.current = null;
        notify.error(err?.message || "Couldn't start the workout");
        setPhase("overview");
        setLog(EMPTY_LOG);
        setRest(null);
      });
  }, [uid, plan, router, qc, deckKeys]);

  // Decide what to show once we know whether today's session already exists.
  useEffect(() => {
    if (initialized.current || !plan) return;
    if (uid && !liveQ.isFetched) return;
    initialized.current = true;
    const live = liveQ.data;
    if (live && uid) {
      adoptLive(live, plan, uid);
      setPhase(live.status === "completed" ? "completed" : "active");
      return;
    }
    setPhase("overview");
    if (search.start && !plan.day.is_rest) start();
  }, [plan, uid, liveQ.isFetched, liveQ.data, search.start, adoptLive, start]);

  useEffect(() => {
    if (!sessionId || phase !== "active") return;
    saveSkips(
      sessionId,
      Object.entries(log.results)
        .filter(([, r]) => r.status === "skipped")
        .map(([k]) => k),
    );
  }, [log, sessionId, phase]);

  const handleSwipe = useCallback(
    (card: Card, dir: SwipeDirection) => {
      const key = card.key;
      if (dir === "left") {
        const batch =
          pendingBatch.current?.weId === card.we.id ? pendingBatch.current.batch : undefined;
        pendingBatch.current = null;
        const keys = batch
          ? remaining.filter((c) => c.we.id === card.we.id).map((c) => c.key)
          : [key];
        setLog((prev) => {
          const results = { ...prev.results };
          for (const k of keys) results[k] = { status: "skipped", ...(batch ? { batch } : {}) };
          return { results, order: [...prev.order, ...keys] };
        });
        showToast(keys.length > 1 ? `Skipped ${keys.length} sets` : "Set skipped", "skip");
        buzz(6);
        return;
      }

      const values = valuesFor(card);
      const ready = readyRef.current;
      const write: Promise<string> = ready
        ? ready.then(async ({ exerciseSessionIds }) => {
            const exerciseSessionId = exerciseSessionIds[card.we.id];
            if (!exerciseSessionId)
              throw new Error("This exercise isn't part of the running session");
            const row = await logSet({
              userId: uid!,
              exerciseSessionId,
              exerciseId: card.we.exercise_id,
              setNumber: card.setNumber,
              weight: values.weight,
              reps: values.reps,
              rir: null,
            });
            return row.id;
          })
        : Promise.reject(new Error("The workout hasn't started"));

      const saved: Promise<string | null> = track(write).catch(() => {
        if (startFailed.current) return null;
        notify.error("Couldn't save that set — it's back on top.");
        setLog((prev) => {
          const cur = prev.results[key];
          if (!isDone(cur) || cur.saved !== saved) return prev;
          const { [key]: _removed, ...results } = prev.results;
          return { results, order: prev.order.filter((k) => k !== key) };
        });
        return null;
      });

      // Feedback: PR, or how this set compares with the same set last time.
      let pr: number | undefined;
      let text: string;
      let kind: Toast["kind"] = "ok";
      if (card.isCardio) {
        text = `${values.reps} min logged`;
      } else {
        const w = values.weight ?? 0;
        const e1 = w ? epley1RM(w, values.reps) : 0;
        const sessionBest = Math.max(
          0,
          ...Object.entries(log.results)
            .filter(
              ([k, r]) =>
                isDone(r) &&
                r.weight &&
                deck.find((c) => c.key === k)?.we.exercise_id === card.we.exercise_id,
            )
            .map(([, r]) => epley1RM((r as DoneResult).weight!, (r as DoneResult).reps)),
        );
        const best = Math.max(bestFromHistory[card.we.exercise_id] ?? 0, sessionBest);
        const prevSet = previousByExercise[card.we.exercise_id]?.sets.find(
          (s) => s.set_number === card.setNumber,
        );
        if (best > 0 && e1 > best + 0.05) {
          pr = round1(e1);
          text = `Personal record · est. 1RM ${pr} kg`;
          kind = "pr";
        } else if (prevSet && prevSet.weight_kg != null && prevSet.reps != null) {
          const pw = Number(prevSet.weight_kg);
          if (w > pw) text = `+${fmtW(w - pw)} kg on last time`;
          else if (w === pw && values.reps > prevSet.reps) {
            const d = values.reps - prevSet.reps;
            text = `+${d} rep${d > 1 ? "s" : ""} on last time`;
          } else if (w === pw && values.reps === prevSet.reps) text = "Matched last time";
          else text = `${fmtW(w)} kg × ${values.reps} logged`;
        } else text = w ? `${fmtW(w)} kg × ${values.reps} logged` : `${values.reps} reps logged`;
      }

      setLog((prev) => ({
        results: {
          ...prev.results,
          [key]: {
            status: "done",
            weight: values.weight,
            reps: values.reps,
            saved,
            ...(pr ? { pr } : {}),
          },
        },
        order: [...prev.order, key],
      }));
      showToast(text, kind);
      buzz(pr ? [15, 40, 15] : 10);
      if (pr) fireBurst();

      const hasNext = remaining.some((c) => c.key !== key);
      const secs = card.we.rest_seconds ?? 0;
      setRest(hasNext && secs > 0 ? { endsAt: Date.now() + secs * 1000, total: secs } : null);
    },
    [
      valuesFor,
      uid,
      track,
      log,
      deck,
      bestFromHistory,
      previousByExercise,
      remaining,
      showToast,
      fireBurst,
    ],
  );

  const undo = useCallback(() => {
    const lastKey = log.order[log.order.length - 1];
    if (!lastKey) return;
    const last = log.results[lastKey];
    const batch = last?.status === "skipped" ? last.batch : undefined;
    const keys = batch
      ? log.order.filter((k) => (log.results[k] as SkipResult | undefined)?.batch === batch)
      : [lastKey];
    const results = { ...log.results };
    for (const k of keys) delete results[k];
    setLog({ results, order: log.order.filter((k) => !keys.includes(k)) });
    setRest(null);
    setFlipped(false);
    if (isDone(last)) {
      overrides.current[lastKey] = { weight: last.weight, reps: last.reps };
      track(last.saved.then((id) => (id ? deleteSet(id) : undefined))).catch(() =>
        notify.error("Couldn't remove that set from your log"),
      );
    }
    showToast("Undone", "info");
  }, [log, track, showToast]);

  const skipExercise = useCallback(() => {
    if (!current || rest) return;
    pendingBatch.current = { weId: current.we.id, batch: Date.now() };
    deckRef.current?.swipe("left");
  }, [current, rest]);

  const finish = useCallback(async () => {
    if (!uid || !plan || finishingRef.current) return;
    const ready = readyRef.current;
    if (!ready) return;
    finishingRef.current = true;
    setFinishing(true);
    setEndSheet(false);
    try {
      const { sessionId: sid } = await ready;
      // Wait for every in-flight set so PRs are evaluated on the complete workout.
      const entries = await Promise.all(
        log.order.map(async (k) => {
          const r = log.results[k];
          return { k, r, id: isDone(r) ? await r.saved : null };
        }),
      );
      const kept = entries.filter((e) => isDone(e.r) && e.id) as {
        k: string;
        r: DoneResult;
        id: string;
      }[];
      const duration = Math.round((Date.now() - startedAt) / 1000);
      const labels = await finishSession({
        userId: uid,
        sessionId: sid,
        durationSeconds: duration,
      });
      clearWorkoutNotification();
      clearSkips(sid);
      setRest(null);
      const byEx = plan.exercises.map((we) => {
        const keys = deck.filter((c) => c.we.id === we.id).map((c) => c.key);
        const lg = kept.filter((e) => keys.includes(e.k));
        const reached = keys.filter((k) => log.results[k]).length;
        const sk = reached - lg.length;
        const cardio = we.exercises.category === "cardio";
        const parts = lg.map(({ r }) =>
          cardio ? `${r.reps} min` : r.weight ? `${fmtW(r.weight)}×${r.reps}` : `BW×${r.reps}`,
        );
        if (sk > 0) parts.push(`${sk} skipped`);
        if (!reached) parts.push("Not reached");
        return {
          id: we.id,
          name: we.exercises.name,
          sets: parts.join("  ·  "),
          dot:
            lg.length === keys.length
              ? ACCENT
              : lg.length
                ? "rgba(255,255,255,0.68)"
                : reached
                  ? "#FF4D4F"
                  : "#505051",
        };
      });
      setSummary({
        duration,
        volume: Math.round(kept.reduce((a, { r }) => a + (r.weight ?? 0) * r.reps, 0)),
        logged: kept.length,
        skipped: handled - doneCount,
        total: deck.length,
        prs: labels.map((l) => {
          const [name, ...rest] = l.split(" — ");
          return { name: name ?? l, detail: rest.join(" — ") };
        }),
        byEx,
      });
      qc.invalidateQueries();
    } catch (e) {
      finishingRef.current = false;
      notify.error((e as Error).message || "Couldn't finish the workout");
    } finally {
      setFinishing(false);
    }
  }, [uid, plan, log, startedAt, deck, handled, doneCount, qc]);

  // The last card done: finish automatically, as the design does.
  useEffect(() => {
    if (
      phase !== "active" ||
      summary ||
      deck.length === 0 ||
      remaining.length > 0 ||
      !readyRef.current
    )
      return;
    const t = setTimeout(() => finish(), 500);
    return () => clearTimeout(t);
  }, [phase, summary, deck.length, remaining.length, finish]);

  const discard = useCallback(async () => {
    setEndSheet(false);
    const ready = readyRef.current;
    try {
      if (ready) {
        const { sessionId: sid } = await ready;
        await discardSession(sid);
        clearSkips(sid);
      }
      clearWorkoutNotification();
      qc.invalidateQueries({ queryKey: ["history", uid] });
      notify.success("Workout discarded");
      router.navigate({ to: "/" });
    } catch (e) {
      notify.error((e as Error).message || "Couldn't discard the workout");
    }
  }, [qc, uid, router]);

  // Keyboard: → log, ← skip, ⌘/Ctrl+Z undo.
  useEffect(() => {
    if (phase !== "active" || summary) return;
    const onKey = (e: KeyboardEvent) => {
      if (replacing || endSheet || rest || flipped) return;
      const t = e.target as HTMLElement;
      if (t.closest("input, textarea, select, [contenteditable='true']")) return;
      if (e.key === "ArrowRight") {
        e.preventDefault();
        deckRef.current?.swipe("right");
      } else if (e.key === "ArrowLeft") {
        e.preventDefault();
        deckRef.current?.swipe("left");
      } else if (e.key.toLowerCase() === "z" && (e.metaKey || e.ctrlKey)) {
        e.preventDefault();
        undo();
      }
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [phase, summary, replacing, endSheet, rest, flipped, undo]);

  // Lock-screen progress notification while a workout is running.
  const progressRef = useRef({ done: 0, total: 0, name: "", startedAt });
  progressRef.current = {
    done: handled,
    total: deck.length,
    name: plan?.day.name ?? "Workout",
    startedAt,
  };
  useEffect(() => {
    if (phase !== "active" || summary) return;
    const onVisibility = () => {
      if (document.visibilityState !== "hidden") return;
      const p = progressRef.current;
      showWorkoutNotification({
        title: `🏋️ ${p.name} in progress`,
        body: `${p.done}/${p.total} sets · ${mmss((Date.now() - p.startedAt) / 1000)}`,
        tag: "active-workout",
      });
    };
    document.addEventListener("visibilitychange", onVisibility);
    return () => document.removeEventListener("visibilitychange", onVisibility);
  }, [phase, summary]);

  // The session runs as a full-screen layer; keep the page underneath from scrolling.
  useEffect(() => {
    if (phase !== "active" && !summary) return;
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = prev;
    };
  }, [phase, summary]);

  if (planQ.isLoading || (plan && phase === "loading")) return <PageSpinner />;

  if (!plan) {
    return (
      <>
        <SubHeader
          eyebrow="Plan"
          title="Workout not found"
          onBack={() => router.navigate({ to: "/plan" })}
        />
        <p style={{ margin: 0, fontSize: 14, color: MUTED }}>This day isn't part of your plan.</p>
      </>
    );
  }

  const firstName = displayName(profile, user?.email).split(" ")[0] ?? "there";

  if (summary && typeof document !== "undefined") {
    return createPortal(
      <DoneScreen summary={summary} day={plan.day} firstName={firstName} sessionId={sessionId} />,
      document.body,
    );
  }

  if (phase !== "active") {
    const completedId = phase === "completed" ? sessionId : null;
    return (
      <PlanDay
        plan={plan}
        onStart={start}
        completedSessionId={completedId}
        onBack={() => router.history.back()}
      />
    );
  }

  const restTarget = current;
  const restValues = restTarget ? valuesFor(restTarget) : null;
  const elapsedNowStatic = elapsedLabel(Math.max(0, Math.floor((Date.now() - startedAt) / 1000)));

  return createPortal(
    <>
      <div
        className="wk-layer"
        role="dialog"
        aria-modal="true"
        aria-label={`${plan.day.name} workout`}
      >
        <div className="wk-screen">
          <header className="wk-head">
            <button
              type="button"
              className="sk-icon-btn"
              onClick={() => setEndSheet(true)}
              aria-label="End workout"
              style={{ width: 40, height: 40 }}
            >
              <Icon name="close" size={16} />
            </button>
            <div style={{ flex: 1, minWidth: 0, textAlign: "center" }}>
              <p
                style={{
                  margin: 0,
                  fontSize: 12,
                  color: MUTED,
                  whiteSpace: "nowrap",
                  overflow: "hidden",
                  textOverflow: "ellipsis",
                }}
              >
                {plan.day.name} · {plan.day.focus ?? ""}
              </p>
              <Clock since={startedAt} />
            </div>
            <button
              type="button"
              className="sk-icon-btn"
              onClick={undo}
              disabled={handled === 0 || finishing}
              aria-label="Undo last set"
              style={{ width: 40, height: 40 }}
            >
              <Icon name="undo" size={16} />
            </button>
          </header>

          <div
            className="wk-segs"
            role="progressbar"
            aria-label="Workout progress"
            aria-valuemin={0}
            aria-valuemax={deck.length}
            aria-valuenow={handled}
          >
            {plan.exercises.map((we) => {
              const keys = deck.filter((c) => c.we.id === we.id).map((c) => c.key);
              const done = keys.filter((k) => log.results[k]).length;
              const lg = keys.filter((k) => isDone(log.results[k])).length;
              const isCur = current?.we.id === we.id;
              return (
                <div
                  key={we.id}
                  style={{
                    flex: keys.length || 1,
                    background: isCur ? "rgba(255,255,255,0.16)" : "rgba(255,255,255,0.08)",
                  }}
                >
                  <div
                    style={{
                      width: `${keys.length ? Math.round((done / keys.length) * 100) : 0}%`,
                      background:
                        done && !lg
                          ? "linear-gradient(90deg, rgba(255,77,79,0.35), #FF4D4F)"
                          : "linear-gradient(90deg, rgba(198,244,50,0.25), #C6F432)",
                    }}
                  />
                </div>
              );
            })}
          </div>
          <div
            style={{
              position: "relative",
              display: "flex",
              justifyContent: "space-between",
              fontSize: 12,
              color: "rgba(255,255,255,0.56)",
              marginBottom: 18,
            }}
          >
            <span>
              {current
                ? `Exercise ${current.exerciseIndex + 1} of ${current.exerciseCount}`
                : "All done"}
            </span>
            <span className="sk-num" style={{ letterSpacing: 0 }}>
              {handled} / {deck.length} sets
            </span>
          </div>

          {deck.length === 0 ? (
            <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
              {plan.day.slug === "saturday-hiit" ? (
                <HIITInstructions />
              ) : (
                <p style={{ margin: 0, fontSize: 14, lineHeight: 1.55, color: MUTED }}>
                  {plan.day.notes ?? plan.day.cardio_note ?? "Nothing to log today."}
                </p>
              )}
              <button
                type="button"
                className="sk-btn sk-btn-accent"
                onClick={finish}
                disabled={finishing}
              >
                {finishing ? "Finishing…" : "Finish workout"}
              </button>
            </div>
          ) : (
            <>
              <SwipeDeck
                ref={deckRef}
                items={remaining}
                getKey={(c) => c.key}
                onSwipe={handleSwipe}
                disabled={finishing || flipped}
                // Swiping the rest timer away ends the rest; the next card is then logged or skipped
                // with its own swipe, never blind under the timer.
                onSurfaceDismiss={() => setRest(null)}
                renderCard={(card) => (
                  <SetCard
                    key={card.we.exercise_id}
                    card={card}
                    defaults={defaultsFor(card)}
                    initial={overrides.current[card.key]}
                    previous={previousByExercise[card.we.exercise_id]}
                    pips={Array.from({ length: card.totalSets }, (_, i) => {
                      const k = cardKey(card.we.id, i + 1);
                      if (k === card.key) return "current";
                      const r = log.results[k];
                      return r ? (r.status === "done" ? "logged" : "skipped") : "todo";
                    })}
                    flipped={flipped && card.key === current?.key}
                    onFlip={() => setFlipped((f) => !f)}
                    onReplace={() => setReplacing(card)}
                    onChange={(v) => {
                      overrides.current[card.key] = v;
                    }}
                  />
                )}
                overlay={
                  <>
                    {toast && (
                      <div key={toast.n} role="status" className="wk-toast">
                        <span
                          style={{
                            width: 6,
                            height: 6,
                            borderRadius: 999,
                            background:
                              toast.kind === "skip"
                                ? "#FF4D4F"
                                : toast.kind === "info"
                                  ? "rgba(255,255,255,0.75)"
                                  : ACCENT,
                          }}
                        />
                        {toast.text}
                      </div>
                    )}
                    {burst > 0 && <div key={burst} aria-hidden="true" className="wk-sheen" />}
                    {rest && (
                      <RestOverlay
                        rest={rest}
                        nextName={restTarget?.we.exercises.name}
                        nextMeta={
                          restTarget && restValues
                            ? restTarget.isCardio
                              ? `${restValues.reps} min`
                              : `Set ${restTarget.setNumber} of ${restTarget.totalSets} · ${restValues.weight ? `${fmtW(restValues.weight)} kg` : "Bodyweight"} × ${restValues.reps}`
                            : undefined
                        }
                        onChange={setRest}
                        onDone={() => {
                          setRest(null);
                          buzz([20, 50, 20]);
                          showToast("Rest complete", "info");
                        }}
                      />
                    )}
                  </>
                }
              />
              <div className="wk-actions">
                <button
                  type="button"
                  className="sk-act wk-act-skip"
                  onClick={() => deckRef.current?.swipe("left")}
                  disabled={!current || !!rest || finishing}
                  aria-label="Skip this set"
                >
                  <Icon name="close" size={20} />
                </button>
                <button
                  type="button"
                  className="sk-act wk-act-skipex"
                  onClick={skipExercise}
                  disabled={!current || !!rest || finishing}
                  aria-label="Skip the rest of this exercise"
                >
                  <Icon name="skipEx" size={16} />
                </button>
                <button
                  type="button"
                  className="sk-act wk-act-log"
                  onClick={() => deckRef.current?.swipe("right")}
                  disabled={!current || !!rest || finishing}
                  aria-label="Log this set"
                >
                  <Icon name="check" size={24} stroke={2.4} />
                </button>
              </div>
              <p
                style={{
                  position: "relative",
                  margin: "14px 0 0",
                  textAlign: "center",
                  fontSize: 12,
                  color: "rgba(255,255,255,0.5)",
                }}
              >
                {finishing ? "Saving your workout…" : "Swipe right to log, left to skip"}
              </p>
            </>
          )}
        </div>
      </div>

      {endSheet && (
        <>
          <div className="sk-backdrop" style={{ zIndex: 70 }} onClick={() => setEndSheet(false)} />
          <div
            role="dialog"
            aria-modal="true"
            aria-label="End workout"
            className="sk-sheet"
            style={{ zIndex: 71 }}
          >
            <div className="sk-sheet-handle" style={{ marginBottom: 22 }} />
            <h2 style={{ margin: 0, fontSize: 20, fontWeight: 600, letterSpacing: "-0.02em" }}>
              End this workout?
            </h2>
            <p style={{ margin: "6px 0 22px", fontSize: 14, color: MUTED }}>
              {doneCount} of {deck.length} sets logged · {elapsedNowStatic}
            </p>
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              <button
                type="button"
                className="sk-btn sk-btn-light"
                onClick={() => setEndSheet(false)}
              >
                Keep going
              </button>
              <button
                type="button"
                className="sk-btn sk-btn-quiet"
                onClick={finish}
                disabled={finishing}
              >
                Finish and review
              </button>
              <button type="button" className="sk-btn sk-btn-danger" onClick={discard}>
                Discard workout
              </button>
            </div>
          </div>
        </>
      )}

      {replacing && uid && (
        <SubstitutionModal
          originalExerciseId={replacing.we.exercise_id}
          originalExerciseName={replacing.we.exercises.name}
          onClose={() => setReplacing(null)}
          onSelect={async (newExerciseId) => {
            const card = replacing;
            try {
              const ready = readyRef.current ? await readyRef.current : null;
              await replaceSessionExercise(
                uid,
                ready?.sessionId ?? null,
                card.we.id,
                card.we.exercise_id,
                newExerciseId,
              );
              for (const k of Object.keys(overrides.current))
                if (k.startsWith(`${card.we.id}:`)) delete overrides.current[k];
              await qc.invalidateQueries({ queryKey: ["day", slug] });
              setReplacing(null);
              notify.success("Exercise swapped for this and future workouts");
            } catch (err) {
              notify.error((err as Error).message);
            }
          }}
        />
      )}
    </>,
    document.body,
  );
}

/** Ticks on its own so the rest of the screen doesn't re-render every second. */
function Clock({ since }: { since: number }) {
  const [, tick] = useReducer((x: number) => x + 1, 0);
  useEffect(() => {
    const id = setInterval(tick, 1000);
    return () => clearInterval(id);
  }, []);
  return (
    <p
      className="sk-num"
      style={{ margin: "2px 0 0", fontSize: 17, fontWeight: 500, letterSpacing: 0 }}
      aria-label="Elapsed time"
    >
      {elapsedLabel(Math.max(0, Math.floor((Date.now() - since) / 1000)))}
    </p>
  );
}

function RestOverlay({
  rest,
  nextName,
  nextMeta,
  onChange,
  onDone,
}: {
  rest: Rest;
  nextName: string | undefined;
  nextMeta: string | undefined;
  onChange: (r: Rest | null) => void;
  onDone: () => void;
}) {
  const [now, setNow] = useState(() => Date.now());
  const doneRef = useRef(false);
  const left = Math.max(0, Math.min(rest.total, Math.ceil((rest.endsAt - now) / 1000)));

  useEffect(() => {
    const id = setInterval(() => setNow(Date.now()), 250);
    // Timestamp-based, so locking the screen doesn't pause it; refresh when the app returns.
    const onVisibility = () => {
      setNow(Date.now());
      const remaining = Math.ceil((rest.endsAt - Date.now()) / 1000);
      if (document.visibilityState === "hidden" && remaining > 0) {
        showWorkoutNotification({
          title: `⏳ Rest Timer: ${mmss(remaining)}`,
          body: nextName ? `Next: ${nextName}` : "Active Workout Session",
          tag: "active-workout",
        });
      }
    };
    document.addEventListener("visibilitychange", onVisibility);
    return () => {
      clearInterval(id);
      document.removeEventListener("visibilitychange", onVisibility);
    };
  }, [rest.endsAt, nextName]);

  useEffect(() => {
    if (left > 0 || doneRef.current) return;
    doneRef.current = true;
    showWorkoutNotification({
      title: "🔔 Rest Time Over!",
      body: nextName ? `Time for your next set of ${nextName}!` : "Time to start your next set!",
      tag: "rest-timer-finish",
    });
    onDone();
  }, [left, nextName, onDone]);

  return (
    <div role="timer" aria-label="Rest timer" className="wk-rest" data-swipe-surface>
      <span className="sk-eyebrow">Rest</span>
      <div
        style={{
          position: "relative",
          width: 200,
          height: 200,
          margin: "20px 0 24px",
          animation: "sk-scaleIn .5s cubic-bezier(.2,.8,.2,1)",
        }}
      >
        <svg
          aria-hidden="true"
          width="200"
          height="200"
          viewBox="0 0 200 200"
          style={{ transform: "rotate(-90deg)" }}
        >
          <circle
            cx="100"
            cy="100"
            r="92"
            fill="none"
            stroke="rgba(255,255,255,0.07)"
            strokeWidth="3"
          />
          <defs>
            <linearGradient id="wk-rest-ring" x1="0" y1="0" x2="1" y2="1">
              <stop offset="0" stopColor="#FFFFFF" />
              <stop offset="1" stopColor="#C6F432" />
            </linearGradient>
          </defs>
          <circle
            cx="100"
            cy="100"
            r="92"
            fill="none"
            stroke="url(#wk-rest-ring)"
            strokeWidth="3.5"
            strokeLinecap="round"
            strokeDasharray="578.1"
            strokeDashoffset={Math.round(578.1 * (1 - left / rest.total) * 10) / 10}
            style={{ transition: "stroke-dashoffset .3s linear" }}
          />
        </svg>
        <div
          style={{
            position: "absolute",
            inset: 0,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            justifyContent: "center",
          }}
        >
          <span className="sk-num" style={{ fontSize: 52, fontWeight: 300, lineHeight: 1 }}>
            {mmss(left)}
          </span>
          <span style={{ fontSize: 12, color: "rgba(255,255,255,0.56)", marginTop: 8 }}>
            of {mmss(rest.total)}
          </span>
        </div>
      </div>
      <div style={{ display: "flex", gap: 8, marginBottom: 28 }}>
        <button
          type="button"
          className="sk-icon-btn"
          onClick={() => {
            const ends = rest.endsAt - 15000;
            onChange(ends <= Date.now() ? null : { ...rest, endsAt: ends });
          }}
          style={{ height: 38, padding: "0 16px", fontSize: 13 }}
        >
          −15s
        </button>
        <button
          type="button"
          className="sk-icon-btn"
          onClick={() => onChange({ endsAt: rest.endsAt + 15000, total: rest.total + 15 })}
          style={{ height: 38, padding: "0 16px", fontSize: 13 }}
        >
          +15s
        </button>
        <button
          type="button"
          className="sk-icon-btn"
          onClick={() => onChange(null)}
          style={{
            height: 38,
            padding: "0 18px",
            fontSize: 13,
            fontWeight: 500,
            background: "#FFFFFF",
            color: "#0F0F10",
            borderColor: "transparent",
          }}
        >
          Skip rest
        </button>
      </div>
      {nextName && (
        <div style={{ width: "100%", maxWidth: 300, textAlign: "center" }}>
          <p className="sk-cap" style={{ margin: 0 }}>
            Up next
          </p>
          <p style={{ margin: "6px 0 0", fontSize: 15, fontWeight: 500 }}>{nextName}</p>
          {nextMeta && (
            <p
              className="sk-num"
              style={{ margin: "3px 0 0", fontSize: 13, color: MUTED, letterSpacing: 0 }}
            >
              {nextMeta}
            </p>
          )}
        </div>
      )}
    </div>
  );
}

/** The design's "Plan day" page: what's in the session, and Start. */
function PlanDay({
  plan,
  onStart,
  completedSessionId,
  onBack,
}: {
  plan: DayWithExercises;
  onStart: () => void;
  completedSessionId: string | null;
  onBack: () => void;
}) {
  const { day, exercises } = plan;
  const dow = new Date().getDay();
  const isToday = day.day_of_week === dow;
  const sets = exercises.reduce(
    (a, we) => a + (we.exercises.category === "cardio" ? 1 : we.sets),
    0,
  );
  const note = [
    day.notes,
    day.cardio_note ? `Cardio: ${day.cardio_note.replace(/\.$/, "")}.` : null,
  ]
    .filter(Boolean)
    .join(" ");

  return (
    <div className="sk-fade">
      <SubHeader
        eyebrow={isToday ? "Today" : day.name}
        title={day.is_rest ? "Rest day" : (day.focus ?? day.name)}
        onBack={onBack}
      />
      {!day.is_rest && (
        <div style={{ display: "flex", gap: 8, flexWrap: "wrap", marginBottom: 20 }}>
          {day.estimated_minutes_min != null && day.estimated_minutes_max != null && (
            <span className="sk-pill">
              {day.estimated_minutes_min}–{day.estimated_minutes_max} min
            </span>
          )}
          <span className="sk-pill">{exercises.length} exercises</span>
          <span className="sk-pill">{sets} sets</span>
        </div>
      )}
      {note && (
        <p style={{ margin: "0 0 18px", fontSize: 13.5, lineHeight: 1.55, color: MUTED }}>{note}</p>
      )}
      {exercises.length > 0 && (
        <div
          className="sk-surface"
          style={{ borderRadius: 20, overflow: "hidden", marginBottom: 24 }}
        >
          {exercises.map((we, i) => {
            const ex = we.exercises;
            const cardio = ex.category === "cardio";
            const meta = cardio
              ? (ex.equipment ?? "Cardio")
              : [
                  ex.primary_muscle,
                  ex.equipment,
                  we.rir_target ? `${we.rir_target} RIR` : null,
                  we.rest_note ? `rest ${we.rest_note}` : null,
                ]
                  .filter(Boolean)
                  .join(" · ");
            return (
              <div key={we.id} style={{ padding: 16, borderTop: i ? LINE : "none" }}>
                <div style={{ display: "flex", alignItems: "baseline", gap: 12 }}>
                  <span
                    className="sk-num"
                    style={{
                      width: 18,
                      fontSize: 12,
                      color: "rgba(255,255,255,0.5)",
                      letterSpacing: 0,
                    }}
                  >
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  <span style={{ flex: 1, minWidth: 0, fontSize: 14.5, fontWeight: 500 }}>
                    {ex.name}
                  </span>
                  <span
                    className="sk-num"
                    style={{
                      fontSize: 13,
                      color: "rgba(255,255,255,0.78)",
                      letterSpacing: 0,
                      whiteSpace: "nowrap",
                    }}
                  >
                    {cardio ? we.rep_range : `${we.sets} × ${we.rep_range}`}
                  </span>
                </div>
                {meta && (
                  <p
                    style={{
                      margin: "6px 0 0 30px",
                      fontSize: 12.5,
                      color: "rgba(255,255,255,0.56)",
                    }}
                  >
                    {meta}
                  </p>
                )}
                {we.notes && (
                  <p
                    style={{
                      margin: "6px 0 0 30px",
                      fontSize: 12.5,
                      color: "rgba(255,255,255,0.72)",
                    }}
                  >
                    {we.notes}
                  </p>
                )}
              </div>
            );
          })}
        </div>
      )}
      {completedSessionId ? (
        <Link to="/history/$id" params={{ id: completedSessionId }} className="sk-btn sk-btn-quiet">
          <Icon name="check" size={16} color={ACCENT} /> Completed today · view session
        </Link>
      ) : (
        !day.is_rest && (
          <button type="button" className="sk-btn sk-btn-accent" onClick={onStart}>
            {isToday ? "Start today's workout" : `Start ${day.name}'s workout`}
          </button>
        )
      )}
    </div>
  );
}

function DoneScreen({
  summary,
  day,
  firstName,
  sessionId,
}: {
  summary: Summary;
  day: DayWithExercises["day"];
  firstName: string;
  sessionId: string | null;
}) {
  const router = useRouter();
  const qc = useQueryClient();
  const { user } = useAuth();
  const [feel, setFeel] = useState<number | null>(null);
  const [saving, setSaving] = useState(false);
  const vol = fmtVolume(summary.volume);
  const headline = summary.prs.length
    ? "A new personal best."
    : summary.logged >= summary.total * 0.9
      ? `Well done, ${firstName}.`
      : summary.logged
        ? "Good work today."
        : "Session ended.";
  const stats = [
    { label: "Duration", value: fmtDuration(summary.duration), unit: "" },
    { label: "Sets", value: String(summary.logged), unit: `of ${summary.total}` },
    { label: "Volume", value: vol.value, unit: vol.unit },
    { label: "Records", value: String(summary.prs.length), unit: "" },
  ];

  async function save() {
    setSaving(true);
    try {
      if (sessionId && feel) await saveSessionMood(sessionId, FEELS[feel - 1]!);
      await qc.invalidateQueries({ queryKey: ["history", user?.id] });
      router.navigate({ to: "/" });
    } catch (e) {
      notify.error((e as Error).message);
      setSaving(false);
    }
  }

  return (
    <div className="wk-done">
      <div className="wk-done-inner">
        <div
          aria-hidden="true"
          style={{
            position: "absolute",
            left: "50%",
            top: 0,
            width: 560,
            height: 360,
            marginLeft: -280,
            background:
              "radial-gradient(ellipse at 50% 20%, rgba(198,244,50,0.09), transparent 70%)",
            pointerEvents: "none",
          }}
        />
        <div
          style={{
            position: "relative",
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            textAlign: "center",
          }}
        >
          <svg aria-hidden="true" width="72" height="72" viewBox="0 0 120 120">
            <circle
              cx="60"
              cy="60"
              r="54"
              fill="none"
              stroke="rgba(255,255,255,0.07)"
              strokeWidth="2"
            />
            <circle
              cx="60"
              cy="60"
              r="54"
              fill="none"
              stroke="#C6F432"
              strokeWidth="2"
              strokeLinecap="round"
              strokeDasharray="340"
              style={{
                transform: "rotate(-90deg)",
                transformOrigin: "center",
                animation: "sk-draw 1s cubic-bezier(.4,0,.2,1) both",
              }}
            />
            <polyline
              points="42,61 54,73 79,47"
              fill="none"
              stroke="#C6F432"
              strokeWidth="3"
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeDasharray="60"
              style={{ animation: "sk-drawTick .5s cubic-bezier(.4,0,.2,1) .8s both" }}
            />
          </svg>
          <p className="sk-eyebrow sk-fade" style={{ margin: "24px 0 0", animationDelay: ".3s" }}>
            Session complete
          </p>
          <h1
            className="sk-fade sk-lime-text"
            style={{
              margin: "8px 0 0",
              fontSize: 28,
              lineHeight: 1.15,
              fontWeight: 600,
              letterSpacing: "-0.03em",
              animationDelay: ".36s",
            }}
          >
            {headline}
          </h1>
          <p
            className="sk-fade"
            style={{ margin: "6px 0 0", fontSize: 14, color: MUTED, animationDelay: ".42s" }}
          >
            {day.name} · {day.focus ?? ""}
          </p>
        </div>

        <div
          className="sk-fade sk-surface sk-grid2"
          style={{ position: "relative", margin: "32px 0 16px", animationDelay: ".5s" }}
        >
          {stats.map((s) => (
            <div key={s.label} style={{ padding: 18 }}>
              <p className="sk-cap" style={{ margin: 0 }}>
                {s.label}
              </p>
              <p
                className="sk-num"
                style={{ margin: "8px 0 0", fontSize: 30, lineHeight: 1, fontWeight: 400 }}
              >
                {s.value}
                {s.unit && (
                  <span
                    style={{
                      fontSize: 14,
                      marginLeft: 4,
                      color: "rgba(255,255,255,0.56)",
                      letterSpacing: 0,
                    }}
                  >
                    {s.unit}
                  </span>
                )}
              </p>
            </div>
          ))}
        </div>

        {summary.prs.length > 0 && (
          <div
            className="sk-fade"
            style={{
              position: "relative",
              marginBottom: 16,
              padding: "16px 18px",
              borderRadius: 20,
              border: "1px solid rgba(198,244,50,0.22)",
              background: "rgba(198,244,50,0.05)",
              animationDelay: ".56s",
            }}
          >
            <p className="sk-cap" style={{ margin: 0, color: ACCENT }}>
              New personal record
            </p>
            {summary.prs.map((pr) => (
              <p key={pr.name + pr.detail} style={{ margin: "8px 0 0", fontSize: 14 }}>
                <span style={{ fontWeight: 500 }}>{pr.name}</span>{" "}
                {pr.detail && <span style={{ color: MUTED }}>· {pr.detail}</span>}
              </p>
            ))}
          </div>
        )}

        <section
          className="sk-fade"
          aria-label="Exercise summary"
          style={{ position: "relative", marginBottom: 28, animationDelay: ".62s" }}
        >
          <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
            {summary.byEx.map((de, i) => (
              <div
                key={de.id}
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: 14,
                  padding: "13px 18px",
                  borderTop: i ? LINE : "none",
                }}
              >
                <span
                  style={{
                    width: 6,
                    height: 6,
                    borderRadius: 999,
                    background: de.dot,
                    flexShrink: 0,
                  }}
                />
                <div style={{ flex: 1, minWidth: 0 }}>
                  <p style={{ margin: 0, fontSize: 14, fontWeight: 500 }}>{de.name}</p>
                  <p
                    className="sk-num"
                    style={{
                      margin: "2px 0 0",
                      fontSize: 12.5,
                      color: "rgba(255,255,255,0.56)",
                      letterSpacing: 0,
                    }}
                  >
                    {de.sets}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </section>

        <section
          className="sk-fade"
          aria-label="How did it feel"
          style={{ position: "relative", marginBottom: 28, animationDelay: ".68s" }}
        >
          <h2 className="sk-h-section" style={{ margin: "0 0 12px" }}>
            How did it feel?
          </h2>
          <div style={{ display: "flex", gap: 6 }}>
            {FEELS.map((label, i) => (
              <button
                key={label}
                type="button"
                className="wk-feel"
                aria-pressed={feel === i + 1}
                onClick={() => setFeel(i + 1)}
              >
                {label}
              </button>
            ))}
          </div>
        </section>

        <button
          type="button"
          className="sk-btn sk-btn-light sk-fade"
          onClick={save}
          disabled={saving}
          style={{ position: "relative", animationDelay: ".74s" }}
        >
          {saving ? "Saving…" : "Save to history"}
        </button>
      </div>
    </div>
  );
}
