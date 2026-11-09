import { createFileRoute, redirect } from "@tanstack/react-router";

/** Body tracking now lives in Progress › Body; keep old links working. */
export const Route = createFileRoute("/body")({
  beforeLoad: () => {
    throw redirect({ to: "/progress", search: { seg: "body" }, replace: true });
  },
});
