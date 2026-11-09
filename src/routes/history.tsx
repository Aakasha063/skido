import { createFileRoute, redirect } from "@tanstack/react-router";

/** Workout history now lives in Progress › History; keep old links working. */
export const Route = createFileRoute("/history")({
  beforeLoad: () => {
    throw redirect({ to: "/progress", search: { seg: "history" }, replace: true });
  },
});
