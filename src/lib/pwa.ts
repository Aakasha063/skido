// Registers the PWA service worker. Client-only: TanStack Start renders this
// module on the server too, so every browser API access must stay inside the
// dynamic import / callback, never at module scope.
export function registerServiceWorker() {
  if (typeof window === "undefined" || import.meta.env.DEV) return;

  import("virtual:pwa-register").then(({ registerSW }) => {
    registerSW({ immediate: true });
  });
}
