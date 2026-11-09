import { useRouter } from "@tanstack/react-router";
import type { ReactNode } from "react";
import { useEffect } from "react";
import { useQueryClient, type QueryClient } from "@tanstack/react-query";
import { useAuth } from "@/lib/auth";
import { Onboarding } from "@/components/Onboarding";
import { fetchBodyMetrics, fetchHistory, fetchLeaderboard, fetchPRs } from "@/lib/api";
import { useProfile } from "@/lib/hooks";
import { supabase } from "@/integrations/supabase/client";
import { clearPersistedQueryCache } from "@/lib/queryPersist";
import { PageSpinner, TabBar, type TabKey } from "@/components/sk/ui";

/**
 * Authenticated app frame: redirects signed-out visitors to /auth, holds every page
 * behind onboarding until it's completed, and renders the floating tab bar.
 */
export function AppShell({
  children,
  tab = null,
  wide = false,
}: {
  children: ReactNode;
  tab?: TabKey | null;
  wide?: boolean;
}) {
  const { session, loading } = useAuth();
  const router = useRouter();
  const qc = useQueryClient();
  const uid = session?.user?.id;

  // Warm the caches other tabs read so switching tabs is instant — but only once the
  // current page's own requests are out, so they don't compete for the connection.
  useEffect(() => {
    if (!uid) return;
    const warm = () => {
      qc.prefetchQuery({ queryKey: ["history", uid], queryFn: () => fetchHistory(uid) });
      qc.prefetchQuery({ queryKey: ["prs", uid], queryFn: () => fetchPRs(uid) });
      qc.prefetchQuery({ queryKey: ["metrics", uid], queryFn: () => fetchBodyMetrics(uid) });
      qc.prefetchQuery({ queryKey: ["leaderboard", 30], queryFn: () => fetchLeaderboard(30) });
    };
    const w = window as Window & {
      requestIdleCallback?: (cb: () => void, opts?: { timeout: number }) => number;
      cancelIdleCallback?: (id: number) => void;
    };
    if (w.requestIdleCallback && w.cancelIdleCallback) {
      const id = w.requestIdleCallback(warm, { timeout: 2500 });
      return () => w.cancelIdleCallback!(id);
    }
    const id = setTimeout(warm, 1200);
    return () => clearTimeout(id);
  }, [uid, qc]);

  useEffect(() => {
    if (!loading && !session) router.navigate({ to: "/auth" });
  }, [loading, session, router]);

  const { data: profile, isLoading: profileLoading } = useProfile();

  if (loading || (session && profileLoading)) return <PageSpinner />;
  if (!session) return null;

  // Gate every authenticated page behind onboarding until it's completed (or skipped).
  if (profile && !profile.onboarding_completed) return <Onboarding />;

  return (
    <>
      <main className={wide ? "sk-page is-wide" : "sk-page"}>{children}</main>
      <TabBar active={tab} />
    </>
  );
}

/** Signs out and drops every cached and persisted query so the next user starts clean. */
export async function signOut(qc?: QueryClient) {
  clearPersistedQueryCache();
  qc?.clear();
  await supabase.auth.signOut();
}
