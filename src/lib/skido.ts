/**
 * Derived numbers shown by the Skido design (Iron score, levels, achievements,
 * challenges). Everything here is computed from data the app already stores —
 * nothing in this file writes to Supabase.
 */
import type { BadgeView } from "@/components/sk/ui";

export const fmtW = (w: number | null | undefined) => {
  if (w == null) return "—";
  return Number.isInteger(w) ? String(w) : String(Math.round(w * 10) / 10);
};

export const fmtDate = (
  iso: string,
  opts: Intl.DateTimeFormatOptions = { day: "numeric", month: "short" },
) => new Date(iso.length === 10 ? `${iso}T00:00` : iso).toLocaleDateString("en-GB", opts);

export function fmtVolume(kg: number) {
  return kg >= 1000
    ? { value: String(Math.round(kg / 100) / 10), unit: "t" }
    : { value: String(Math.round(kg)), unit: "kg" };
}

export function greeting(name: string | null | undefined, now = new Date()) {
  const hr = now.getHours();
  const part = hr < 12 ? "Good morning" : hr < 17 ? "Good afternoon" : "Good evening";
  const first = (name ?? "").trim().split(/\s+/)[0];
  return first ? `${part}, ${first}` : part;
}

/* ── Iron score & levels (rewards consistency and progression, not raw volume) ── */

export type IronRow = {
  total_volume: number | null;
  sets_count: number | null;
  sessions: number | null;
  active_weeks: number | null;
};

export function ironScore(r: IronRow) {
  return Math.round(
    Number(r.total_volume ?? 0) / 1000 +
      Number(r.sets_count ?? 0) * 2 +
      Number(r.sessions ?? 0) * 25 +
      Number(r.active_weeks ?? 0) * 40,
  );
}

export const LEVELS = [
  { name: "Rookie", min: 0 },
  { name: "Grinder", min: 250 },
  { name: "Contender", min: 600 },
  { name: "Beast", min: 1200 },
  { name: "Titan", min: 2200 },
  { name: "Iron Legend", min: 3600 },
] as const;

export function levelFor(score: number) {
  let idx = 0;
  LEVELS.forEach((l, i) => {
    if (score >= l.min) idx = i;
  });
  const current = LEVELS[idx]!;
  const next = LEVELS[idx + 1] ?? null;
  const pct = next ? Math.round(((score - current.min) / (next.min - current.min)) * 100) : 100;
  return { index: idx + 1, current, next, pct };
}

/* ── Achievements & challenges ── */

type BadgeInput = { label: string; hint: string; value: number; target: number; rewardXp: number };

export function badgeView(b: BadgeInput): BadgeView {
  const pct = Math.min(100, Math.round((b.value / b.target) * 100));
  const earned = b.value >= b.target;
  return {
    label: b.label,
    hint: b.hint,
    earned,
    pct,
    sub: earned ? `+${b.rewardXp} XP` : `${Math.min(b.value, b.target)} / ${b.target}`,
  };
}

export function badgesFor(stats: {
  sessions: number;
  streakDays: number;
  prCount: number;
  totalSets: number;
}) {
  return [
    {
      label: "First rep",
      hint: "Complete 1 session",
      value: stats.sessions,
      target: 1,
      rewardXp: 50,
    },
    {
      label: "Ten sessions",
      hint: "Complete 10 sessions",
      value: stats.sessions,
      target: 10,
      rewardXp: 150,
    },
    {
      label: "Consistency",
      hint: "3-day training streak",
      value: stats.streakDays,
      target: 3,
      rewardXp: 75,
    },
    {
      label: "Record breaker",
      hint: "Set a personal record",
      value: stats.prCount,
      target: 1,
      rewardXp: 100,
    },
    {
      label: "Iron addict",
      hint: "Log 500 working sets",
      value: stats.totalSets,
      target: 500,
      rewardXp: 250,
    },
    {
      label: "Volume built",
      hint: "Log 1,000 working sets",
      value: stats.totalSets,
      target: 1000,
      rewardXp: 200,
    },
  ].map(badgeView);
}

export function challengesFor(stats: {
  weekDone: number;
  weekTarget: number;
  prsThisMonth: number;
  setsThisWeek: number;
}) {
  const target = Math.max(1, Math.min(4, stats.weekTarget));
  return [
    {
      label: "Weekly adherence",
      hint: `Complete ${target} of ${stats.weekTarget} mandatory sessions`,
      value: stats.weekDone,
      target,
      rewardXp: 100,
    },
    {
      label: "New PR",
      hint: "Set a personal record this month",
      value: stats.prsThisMonth,
      target: 1,
      rewardXp: 75,
    },
    {
      label: "Steady sets",
      hint: "Log 20 working sets this week",
      value: stats.setsThisWeek,
      target: 20,
      rewardXp: 50,
    },
  ].map((c) => {
    const pct = Math.min(100, Math.round((c.value / c.target) * 100));
    return {
      ...c,
      pct,
      done: c.value >= c.target,
      progressLabel: `${Math.min(c.value, c.target)} / ${c.target}`,
    };
  });
}

/** Consecutive days (ending today or yesterday) with a completed session. */
export function streakDays(dates: string[], today = new Date()) {
  const have = new Set(dates);
  const iso = (d: Date) =>
    `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
  const cursor = new Date(today);
  if (!have.has(iso(cursor))) cursor.setDate(cursor.getDate() - 1);
  let n = 0;
  while (have.has(iso(cursor))) {
    n++;
    cursor.setDate(cursor.getDate() - 1);
  }
  return n;
}

/** Monday-based start of the current week as YYYY-MM-DD. */
export function weekStartISO(now = new Date()) {
  const d = new Date(now);
  const dow = d.getDay();
  d.setDate(d.getDate() - (dow === 0 ? 6 : dow - 1));
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}-${String(d.getDate()).padStart(2, "0")}`;
}

/** Splits "Monday — Chest + Side Delts" into its day and focus parts. */
export function splitTitle(title: string | null | undefined) {
  const [day, ...rest] = (title ?? "Workout").split(" — ");
  return { day: day ?? "Workout", focus: rest.join(" — ") };
}

/** Neutral avatar colour for other athletes without one of their own (from the design's member palette). */
export function memberColor(id: string) {
  const palette = ["#FFFFFF", "#D4D4D4", "#A8A8A8", "#858586"];
  let hash = 0;
  for (let i = 0; i < id.length; i++) hash = (hash * 31 + id.charCodeAt(i)) >>> 0;
  return palette[hash % palette.length]!;
}
