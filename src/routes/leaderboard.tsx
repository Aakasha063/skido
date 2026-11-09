import { createFileRoute, Link, useRouter } from "@tanstack/react-router";
import type { CSSProperties, ReactNode } from "react";
import { AppShell } from "@/components/AppShell";
import { ACCENT, Avatar, MUTED, PageSpinner, SubHeader } from "@/components/sk/ui";
import { useAuth } from "@/lib/auth";
import { useLeaderboard, useProfile } from "@/lib/hooks";
import { memberColor } from "@/lib/skido";

export const Route = createFileRoute("/leaderboard")({
  head: () => ({
    meta: [
      { title: "Leaderboard — Skido" },
      {
        name: "description",
        content: "Iron score leaderboard: consistency and progression over the last 30 days.",
      },
    ],
  }),
  component: () => (
    <AppShell tab="profile">
      <Leaderboard />
    </AppShell>
  ),
});

function Leaderboard() {
  const { user } = useAuth();
  const router = useRouter();
  const { data: profile } = useProfile();
  const { ranked, isLoading } = useLeaderboard();

  const colorFor = (r: (typeof ranked)[number]) =>
    (r.user_id === user?.id ? (profile?.avatar_color ?? r.avatar_color) : r.avatar_color) ??
    memberColor(r.user_id);
  const imageFor = (r: (typeof ranked)[number]) =>
    r.user_id === user?.id ? (profile?.avatar_url ?? r.avatar_url) : r.avatar_url;
  const podium = [ranked[1], ranked[0], ranked[2]].filter(Boolean) as typeof ranked;

  return (
    <div className="sk-fade">
      <SubHeader
        eyebrow="Iron score"
        title="Leaderboard"
        onBack={() => router.navigate({ to: "/profile" })}
      />
      <p style={{ margin: "-12px 0 20px", fontSize: 13, color: MUTED }}>
        Iron score rewards consistency and progression, not raw volume. Last 30 days.
      </p>
      {isLoading && <PageSpinner />}
      {!isLoading && ranked.length === 0 && (
        <p style={{ margin: 0, fontSize: 14, color: MUTED }}>No athletes yet.</p>
      )}

      {podium.length > 0 && (
        <div
          style={{
            display: "grid",
            gridTemplateColumns: `repeat(${podium.length}, minmax(0, 1fr))`,
            gap: 8,
            alignItems: "end",
            marginBottom: 16,
          }}
        >
          {podium.map((r) => {
            const rk = ranked.indexOf(r) + 1;
            const me = r.user_id === user?.id;
            return (
              <AthleteLink
                key={r.user_id}
                me={me}
                userId={r.user_id}
                className="sk-surface"
                style={{
                  borderRadius: 20,
                  padding: "16px 8px",
                  height: rk === 1 ? 168 : rk === 2 ? 148 : 136,
                  display: "flex",
                  flexDirection: "column",
                  alignItems: "center",
                  justifyContent: "flex-end",
                  color: "inherit",
                  textDecoration: "none",
                }}
              >
                <Avatar
                  name={r.display_name}
                  image={imageFor(r)}
                  color={colorFor(r)}
                  size={40}
                  radius={13}
                />
                <span
                  style={{
                    marginTop: 8,
                    fontSize: 12.5,
                    fontWeight: 500,
                    maxWidth: "100%",
                    overflow: "hidden",
                    textOverflow: "ellipsis",
                    whiteSpace: "nowrap",
                  }}
                >
                  {me ? "You" : (r.display_name ?? "Athlete").split(" ")[0]}
                </span>
                <span
                  className="sk-num"
                  style={{ fontSize: 12, color: "rgba(255,255,255,0.56)", letterSpacing: 0 }}
                >
                  {r.score}
                </span>
                <span
                  className="sk-num"
                  style={{
                    marginTop: 6,
                    fontSize: 20,
                    fontWeight: 500,
                    color: rk === 1 ? ACCENT : "rgba(255,255,255,0.75)",
                  }}
                >
                  {rk}
                </span>
              </AthleteLink>
            );
          })}
        </div>
      )}

      {ranked.length > 0 && (
        <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
          {ranked.map((r, i) => {
            const me = r.user_id === user?.id;
            return (
              <AthleteLink
                key={r.user_id}
                me={me}
                userId={r.user_id}
                className="sk-row-btn"
                style={{ background: me ? "rgba(255,255,255,0.04)" : "transparent" }}
              >
                <span
                  className="sk-num"
                  style={{
                    width: 20,
                    fontSize: 13,
                    color: "rgba(255,255,255,0.56)",
                    letterSpacing: 0,
                  }}
                >
                  {i + 1}
                </span>
                <Avatar
                  name={r.display_name}
                  image={imageFor(r)}
                  color={colorFor(r)}
                  size={34}
                  radius={11}
                  fontSize={12}
                />
                <span style={{ flex: 1, minWidth: 0 }}>
                  <span
                    style={{
                      display: "block",
                      fontSize: 14,
                      fontWeight: 500,
                      whiteSpace: "nowrap",
                      overflow: "hidden",
                      textOverflow: "ellipsis",
                    }}
                  >
                    {r.display_name ?? "Athlete"}
                    {me ? " (you)" : ""}
                  </span>
                  <span
                    style={{
                      display: "block",
                      marginTop: 2,
                      fontSize: 12,
                      color: "rgba(255,255,255,0.56)",
                    }}
                  >
                    {r.sessions} sessions · {r.active_weeks} active weeks
                  </span>
                </span>
                <span className="sk-num" style={{ fontSize: 14, letterSpacing: 0 }}>
                  {r.score}
                </span>
              </AthleteLink>
            );
          })}
        </div>
      )}
    </div>
  );
}

/** Your own row opens your profile; anyone else's opens their member page. */
function AthleteLink({
  me,
  userId,
  className,
  style,
  children,
}: {
  me: boolean;
  userId: string;
  className: string;
  style: CSSProperties;
  children: ReactNode;
}) {
  return me ? (
    <Link to="/profile" className={className} style={style}>
      {children}
    </Link>
  ) : (
    <Link to="/leaderboard/$userId" params={{ userId }} className={className} style={style}>
      {children}
    </Link>
  );
}
