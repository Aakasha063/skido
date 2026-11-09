import { createFileRoute, Link, useRouter } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useCallback, useEffect, useMemo, useReducer, useRef, useState } from "react";
import { createPortal } from "react-dom";
import { toast } from "sonner";
import { Check, ChevronLeft, Info, Undo2, X } from "lucide-react";
import { AppShell } from "@/components/AppShell";
import { RestTimer } from "@/components/RestTimer";
import { ExerciseInstructions } from "@/components/ExerciseInstructions";
import { HIITInstructions } from "@/components/HIITInstructions";
import { WorkoutSkeleton } from "@/components/Skeleton";
import { SubstitutionModal } from "@/components/SubstitutionModal";
import {
  SwipeDeck,
  type SwipeDeckHandle,
  type SwipeDirection,
} from "@/components/workout/SwipeDeck";
import { SetCard } from "@/components/workout/SetCard";
import { useAuth } from "@/lib/auth";
import {
  dayQueryKey,
  deleteSet,
  ensureExerciseSessionMap,
  fetchDayWithExercises,
  fetchRecentSetsForExercises,
  fetchTodayLiveSession,
  finishSession,
  logSet,
  replaceSessionExercise,
  startLiveSession,
  type DayWithExercises,
  type Exercise,
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
import { mmss } from "@/lib/format";
import { clearWorkoutNotification, showWorkoutNotification } from "@/lib/notifications";

export const Route = createFileRoute("/workout/$slug")({
  validateSearch: (search: Record<string, unknown>): { start?: boolean } => {
    return {
      start: search["start"] === true || search["start"] === "true",
    };
  },
  head: () => ({
    meta: [
      { title: "Live Session — Skido" },
      {
        name: "description",
        content: "Run your workout one set at a time: swipe right to log, left to skip.",
      },
      { property: "og:title", content: "Live Session — Skido" },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: () => (
    <AppShell>
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
};
type Result = DoneResult | { status: "skipped" };
type Log = { results: Record<string, Result>; order: string[] };
type Ready = { sessionId: string; exerciseSessionIds: ExerciseSessionMap };
type Phase = "loading" | "overview" | "active" | "completed";
type Summary = {
  title: string;
  duration: string;
  sets: number;
  skipped: number;
  volume: number;
  prs: number;
};

const EMPTY_LOG: Log = { results: {}, order: [] };
const isDone = (r: Result | undefined): r is DoneResult => r?.status === "done";
const fmtNum = (v: number) => (Number.isInteger(v) ? String(v) : v.toFixed(1));

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

function vibrate(ms: number) {
  if (typeof navigator !== "undefined" && navigator.vibrate) navigator.vibrate(ms);
}

function WorkoutPage() {
  const { slug } = Route.useParams();
  const search = Route.useSearch();
  const { user } = useAuth();
  const uid = user?.id;
  const qc = useQueryClient();
  const router = useRouter();

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

  const deck = useMemo(() => buildDeck(plan?.exercises ?? []), [plan]);
  const deckKeys = useMemo(() => new Set(deck.map((c) => c.key)), [deck]);

  const [phase, setPhase] = useState<Phase>("loading");
  const [log, setLog] = useState<Log>(EMPTY_LOG);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [ownExerciseSessionIds, setOwnExerciseSessionIds] = useState<Set<string>>(() => new Set());
  const [startedAt, setStartedAt] = useState(() => Date.now());
  const [completedDuration, setCompletedDuration] = useState<number | null>(null);
  const [rest, setRest] = useState<{
    seconds: number;
    key: number;
    next: string | undefined;
  } | null>(null);
  const [info, setInfo] = useState<Exercise | null>(null);
  const [replacing, setReplacing] = useState<Card | null>(null);
  const [finishing, setFinishing] = useState(false);
  const [summary, setSummary] = useState<Summary | null>(null);

  const readyRef = useRef<Promise<Ready> | null>(null);
  const startFailed = useRef(false);
  const overrides = useRef<Record<string, LoggedValues>>({});
  const initialized = useRef(false);
  const deckRef = useRef<SwipeDeckHandle>(null);
  /** Set saves/removals still on their way to the server. */
  const pendingWrites = useRef(0);
  const track = useCallback(<T,>(p: Promise<T>) => {
    pendingWrites.current++;
    p.finally(() => pendingWrites.current--).catch(() => undefined);
    return p;
  }, []);

  // Swipes are saved in the background; warn before the tab is closed mid-save.
  useEffect(() => {
    const onBeforeUnload = (e: BeforeUnloadEvent) => {
      if (pendingWrites.current > 0) e.preventDefault();
    };
    window.addEventListener("beforeunload", onBeforeUnload);
    return () => window.removeEventListener("beforeunload", onBeforeUnload);
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

  const remaining = useMemo(() => deck.filter((c) => !log.results[c.key]), [deck, log]);
  const doneCount = useMemo(() => Object.values(log.results).filter(isDone).length, [log]);
  const skippedCount = log.order.length - doneCount;

  const adoptLive = useCallback((live: LiveSession, p: DayWithExercises, userId: string) => {
    setSessionId(live.id);
    setStartedAt(new Date(live.started_at).getTime());
    setCompletedDuration(live.duration_seconds);
    setLog(logFromServer(live, new Set(buildDeck(p.exercises).map((c) => c.key))));
    if (live.status !== "completed") {
      const ready = ensureExerciseSessionMap(
        userId,
        live.id,
        p.exercises,
        live.exercise_sessions,
      ).then((exerciseSessionIds) => ({ sessionId: live.id, exerciseSessionIds }));
      ready.catch((e: Error) => toast.error(e.message || "Couldn't reconnect to your workout"));
      readyRef.current = ready;
    }
  }, []);

  const start = useCallback(() => {
    if (!uid) {
      toast.info("Sign in to start and save workouts");
      router.navigate({ to: "/auth" });
      return;
    }
    if (!plan || readyRef.current) return;
    startFailed.current = false;
    setPhase("active");
    setStartedAt(Date.now());

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
        toast.error(err?.message || "Couldn't start the workout");
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
    if (search.start) start();
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
        setLog((prev) => ({
          results: { ...prev.results, [key]: { status: "skipped" } },
          order: [...prev.order, key],
        }));
        // A running rest timer keeps going: skipping a set doesn't mean you've recovered.
        vibrate(8);
        return;
      }

      const values = { ...defaultsFor(card), ...overrides.current[key] };
      if (card.isCardio) values.weight = null;
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
        toast.error("Couldn't save that set — it's back on top.");
        setLog((prev) => {
          const cur = prev.results[key];
          if (!isDone(cur) || cur.saved !== saved) return prev;
          const { [key]: _removed, ...results } = prev.results;
          return { results, order: prev.order.filter((k) => k !== key) };
        });
        return null;
      });

      setLog((prev) => ({
        results: {
          ...prev.results,
          [key]: { status: "done", weight: values.weight, reps: values.reps, saved },
        },
        order: [...prev.order, key],
      }));
      vibrate(12);

      const next = remaining.find((c) => c.key !== key);
      const restSeconds = card.we.rest_seconds ?? 0;
      setRest(
        restSeconds > 0 && next
          ? { seconds: restSeconds, key: Date.now(), next: next.we.exercises.name }
          : null,
      );
    },
    [defaultsFor, remaining, uid, track],
  );

  const undo = useCallback(() => {
    const key = log.order[log.order.length - 1];
    if (!key) return;
    const res = log.results[key];
    const { [key]: _removed, ...results } = log.results;
    setLog({ results, order: log.order.slice(0, -1) });
    setRest(null);
    if (isDone(res)) {
      overrides.current[key] = { weight: res.weight, reps: res.reps };
      track(res.saved.then((id) => (id ? deleteSet(id) : undefined))).catch(() =>
        toast.error("Couldn't remove that set from your log"),
      );
    }
  }, [log, track]);

  const finish = useCallback(async () => {
    if (!uid || !plan || finishing) return;
    const ready = readyRef.current;
    if (!ready) return;
    setFinishing(true);
    try {
      const { sessionId: sid } = await ready;
      // Wait for every in-flight set so PRs are evaluated on the complete workout.
      const done = Object.values(log.results).filter(isDone);
      const settled = await Promise.all(done.map(async (r) => ({ r, id: await r.saved })));
      const kept = settled.filter((x) => x.id).map((x) => x.r);
      const duration = Math.round((Date.now() - startedAt) / 1000);
      const prs = await finishSession({ userId: uid, sessionId: sid, durationSeconds: duration });
      clearWorkoutNotification();
      try {
        localStorage.removeItem(skipsKey(sid));
      } catch {
        // ignore
      }
      setRest(null);
      setSummary({
        title: plan.day.focus ?? plan.day.name,
        duration: mmss(duration),
        sets: kept.length,
        skipped: skippedCount,
        volume: kept.reduce((sum, r) => sum + (r.weight ?? 0) * r.reps, 0),
        prs: prs.length,
      });
      qc.invalidateQueries();
    } catch (e) {
      toast.error((e as Error).message || "Couldn't finish the workout");
    } finally {
      setFinishing(false);
    }
  }, [uid, plan, finishing, log, startedAt, skippedCount, qc]);

  const requestEnd = useCallback(() => {
    if (
      remaining.length === 0 ||
      window.confirm(`${remaining.length} sets left. Finish the workout now?`)
    ) {
      finish();
    }
  }, [remaining.length, finish]);

  const dismissRest = useCallback(() => setRest(null), []);

  // Keyboard: → log, ← skip, ⌘/Ctrl+Z undo.
  useEffect(() => {
    if (phase !== "active" || summary) return;
    const onKey = (e: KeyboardEvent) => {
      if (info || replacing) return;
      const target = e.target as HTMLElement;
      if (target.closest("input, textarea, select, [contenteditable='true'], [role='slider']"))
        return;
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
  }, [phase, summary, info, replacing, undo]);

  // Lock-screen progress notification while a workout is running.
  const progressRef = useRef({ done: 0, total: 0, name: "", startedAt });
  progressRef.current = {
    done: log.order.length,
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
    if (phase !== "active") return;
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = prev;
    };
  }, [phase]);

  if (planQ.isLoading || (plan && phase === "loading")) return <WorkoutSkeleton />;

  if (!plan) {
    return (
      <div className="wk-overview">
        <h1 className="wk-overview-title">Workout not found</h1>
        <p className="wk-overview-meta">This day isn't part of your plan.</p>
        <Link to="/plan" className="wk-cta" style={{ marginTop: 20 }}>
          Back to plan
        </Link>
      </div>
    );
  }

  if (summary && typeof document !== "undefined") {
    return createPortal(
      <SummaryScreen summary={summary} onDone={() => router.navigate({ to: "/history" })} />,
      document.body,
    );
  }

  const modals = (
    <>
      <ExerciseInstructions
        exercise={info}
        open={!!info}
        onOpenChange={(v) => !v && setInfo(null)}
      />
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
              for (const k of Object.keys(overrides.current)) {
                if (k.startsWith(`${card.we.id}:`)) delete overrides.current[k];
              }
              await qc.invalidateQueries({ queryKey: ["day", slug] });
              setReplacing(null);
              toast.success("Exercise swapped for this and future workouts");
            } catch (err) {
              toast.error((err as Error).message);
            }
          }}
        />
      )}
    </>
  );

  if (phase === "overview" || phase === "loading") {
    return (
      <>
        <Overview
          plan={plan}
          deckSize={deck.length}
          onStart={start}
          onBack={() => router.history.back()}
          onInfo={setInfo}
        />
        {modals}
      </>
    );
  }

  if (phase === "completed") {
    return (
      <CompletedView
        plan={plan}
        log={log}
        sessionId={sessionId}
        duration={completedDuration}
        onBack={() => router.history.back()}
      />
    );
  }

  const handled = log.order.length;
  const pct = deck.length ? Math.round((handled / deck.length) * 100) : 0;
  const upNext = remaining[1];
  const current = remaining[0];

  return createPortal(
    <>
      <div
        className="wk-layer"
        role="dialog"
        aria-modal="true"
        aria-label={`${plan.day.name} workout`}
      >
        <header className="wk-header">
          <div className="wk-header-row">
            <button
              type="button"
              className="wk-icon-btn is-ghost"
              onClick={() => router.history.back()}
              aria-label="Leave the workout screen (your progress is saved)"
            >
              <ChevronLeft size={22} />
            </button>
            <div className="wk-header-title">
              <p>{plan.day.name}</p>
              <h1>{plan.day.focus ?? plan.day.name}</h1>
            </div>
            <div className="wk-header-stats">
              <Clock since={startedAt} />
              <span>
                {handled}/{deck.length} sets
              </span>
            </div>
            <button type="button" className="wk-end-btn" onClick={requestEnd} disabled={finishing}>
              {finishing ? "…" : "End"}
            </button>
          </div>
          <div className="wk-progress" aria-hidden>
            <div style={{ width: `${pct}%` }} />
          </div>
          {rest && (
            <div className="wk-rest-slot">
              <RestTimer
                inline
                key={rest.key}
                seconds={rest.seconds}
                exerciseName={rest.next}
                onDismiss={dismissRest}
              />
            </div>
          )}
        </header>

        {deck.length === 0 ? (
          <div className="wk-freeform">
            {plan.day.slug === "saturday-hiit" ? (
              <HIITInstructions />
            ) : (
              <p className="wk-overview-meta">
                {plan.day.notes ?? plan.day.cardio_note ?? "Nothing to log today."}
              </p>
            )}
            <button type="button" className="wk-cta" onClick={finish} disabled={finishing}>
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
              disabled={finishing}
              renderCard={(card, { depth }) => (
                <SetCard
                  key={card.we.exercise_id}
                  card={card}
                  depth={depth}
                  defaults={defaultsFor(card)}
                  initial={overrides.current[card.key]}
                  previous={previousByExercise[card.we.exercise_id]}
                  onChange={(v) => {
                    overrides.current[card.key] = v;
                  }}
                  onInfo={() => setInfo(card.we.exercises)}
                  onReplace={() => setReplacing(card)}
                />
              )}
              empty={
                <EndCard
                  done={doneCount}
                  skipped={skippedCount}
                  finishing={finishing}
                  onFinish={finish}
                  onUndo={undo}
                />
              }
            />
            <div className="wk-actions">
              <button
                type="button"
                className="wk-btn wk-btn-skip"
                onClick={() => deckRef.current?.swipe("left")}
                disabled={!current || finishing}
                aria-label="Skip this set"
              >
                <X size={26} strokeWidth={2.5} />
              </button>
              <button
                type="button"
                className="wk-btn wk-btn-undo"
                onClick={undo}
                disabled={handled === 0 || finishing}
                aria-label="Undo the last card"
              >
                <Undo2 size={20} />
              </button>
              <button
                type="button"
                className="wk-btn wk-btn-done"
                onClick={() => deckRef.current?.swipe("right")}
                disabled={!current || finishing}
                aria-label="Log this set"
              >
                <Check size={30} strokeWidth={3} />
              </button>
            </div>
            <p className="wk-next">
              {upNext
                ? `Up next · ${upNext.we.exercises.name}${upNext.isCardio ? "" : ` · set ${upNext.setNumber}`}`
                : current
                  ? "Last card"
                  : " "}
            </p>
            <p className="sr-only" aria-live="polite">
              {current
                ? `${current.we.exercises.name}${current.isCardio ? "" : `, set ${current.setNumber} of ${current.totalSets}`}`
                : "All sets done"}
            </p>
          </>
        )}
      </div>
      {modals}
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
  return <strong className="wk-clock">{mmss((Date.now() - since) / 1000)}</strong>;
}

function Overview({
  plan,
  deckSize,
  onStart,
  onBack,
  onInfo,
}: {
  plan: DayWithExercises;
  deckSize: number;
  onStart: () => void;
  onBack: () => void;
  onInfo: (e: Exercise) => void;
}) {
  const { day, exercises } = plan;
  const meta = [
    `${exercises.length} exercise${exercises.length === 1 ? "" : "s"}`,
    `${deckSize} card${deckSize === 1 ? "" : "s"}`,
    day.cardio_note,
  ]
    .filter(Boolean)
    .join(" · ");

  return (
    <div className="wk-overview page-enter">
      <button type="button" className="wk-back" onClick={onBack}>
        <ChevronLeft size={18} /> Back
      </button>
      <p className="wk-eyebrow">{day.name}</p>
      <h1 className="wk-overview-title">{day.is_rest ? "Rest day" : (day.focus ?? day.name)}</h1>
      <p className="wk-overview-meta">{meta}</p>

      {exercises.length > 0 && (
        <ol className="wk-ov-list">
          {exercises.map((we, i) => (
            <li key={we.id} className="wk-ov-item">
              <span className="wk-ov-idx">{i + 1}</span>
              <div className="wk-ov-text">
                <p className="wk-ov-name">{we.exercises.name}</p>
                <p className="wk-ov-sub">
                  {we.exercises.category === "cardio"
                    ? we.rep_range
                    : `${we.sets} × ${we.rep_range}`}
                </p>
              </div>
              <button
                type="button"
                className="wk-icon-btn"
                onClick={() => onInfo(we.exercises)}
                aria-label={`How to do ${we.exercises.name}`}
              >
                <Info size={17} />
              </button>
            </li>
          ))}
        </ol>
      )}

      {!day.is_rest && (
        <div className="wk-ov-cta">
          <button type="button" className="wk-cta" onClick={onStart}>
            Start workout
          </button>
          <p>Each set is a card: swipe right to log it, left to skip.</p>
        </div>
      )}
    </div>
  );
}

function EndCard(props: {
  done: number;
  skipped: number;
  finishing: boolean;
  onFinish: () => void;
  onUndo: () => void;
}) {
  return (
    <div className="wk-end">
      <div className="wk-end-icon">
        <Check size={34} strokeWidth={3} />
      </div>
      <h2>Every set handled</h2>
      <p>
        {props.done} logged{props.skipped ? ` · ${props.skipped} skipped` : ""}
      </p>
      <button type="button" className="wk-cta" onClick={props.onFinish} disabled={props.finishing}>
        {props.finishing ? "Finishing…" : "Finish workout"}
      </button>
      <button
        type="button"
        className="wk-text-btn"
        onClick={props.onUndo}
        disabled={props.finishing}
      >
        Undo last card
      </button>
    </div>
  );
}

function CompletedView({
  plan,
  log,
  sessionId,
  duration,
  onBack,
}: {
  plan: DayWithExercises;
  log: Log;
  sessionId: string | null;
  duration: number | null;
  onBack: () => void;
}) {
  const done = Object.values(log.results).filter(isDone);
  return (
    <div className="wk-overview page-enter">
      <button type="button" className="wk-back" onClick={onBack}>
        <ChevronLeft size={18} /> Back
      </button>
      <p className="wk-eyebrow is-accent">✓ Completed today</p>
      <h1 className="wk-overview-title">{plan.day.focus ?? plan.day.name}</h1>
      <p className="wk-overview-meta">
        {duration ? `${mmss(duration)} · ` : ""}
        {done.length} sets logged
      </p>
      <ol className="wk-ov-list">
        {plan.exercises.map((we, i) => {
          const sets = Object.entries(log.results)
            .filter(([k, r]) => k.startsWith(`${we.id}:`) && isDone(r))
            .map(([k, r]) => ({ n: Number(k.split(":")[1]), r: r as DoneResult }))
            .sort((a, b) => a.n - b.n);
          const isCardio = we.exercises.category === "cardio";
          return (
            <li key={we.id} className="wk-ov-item">
              <span className="wk-ov-idx">{i + 1}</span>
              <div className="wk-ov-text">
                <p className="wk-ov-name">{we.exercises.name}</p>
                <p className="wk-ov-sub">
                  {sets.length === 0
                    ? "Not logged"
                    : sets
                        .map(({ r }) =>
                          isCardio ? `${r.reps} min` : `${fmtNum(r.weight ?? 0)}×${r.reps}`,
                        )
                        .join("  ·  ")}
                </p>
              </div>
            </li>
          );
        })}
      </ol>
      {sessionId && (
        <div className="wk-ov-cta">
          <Link to="/history/$id" params={{ id: sessionId }} className="wk-cta is-secondary">
            View full log
          </Link>
        </div>
      )}
    </div>
  );
}

function SummaryScreen({ summary, onDone }: { summary: Summary; onDone: () => void }) {
  const stats = [
    { label: "Sets", value: String(summary.sets) },
    { label: "Volume", value: `${fmtNum(summary.volume)} kg` },
    { label: "PRs", value: String(summary.prs), accent: true },
    { label: "Skipped", value: String(summary.skipped) },
  ];
  return (
    <div className="wk-summary">
      <div className="wk-summary-inner">
        <p className="wk-eyebrow is-accent">Workout complete</p>
        <h1 className="wk-overview-title">{summary.title}</h1>
        <p className="wk-summary-time">{summary.duration}</p>
        <div className="wk-summary-grid">
          {stats.map((s) => (
            <div key={s.label} className="wk-summary-stat">
              <p>{s.label}</p>
              <strong className={s.accent ? "is-accent" : undefined}>{s.value}</strong>
            </div>
          ))}
        </div>
        <button type="button" className="wk-cta" onClick={onDone}>
          Done
        </button>
      </div>
    </div>
  );
}
