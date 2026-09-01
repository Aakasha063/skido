// Registers the PWA service worker with automatic update activation and cache claiming.
export function registerServiceWorker() {
  if (typeof window === "undefined" || import.meta.env.DEV) return;

  import("virtual:pwa-register").then(({ registerSW }) => {
    const updateSW = registerSW({
      immediate: true,
      onNeedRefresh() {
        // Automatically activate new service worker and refresh cache
        updateSW(true);
      },
      onRegisteredSW(swUrl, registration) {
        if (registration) {
          // Check for new deployments every 5 minutes and on window focus
          setInterval(() => {
            registration.update().catch(() => {});
          }, 5 * 60 * 1000);

          window.addEventListener("focus", () => {
            registration.update().catch(() => {});
          });
        }
      },
    });
  });

  // Listen for service worker controller changes to reload obsolete cached assets
  if ("serviceWorker" in navigator) {
    let refreshing = false;
    navigator.serviceWorker.addEventListener("controllerchange", () => {
      if (!refreshing) {
        refreshing = true;
        window.location.reload();
      }
    });
  }
}
