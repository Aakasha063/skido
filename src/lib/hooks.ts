/** Shared queries, so every screen reads the same cache entries (and nothing is fetched twice). */
import { useQuery } from "@tanstack/react-query";
import { useAuth } from "@/lib/auth";
import {
  fetchBodyMetrics,
  fetchDays,
  fetchHistory,
  fetchLeaderboard,
  fetchPRs,
  fetchProfile,
  fetchWorkoutTemplate,
} from "@/lib/api";
import { ironScore, levelFor } from "@/lib/skido";
import { GOALS } from "@/lib/goals";

export function useProfile() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["profile", user?.id],
    queryFn: () => fetchProfile(user!.id),
    enabled: !!user,
  });
}

export type PlanDay = Awaited<ReturnType<typeof fetchDays>>[number];

/**
 * The days of the user's plan. A custom plan (built in /builder) replaces the curated
 * template's days entirely, matching how the Plan screen has always presented it.
 */
export function usePlanDays() {
  const { user } = useAuth();
  const { data: profile } = useProfile();
  const q = useQuery({
    queryKey: ["days", user?.id, profile?.active_template_id],
    queryFn: () => fetchDays(user?.id, profile?.active_template_id),
    // Wait for the profile: without its active plan this would fetch every plan's days.
    enabled: !user || profile !== undefined,
  });
  const all = q.data ?? [];
  const hasCustom = all.some((d) => d.is_custom);
  const days = all.filter((d) => (hasCustom ? d.is_custom : !d.is_custom));
  return { ...q, days, hasCustom };
}

export function useTemplate() {
  const { data: profile } = useProfile();
  return useQuery({
    queryKey: ["workout-template", profile?.active_template_id],
    queryFn: () => fetchWorkoutTemplate(profile?.active_template_id),
    enabled: !!profile?.active_template_id,
  });
}

export function useHistory() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["history", user?.id],
    queryFn: () => fetchHistory(user!.id),
    enabled: !!user,
  });
}

export function useMetrics() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["metrics", user?.id],
    queryFn: () => fetchBodyMetrics(user!.id),
    enabled: !!user,
  });
}

export function usePRs() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["prs", user?.id],
    queryFn: () => fetchPRs(user!.id),
    enabled: !!user,
  });
}

/** Leaderboard over the last 30 days, ranked by Iron score (as the app has always ranked it). */
export function useLeaderboard() {
  const { user } = useAuth();
  const q = useQuery({ queryKey: ["leaderboard", 30], queryFn: () => fetchLeaderboard(30) });
  const ranked = (q.data ?? [])
    .map((r) => ({ ...r, score: ironScore(r) }))
    .sort((a, b) => b.score - a.score);
  const myIndex = ranked.findIndex((r) => r.user_id === user?.id);
  const me = myIndex >= 0 ? ranked[myIndex]! : null;
  const myScore = me?.score ?? 0;
  return { ...q, ranked, me, myRank: myIndex + 1, myScore, level: levelFor(myScore) };
}

/** Profile goal is stored either as a GOALS key (onboarding/body) or a label (profile edit). */
export function goalLabel(goal: string | null | undefined) {
  if (!goal) return null;
  return goal in GOALS ? GOALS[goal as keyof typeof GOALS].label : goal;
}

export function displayName(
  profile: { name?: string | null } | null | undefined,
  email?: string | null,
) {
  return profile?.name?.trim() || (email ? email.split("@")[0]! : "Athlete");
}
