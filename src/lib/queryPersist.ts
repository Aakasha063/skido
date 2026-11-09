/**
 * Keeps a copy of the small, per-user query results in localStorage so the app opens
 * instantly with the last-known data, then refreshes in the background (React Query
 * still refetches anything older than its staleTime). Live-session data is never
 * persisted: a stale "today's session" could resume yesterday's workout.
 */
import { dehydrate, hydrate, type QueryClient } from "@tanstack/react-query";

const STORAGE_KEY = "skido:query-cache:v1";
const MAX_AGE_MS = 7 * 24 * 60 * 60 * 1000;
const MAX_BYTES = 1_500_000;
const PERSISTED_ROOTS = new Set([
  "profile",
  "days",
  "day",
  "history",
  "prs",
  "metrics",
  "workout-template",
  "workout-templates",
]);

export function restoreQueryCache(qc: QueryClient) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return;
    const parsed = JSON.parse(raw) as { savedAt: number; state: unknown };
    if (!parsed?.savedAt || Date.now() - parsed.savedAt > MAX_AGE_MS) {
      localStorage.removeItem(STORAGE_KEY);
      return;
    }
    hydrate(qc, parsed.state);
  } catch {
    // Corrupt or unavailable storage: start cold.
  }
}

/** Starts mirroring the cache to storage; returns a cleanup function. */
export function persistQueryCache(qc: QueryClient) {
  let timer: ReturnType<typeof setTimeout> | undefined;

  const save = () => {
    try {
      const state = dehydrate(qc, {
        shouldDehydrateQuery: (q) =>
          q.state.status === "success" && PERSISTED_ROOTS.has(String(q.queryKey[0])),
      });
      const json = JSON.stringify({ savedAt: Date.now(), state });
      if (json.length <= MAX_BYTES) localStorage.setItem(STORAGE_KEY, json);
    } catch {
      // Quota exceeded or storage blocked: persistence is best-effort.
    }
  };

  const unsubscribe = qc.getQueryCache().subscribe((event) => {
    if (event.type !== "updated" && event.type !== "removed") return;
    clearTimeout(timer);
    timer = setTimeout(save, 1000);
  });
  const onHide = () => {
    if (document.visibilityState === "hidden") save();
  };
  document.addEventListener("visibilitychange", onHide);

  return () => {
    unsubscribe();
    clearTimeout(timer);
    document.removeEventListener("visibilitychange", onHide);
  };
}

export function clearPersistedQueryCache() {
  try {
    localStorage.removeItem(STORAGE_KEY);
  } catch {
    // ignore
  }
}
