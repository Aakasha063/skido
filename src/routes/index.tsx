import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useEffect, useMemo, useState } from "react";
import { AppShell } from "@/components/AppShell";
import { Landing } from "@/components/Landing";
import { StatDeck, type StatCard } from "@/components/sk/StatDeck";
import { SessionRow, type SessionRowData } from "@/components/sk/SessionRow";
import {
  ACCENT,
  Avatar,
  Icon,
  PageSpinner,
  ProgressBar,
  Spark,
  TabHeader,
} from "@/components/sk/ui";
import { useAuth } from "@/lib/auth";
import { dayQueryKey, fetchDayWithExercises, fetchRecentSetsForExercises } from "@/lib/api";
import {
  displayName,
  useHistory,
  useLeaderboard,
  useMetrics,
  usePlanDays,
  usePRs,
  useProfile,
  type PlanDay,
} from "@/lib/hooks";
import { buildWeekStatus } from "@/lib/weekStatus";
import { fmtDate, fmtW, greeting, splitTitle } from "@/lib/skido";
import { fmtDuration, todayISO } from "@/lib/format";
import { getSaturdayChoice } from "@/lib/saturday";

const STRUCTURED_DATA = {
  "@context": "https://schema.org",
  "@type": "WebApplication",
  name: "Skido",
  applicationCategory: "HealthApplication",
  operatingSystem: "Web",
  description:
    "Skido is a workout tracker and training plan app for logging sets and reps, following a structured weekly workout plan, tracking personal records, and monitoring bodyweight and strength progress over time.",
  offers: { "@type": "Offer", price: "0", priceCurrency: "USD" },
};

const DESCRIPTION =
  "Skido is a free workout tracker and training plan app: log sets and reps, follow a structured weekly workout plan, track PRs, and see your bodyweight and strength progress over time.";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Skido — Workout Tracker & Training Plan App" },
      { name: "description", content: DESCRIPTION },
      { property: "og:title", content: "Skido — Workout Tracker & Training Plan App" },
      { property: "og:description", content: DESCRIPTION },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
      { name: "twitter:title", content: "Skido — Workout Tracker & Training Plan App" },
      { name: "twitter:description", content: DESCRIPTION },
      { "script:ld+json": STRUCTURED_DATA },
    ],
  }),
  component: IndexRoute,
});

function IndexRoute() {
  const { session, loading } = useAuth();
  if (loading) return <PageSpinner />;
  if (!session) return <Landing />;
  return (
    <AppShell tab="home">
      <Home />
    </AppShell>
  );
}

/** Today's plan day: the mandatory day for this weekday, or on Saturday the chosen optional session. */
function pickToday(days: PlanDay[], uid: string | undefined) {
  const dow = new Date().getDay();
  const mandatory = days.find((d) => d.day_of_week === dow && !d.is_optional);
  if (mandatory) return mandatory;
  const optional = days.filter((d) => d.day_of_week === dow && d.is_optional);
  if (optional.length === 0) return null;
  const chosen = getSaturdayChoice(uid);
  return optional.find((d) => d.slug === chosen) ?? optional[0]!;
}

function Home() {
  const { user } = useAuth();
  const uid = user?.id;
  const qc = useQueryClient();
  const { data: profile } = useProfile();
  const { days, isLoading: daysLoading } = usePlanDays();
  const { data: history, isLoading: historyLoading } = useHistory();
  const { data: metrics } = useMetrics();
  const { data: prs } = usePRs();
  const board = useLeaderboard();

  const name = displayName(profile, user?.email);
  const today = useMemo(() => pickToday(days, uid), [days, uid]);

  // Load today's workout in the background so Start opens it instantly.
  const dayQ = useQuery({
    queryKey: dayQueryKey(today?.slug ?? "", uid),
    queryFn: () => fetchDayWithExercises(today!.slug, uid),
    enabled: !!today && !today.is_rest,
  });
  const exIds = useMemo(
    () => [...new Set((dayQ.data?.exercises ?? []).map((e) => e.exercise_id))].sort(),
    [dayQ.data],
  );
  const recentQ = useQuery({
    queryKey: ["recent-sets", uid, exIds.join(",")],
    queryFn: () => fetchRecentSetsForExercises(uid!, exIds),
    enabled: !!uid && exIds.length > 0,
    staleTime: 60_000,
  });
  useEffect(() => {
    if (!uid || !today || today.is_rest) return;
    qc.prefetchQuery({
      queryKey: dayQueryKey(today.slug, uid),
      queryFn: () => fetchDayWithExercises(today.slug, uid),
    });
  }, [qc, uid, today]);

  const now = new Date();
  const eyebrow = now.toLocaleDateString("en-GB", {
    weekday: "long",
    day: "numeric",
    month: "long",
  });

  if (daysLoading || historyLoading) {
    return (
      <>
        <TabHeader eyebrow={eyebrow} title={greeting(name)} />
        <div className="sk-skel" style={{ height: 200, borderRadius: 24, marginBottom: 56 }} />
        <div className="sk-skel" style={{ height: 300, borderRadius: 24 }} />
      </>
    );
  }

  const completed = (history ?? []).filter((s) => s.status === "completed");
  const week = buildWeekStatus(history ?? [], profile?.created_at?.slice(0, 10) ?? "");
  const mandatory = days.filter((d) => !d.is_optional && !d.is_rest);
  const weekDone = mandatory.filter((d) => week.statusFor(d).isDone).length;
  const hasOptional = days.some((d) => d.is_optional);

  // ── stat cards ──
  const weights = (metrics ?? []).filter((m) => m.weight_kg != null);
  const firstW = weights[0];
  const lastW = weights[weights.length - 1];
  const lastWaist = [...(metrics ?? [])].reverse().find((m) => m.waist_cm != null);
  const last = completed[0];
  const lastTitle = splitTitle(last?.title);
  const totalPRs = completed.reduce((a, s) => a + s.pr_count, 0);
  const leader = board.ranked[0];

  const cards: StatCard[] = [
    {
      key: "weight",
      label: "Body weight",
      value: lastW ? fmtW(Number(lastW.weight_kg)) : "—",
      unit: lastW ? "kg" : "",
      sub: lastW
        ? `${Number(lastW.weight_kg) - Number(firstW!.weight_kg) > 0 ? "+" : ""}${fmtW(Math.round((Number(lastW.weight_kg) - Number(firstW!.weight_kg)) * 10) / 10)} kg since you started${lastWaist ? ` · waist ${fmtW(Number(lastWaist.waist_cm))} cm` : ""}`
        : "Log your first weigh-in on Progress",
      accent: ACCENT,
      glow: "rgba(198,244,50,0.16)",
      body:
        weights.length >= 2 ? (
          <Spark
            values={weights.map((m) => Number(m.weight_kg))}
            label={`Weight trend from ${fmtW(Number(firstW!.weight_kg))} kg to ${fmtW(Number(lastW!.weight_kg))} kg over ${weights.length} entries`}
          />
        ) : null,
    },
    {
      key: "score",
      label: "Iron score",
      value: String(board.myScore),
      unit: "pts",
      sub: board.level.next
        ? `${board.level.next.min - board.myScore} points to ${board.level.next.name}`
        : "Top level reached",
      accent: "rgba(255,255,255,0.72)",
      glow: "rgba(198,244,50,0.10)",
      body: (
        <>
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              fontSize: 12,
              marginBottom: 10,
              color: "rgba(255,255,255,0.62)",
            }}
          >
            <span>{board.level.current.name}</span>
            <span>{board.level.next?.name ?? "Max"}</span>
          </div>
          <ProgressBar pct={board.level.pct} />
        </>
      ),
    },
    {
      key: "week",
      label: "This week",
      value: String(weekDone),
      unit: `of ${mandatory.length} sessions`,
      sub: hasOptional ? "Saturday is optional" : "Keep the streak going",
      accent: "rgba(255,255,255,0.78)",
      glow: "rgba(198,244,50,0.10)",
      body: <WeekDots days={days} statusFor={week.statusFor} />,
    },
    {
      key: "last",
      label: "Last workout",
      value: last ? fmtDuration(last.duration_seconds) : "—",
      unit: "",
      sub: last ? [lastTitle.day, lastTitle.focus].filter(Boolean).join(" · ") : "No sessions yet",
      accent: "rgba(255,255,255,0.75)",
      glow: "rgba(198,244,50,0.10)",
      body: last ? (
        <Pills
          items={[
            `${last.working_sets} sets`,
            last.pr_count ? `${last.pr_count} PR${last.pr_count > 1 ? "s" : ""}` : "No PRs",
            fmtDate(last.session_date),
          ]}
        />
      ) : null,
    },
    {
      key: "prs",
      label: "Personal records",
      value: String(totalPRs),
      unit: "all time",
      sub: "Strength and volume bests",
      accent: ACCENT,
      glow: "rgba(198,244,50,0.14)",
      body: (
        <Pills
          items={[
            ...new Set(
              (prs ?? [])
                .map((p) => (p.exercises as { name: string } | null)?.name)
                .filter(Boolean) as string[],
            ),
          ]
            .slice(0, 3)
            .map((n) => n.replace(/ Machine| Smith/g, ""))}
        />
      ),
    },
    {
      key: "rank",
      label: "Leaderboard",
      value: board.myRank > 0 ? `#${board.myRank}` : "—",
      unit: board.ranked.length ? `of ${board.ranked.length}` : "",
      sub:
        board.myRank === 1
          ? "You're leading your group"
          : board.me && leader
            ? `${leader.score - board.myScore} points behind ${(leader.display_name ?? "the leader").split(" ")[0]}`
            : "Train this month to get ranked",
      accent: "rgba(255,255,255,0.75)",
      glow: "rgba(198,244,50,0.10)",
      body: board.me ? (
        <Pills items={[`${board.me.sessions} sessions`, `${board.me.active_weeks} active weeks`]} />
      ) : null,
    },
  ];

  return (
    <>
      <TabHeader
        eyebrow={eyebrow}
        title={greeting(name)}
        right={
          <Link
            to="/profile"
            aria-label="Your profile"
            className="sk-icon-btn"
            style={{ width: 40, height: 40, padding: 0, overflow: "hidden", flexShrink: 0 }}
          >
            <Avatar
              name={name}
              image={profile?.avatar_url}
              color={profile?.avatar_color}
              size={40}
              style={{ border: "none" }}
            />
          </Link>
        }
      />
      <StatDeck cards={cards} />
      <TodayCard
        today={today}
        day={dayQ.data ?? null}
        withHistory={new Set((recentQ.data ?? []).map((r) => r.exercise_id))}
        history={history ?? []}
      />
      <Recent sessions={completed.slice(0, 3)} />
    </>
  );
}

function Pills({ items }: { items: string[] }) {
  if (items.length === 0) return null;
  return (
    <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
      {items.map((c) => (
        <span key={c} className="sk-pill">
          {c}
        </span>
      ))}
    </div>
  );
}

function WeekDots({
  days,
  statusFor,
}: {
  days: PlanDay[];
  statusFor: ReturnType<typeof buildWeekStatus>["statusFor"];
}) {
  const dow = new Date().getDay();
  const order = [1, 2, 3, 4, 5, 6, 0];
  return (
    <div style={{ display: "flex", justifyContent: "space-between" }}>
      {order.map((d, i) => {
        const day =
          days.find((x) => x.day_of_week === d && !x.is_optional) ??
          days.find((x) => x.day_of_week === d);
        const done = day ? statusFor(day).isDone : false;
        const isToday = d === dow;
        return (
          <div
            key={d}
            style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 8 }}
          >
            <span
              style={{
                width: 28,
                height: 28,
                borderRadius: 999,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                background: done ? "rgba(255,255,255,0.78)" : "transparent",
                border: isToday
                  ? "1.5px solid rgba(255,255,255,0.78)"
                  : done
                    ? "1.5px solid transparent"
                    : "1.5px solid rgba(255,255,255,0.1)",
              }}
            >
              {done && <Icon name="check" size={12} stroke={3} color="#1F1F20" />}
            </span>
            <span style={{ fontSize: 11, color: isToday ? "#FFFFFF" : "rgba(255,255,255,0.56)" }}>
              {"MTWTFSS"[i]}
            </span>
          </div>
        );
      })}
    </div>
  );
}

function TodayCard({
  today,
  day,
  withHistory,
  history,
}: {
  today: PlanDay | null;
  day: Awaited<ReturnType<typeof fetchDayWithExercises>>;
  withHistory: Set<string>;
  history: { day_id: string | null; session_date: string; status: string; id: string }[];
}) {
  const [expanded, setExpanded] = useState(false);
  const weekday = new Date().toLocaleDateString("en-GB", { weekday: "long" });
  const card = {
    position: "relative" as const,
    borderRadius: 24,
    padding: 22,
    marginBottom: 28,
    overflow: "hidden" as const,
    background:
      "radial-gradient(420px 220px at 100% 0%, rgba(198,244,50,0.14), rgba(198,244,50,0) 70%), linear-gradient(180deg, #171718, #121213)",
    borderColor: "rgba(198,244,50,0.18)",
    animationDelay: ".1s",
  };
  const topLine = (
    <div
      aria-hidden="true"
      style={{
        position: "absolute",
        left: 22,
        right: 22,
        top: 0,
        height: 1,
        background: "linear-gradient(90deg, transparent, rgba(198,244,50,0.45), transparent)",
      }}
    />
  );

  if (!today || today.is_rest) {
    return (
      <section aria-label="Today's workout" className="sk-fade sk-surface" style={card}>
        {topLine}
        <p className="sk-eyebrow" style={{ margin: 0 }}>
          Today · {weekday}
        </p>
        <h2
          style={{ margin: "10px 0 0", fontSize: 22, fontWeight: 600, letterSpacing: "-0.025em" }}
        >
          {today ? "Recovery day" : "No session planned"}
        </h2>
        <p
          style={{
            margin: "8px 0 0",
            fontSize: 14,
            lineHeight: 1.55,
            color: "rgba(255,255,255,0.62)",
          }}
        >
          {today
            ? (today.notes ??
              today.cardio_note ??
              "Easy walking, light mobility, stretching if desired. Sleep and recover fully.")
            : "Nothing is scheduled for today in your plan."}
        </p>
        {!today && (
          <Link to="/plan" className="sk-btn sk-btn-quiet" style={{ marginTop: 18 }}>
            Open your plan
          </Link>
        )}
      </section>
    );
  }

  const todaysSession = history.find((s) => s.day_id === today.id && s.session_date === todayISO());
  const done = todaysSession?.status === "completed";
  const inProgress = todaysSession?.status === "in_progress";
  const exs = day?.exercises ?? [];
  const list = exs.map((we, i) => ({
    id: we.id,
    num: String(i + 1).padStart(2, "0"),
    name: we.exercises.name,
    scheme: we.exercises.category === "cardio" ? we.rep_range : `${we.sets} × ${we.rep_range}`,
  }));
  const shown = expanded ? list : list.slice(0, 4);
  const duration =
    today.estimated_minutes_min && today.estimated_minutes_max
      ? `${today.estimated_minutes_min}–${today.estimated_minutes_max} min`
      : "";

  return (
    <section aria-label="Today's workout" className="sk-fade sk-surface" style={card}>
      {topLine}
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <p className="sk-eyebrow" style={{ margin: 0 }}>
          Today · {today.name}
        </p>
        <span className="sk-cap">{duration}</span>
      </div>
      <h2
        style={{
          margin: "10px 0 0",
          fontSize: 22,
          lineHeight: 1.25,
          fontWeight: 600,
          letterSpacing: "-0.025em",
        }}
      >
        {today.focus ?? today.name}
      </h2>
      <div
        className="sk-stat-row"
        style={{
          margin: "18px 0 6px",
          borderTop: "1px solid rgba(255,255,255,0.06)",
          borderBottom: "1px solid rgba(255,255,255,0.06)",
        }}
      >
        {[
          [String(exs.length || today.exercise_count), "Exercises"],
          [
            String(
              exs.reduce((a, we) => a + (we.exercises.category === "cardio" ? 1 : we.sets), 0) ||
                "—",
            ),
            "Sets",
          ],
          [String(exs.filter((we) => withHistory.has(we.exercise_id)).length), "With history"],
        ].map(([v, l]) => (
          <div key={l} style={{ padding: "14px 0" }}>
            <p className="sk-num" style={{ margin: 0, fontSize: 22, fontWeight: 500 }}>
              {v}
            </p>
            <p className="sk-cap" style={{ margin: "2px 0 0" }}>
              {l}
            </p>
          </div>
        ))}
      </div>
      <ol style={{ listStyle: "none", margin: "0 0 6px", padding: 0 }}>
        {shown.map((ex) => (
          <li
            key={ex.id}
            style={{
              display: "flex",
              alignItems: "center",
              gap: 14,
              padding: "11px 0",
              borderBottom: "1px solid rgba(255,255,255,0.05)",
            }}
          >
            <span
              className="sk-num"
              style={{ width: 18, fontSize: 12, color: "rgba(255,255,255,0.5)", letterSpacing: 0 }}
            >
              {ex.num}
            </span>
            <span
              style={{
                flex: 1,
                minWidth: 0,
                fontSize: 14,
                whiteSpace: "nowrap",
                overflow: "hidden",
                textOverflow: "ellipsis",
              }}
            >
              {ex.name}
            </span>
            <span
              className="sk-num"
              style={{
                fontSize: 12.5,
                color: "rgba(255,255,255,0.62)",
                whiteSpace: "nowrap",
                letterSpacing: 0,
              }}
            >
              {ex.scheme}
            </span>
          </li>
        ))}
      </ol>
      {list.length > 4 && (
        <button
          type="button"
          onClick={() => setExpanded((v) => !v)}
          aria-expanded={expanded}
          className="sk-link-btn"
          style={{ padding: "8px 0 0" }}
        >
          {expanded ? "Show less" : `Show all ${list.length} exercises`}
        </button>
      )}
      {done ? (
        <Link
          to="/history/$id"
          params={{ id: todaysSession!.id }}
          className="sk-btn sk-btn-quiet"
          style={{ marginTop: 18 }}
        >
          <Icon name="check" size={16} color={ACCENT} /> Completed today · view session
        </Link>
      ) : (
        <Link
          to="/workout/$slug"
          params={{ slug: today.slug }}
          search={{ start: true }}
          className="sk-btn sk-btn-accent"
          style={{ marginTop: 18 }}
        >
          {inProgress ? "Resume workout" : "Start workout"}
          <Icon name="arrow" size={16} />
        </Link>
      )}
    </section>
  );
}

type RecentRow = SessionRowData;

function Recent({ sessions }: { sessions: RecentRow[] }) {
  return (
    <section aria-label="Recent sessions" className="sk-fade" style={{ animationDelay: ".15s" }}>
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "baseline",
          marginBottom: 12,
        }}
      >
        <h2 className="sk-h-section">Recent</h2>
        <Link to="/progress" search={{ seg: "history" }} className="sk-link-btn">
          See all
        </Link>
      </div>
      <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
        {sessions.length === 0 ? (
          <p
            style={{
              margin: 0,
              padding: "18px 16px",
              fontSize: 13.5,
              color: "rgba(255,255,255,0.56)",
            }}
          >
            Your finished workouts will show up here.
          </p>
        ) : (
          sessions.map((s) => <SessionRow key={s.id} s={s} />)
        )}
      </div>
    </section>
  );
}
