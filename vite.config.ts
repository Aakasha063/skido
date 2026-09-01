// @lovable.dev/vite-tanstack-config already includes the following — do NOT add them manually
// or the app will break with duplicate plugins:
//   - TanStack devtools (dev-only, first), tanstackStart, viteReact, tailwindcss, tsConfigPaths,
//     nitro (build-only using cloudflare as a default target), VITE_* env injection, @ path alias,
//     React/TanStack dedupe, error logger plugins, and sandbox detection (port/host/strictPort).
// You can pass additional config via defineConfig({ vite: { ... }, etc... }) if needed.
import { defineConfig } from "@lovable.dev/vite-tanstack-config";
import { VitePWA } from "vite-plugin-pwa";

export default defineConfig({
  plugins: [
    VitePWA({
      registerType: "autoUpdate",
      // TanStack Start has no static index.html for the plugin's HTML-injection
      // step to target — register the SW ourselves client-side instead (see
      // src/lib/pwa.ts), via the `virtual:pwa-register` module.
      injectRegister: false,
      // Only precache the client build output — TanStack Start's SSR/server chunks
      // must never be pulled into the service worker's asset manifest.
      includeAssets: ["favicon.svg", "robots.txt"],
      manifest: {
        name: "Skido — Workout Tracker & Training Plan App",
        short_name: "Skido",
        description:
          "Log sets and reps, follow a structured weekly workout plan, track PRs, and see your bodyweight and strength progress over time.",
        theme_color: "#fcee0a",
        background_color: "#12130f",
        display: "standalone",
        start_url: "/",
        scope: "/",
        icons: [
          { src: "/icons/icon-192.png", sizes: "192x192", type: "image/png" },
          { src: "/icons/icon-512.png", sizes: "512x512", type: "image/png" },
          {
            src: "/icons/maskable-512.png",
            sizes: "512x512",
            type: "image/png",
            purpose: "maskable",
          },
        ],
      },
      workbox: {
        // Never let the SW intercept Supabase API/auth calls or SSR document
        // requests — only cache the static client build (JS/CSS/fonts/images).
        navigateFallbackDenylist: [/^\/api\//],
        globPatterns: ["**/*.{js,css,html,svg,png,woff2}"],
        runtimeCaching: [
          {
            urlPattern: ({ url }) => url.pathname.startsWith("/icons/"),
            handler: "CacheFirst",
            options: { cacheName: "skido-icons" },
          },
        ],
      },
      devOptions: {
        // The SW conflicts with TanStack Start's dev-mode HMR/SSR pipeline —
        // only enable it in production builds.
        enabled: false,
      },
    }),
  ],
  tanstackStart: {
    // Redirect TanStack Start's bundled server entry to src/server.ts (our SSR error wrapper).
    // nitro/vite builds from this
    server: { entry: "server" },
  },
  // Dynamic Nitro preset: uses 'vercel' on Vercel, 'netlify' on Netlify
  nitro: {
    preset: process.env.VERCEL ? "vercel" : (process.env.NITRO_PRESET || "netlify"),
  },
});
