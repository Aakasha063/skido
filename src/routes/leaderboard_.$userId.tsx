import { createFileRoute, useRouter } from "@tanstack/react-router";
import { AppShell } from "@/components/AppShell";
import { Avatar, BadgeGrid, MUTED, PageSpinner, SectionTitle, SubHeader } from "@/components/sk/ui";
import { useLeaderboard } from "@/lib/hooks";
import { badgeView, fmtVolume, levelFor, memberColor } from "@/lib/skido";

export const Route = createFileRoute("/leaderboard_/$userId")({
  head: () => ({
    meta: [
      { title: "Athlete — Skido" },
      {
        name: "description",
        content: "An athlete's Iron score, rank, training stats and achievements.",
      },
    ],
  }),
  component: () => (
    <AppShell tab="profile">
      <Member />
    </AppShell>
  ),
});

function Member() {
  const { userId } = Route.useParams();
  const router = useRouter();
  const { ranked, isLoading } = useLeaderboard();
  const back = () => router.navigate({ to: "/leaderboard" });

  if (isLoading) return <PageSpinner />;
  const idx = ranked.findIndex((r) => r.user_id === userId);
  const r = ranked[idx];
  if (!r) {
    return (
      <>
        <SubHeader eyebrow="Member" title="Athlete not found" onBack={back} />
        <p style={{ margin: 0, fontSize: 14, color: MUTED }}>
          They may not have trained in the last 30 days.
        </p>
      </>
    );
  }

  const lvl = levelFor(r.score);
  const vol = fmtVolume(Number(r.total_volume ?? 0));
  const badges = [
    { label: "First rep", hint: "Complete 1 session", value: r.sessions, target: 1, rewardXp: 50 },
    {
      label: "Ten sessions",
      hint: "Complete 10 sessions",
      value: r.sessions,
      target: 10,
      rewardXp: 150,
    },
    {
      label: "Consistency",
      hint: "3 active weeks",
      value: r.active_weeks,
      target: 3,
      rewardXp: 75,
    },
    {
      label: "Record breaker",
      hint: "Set a personal record",
      value: r.pr_count,
      target: 1,
      rewardXp: 100,
    },
    {
      label: "Iron addict",
      hint: "Log 500 working sets",
      value: r.sets_count,
      target: 500,
      rewardXp: 250,
    },
    {
      label: "Volume built",
      hint: "Log 1,000 working sets",
      value: r.sets_count,
      target: 1000,
      rewardXp: 200,
    },
  ].map(badgeView);

  return (
    <div className="sk-fade">
      <SubHeader eyebrow="Member" title={r.display_name ?? "Athlete"} onBack={back} />
      <div style={{ display: "flex", alignItems: "center", gap: 16, marginBottom: 22 }}>
        <Avatar
          name={r.display_name}
          image={r.avatar_url}
          color={r.avatar_color ?? memberColor(r.user_id)}
          size={60}
          radius={20}
          fontSize={20}
        />
        <div>
          <p style={{ margin: 0, fontSize: 13, color: MUTED }}>
            Rank #{idx + 1} · {lvl.current.name}
          </p>
          <p
            className="sk-num"
            style={{ margin: "4px 0 0", fontSize: 28, fontWeight: 400, lineHeight: 1 }}
          >
            {r.score}
            <span
              style={{
                fontSize: 13,
                color: "rgba(255,255,255,0.56)",
                marginLeft: 6,
                letterSpacing: 0,
              }}
            >
              Iron score
            </span>
          </p>
        </div>
      </div>
      <div className="sk-surface sk-grid2" style={{ marginBottom: 24 }}>
        {[
          ["Sessions", String(r.sessions)],
          ["Sets logged", String(r.sets_count)],
          ["Volume", `${vol.value} ${vol.unit}`],
          ["Records", String(r.pr_count)],
        ].map(([label, value]) => (
          <div key={label}>
            <p className="sk-cap" style={{ margin: 0 }}>
              {label}
            </p>
            <p className="sk-num" style={{ margin: "8px 0 0", fontSize: 24, fontWeight: 400 }}>
              {value}
            </p>
          </div>
        ))}
      </div>
      <SectionTitle
        title="Achievements"
        right={
          <span className="sk-cap">{`${badges.filter((b) => b.earned).length} of ${badges.length}`}</span>
        }
        style={{ marginTop: 0 }}
      />
      <BadgeGrid badges={badges} />
    </div>
  );
}
