import { createFileRoute, Link, useRouter } from "@tanstack/react-router";
import { useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";
import { AppShell, signOut } from "@/components/AppShell";
import {
  Avatar,
  BadgeGrid,
  Chevron,
  Field,
  Icon,
  LINE,
  MUTED,
  ProgressBar,
  SectionTitle,
  SelectField,
  Sheet,
} from "@/components/sk/ui";
import { useAuth } from "@/lib/auth";
import { saveProfile, uploadAvatar } from "@/lib/api";
import {
  displayName,
  goalLabel,
  useHistory,
  useLeaderboard,
  usePlanDays,
  useProfile,
  useTemplate,
} from "@/lib/hooks";
import { badgesFor, challengesFor, streakDays, weekStartISO } from "@/lib/skido";
import { buildWeekStatus } from "@/lib/weekStatus";

export const Route = createFileRoute("/profile")({
  head: () => ({
    meta: [
      { title: "Profile — Skido" },
      {
        name: "description",
        content: "Your Iron score, level, achievements, weekly challenges and account settings.",
      },
    ],
  }),
  component: () => (
    <AppShell tab="profile">
      <ProfilePage />
    </AppShell>
  ),
});

const SWATCHES = [
  { name: "Lime", color: "#C6F432" },
  { name: "White", color: "#FFFFFF" },
  { name: "Silver", color: "#D4D4D4" },
  { name: "Grey", color: "#A1A1A1" },
  { name: "Graphite", color: "#6E6E70" },
];
const GOAL_OPTIONS = ["Fat loss", "Recomp", "Muscle gain", "Strength"];

function ProfilePage() {
  const { user } = useAuth();
  const qc = useQueryClient();
  const router = useRouter();
  const { data: profile } = useProfile();
  const { data: history } = useHistory();
  const { days, hasCustom } = usePlanDays();
  const { data: template } = useTemplate();
  const board = useLeaderboard();
  const [sheet, setSheet] = useState<null | "profile" | "avatar">(null);
  const [nameField, setNameField] = useState("");
  const [goalField, setGoalField] = useState("Fat loss");
  const [busy, setBusy] = useState(false);

  const name = displayName(profile, user?.email);
  const completed = (history ?? []).filter((s) => s.status === "completed");
  const totalSets = completed.reduce((a, s) => a + s.working_sets, 0);
  const prCount = completed.reduce((a, s) => a + s.pr_count, 0);
  const streak = streakDays(completed.map((s) => s.session_date));
  const month = new Date().toISOString().slice(0, 7);
  const prsThisMonth = completed
    .filter((s) => s.session_date.startsWith(month))
    .reduce((a, s) => a + s.pr_count, 0);
  const weekStart = weekStartISO();
  const setsThisWeek = completed
    .filter((s) => s.session_date >= weekStart)
    .reduce((a, s) => a + s.working_sets, 0);
  const week = buildWeekStatus(history ?? [], profile?.created_at?.slice(0, 10) ?? "");
  const mandatory = days.filter((d) => !d.is_optional && !d.is_rest);
  const weekDone = mandatory.filter((d) => week.statusFor(d).isDone).length;

  const badges = badgesFor({ sessions: completed.length, streakDays: streak, prCount, totalSets });
  const challenges = challengesFor({
    weekDone,
    weekTarget: mandatory.length || 5,
    prsThisMonth,
    setsThisWeek,
  });
  const { level, myScore, myRank, ranked } = board;
  const above = myRank > 1 ? ranked[myRank - 2] : null;
  const planName = hasCustom ? "Custom plan" : (template?.name ?? "—");

  async function save(patch: Parameters<typeof saveProfile>[1], success?: string) {
    if (!user) return;
    setBusy(true);
    try {
      await saveProfile(user.id, patch);
      await qc.invalidateQueries({ queryKey: ["profile"] });
      if (success) toast.success(success);
      return true;
    } catch (e) {
      toast.error((e as Error).message);
      return false;
    } finally {
      setBusy(false);
    }
  }

  async function onAvatarFile(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = "";
    if (!file || !user) return;
    setBusy(true);
    try {
      const publicUrl = await uploadAvatar(user.id, file);
      await saveProfile(user.id, { avatar_url: publicUrl, avatar_color: null });
      await qc.invalidateQueries({ queryKey: ["profile"] });
      toast.success("Profile photo updated");
    } catch (err) {
      toast.error((err as Error).message || "Failed to upload photo");
    } finally {
      setBusy(false);
    }
  }

  return (
    <>
      <section
        className="sk-fade"
        style={{ display: "flex", alignItems: "center", gap: 16, marginBottom: 24 }}
      >
        <button
          type="button"
          onClick={() => setSheet("avatar")}
          aria-label="Change profile picture"
          style={{
            position: "relative",
            padding: 0,
            border: "none",
            background: "transparent",
            cursor: "pointer",
            flexShrink: 0,
          }}
        >
          <Avatar
            name={name}
            image={profile?.avatar_url}
            color={profile?.avatar_color}
            size={68}
            radius={22}
            fontSize={22}
          />
          <span
            aria-hidden="true"
            style={{
              position: "absolute",
              right: -4,
              bottom: -4,
              width: 24,
              height: 24,
              borderRadius: 999,
              background: "#252526",
              border: "2px solid #0B0B0C",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              color: "rgba(255,255,255,0.88)",
            }}
          >
            <Icon name="edit" size={11} stroke={2.4} />
          </span>
        </button>
        <div style={{ flex: 1, minWidth: 0 }}>
          <h1 style={{ margin: 0, fontSize: 20, fontWeight: 600, letterSpacing: "-0.025em" }}>
            {name}
          </h1>
          <p
            style={{
              margin: "3px 0 0",
              fontSize: 13,
              color: MUTED,
              whiteSpace: "nowrap",
              overflow: "hidden",
              textOverflow: "ellipsis",
            }}
          >
            {user?.email}
          </p>
          <div style={{ display: "flex", gap: 6, marginTop: 8, flexWrap: "wrap" }}>
            {goalLabel(profile?.primary_goal) && (
              <span className="sk-pill">{goalLabel(profile?.primary_goal)}</span>
            )}
            <span className="sk-pill is-accent">{level.current.name}</span>
          </div>
        </div>
        <button
          type="button"
          className="sk-icon-btn sk-text-pill"
          onClick={() => {
            setNameField(profile?.name ?? "");
            setGoalField(goalLabel(profile?.primary_goal) ?? "Fat loss");
            setSheet("profile");
          }}
        >
          Edit
        </button>
      </section>

      <section
        className="sk-fade sk-surface"
        style={{ borderRadius: 24, padding: "20px 22px", marginBottom: 16, animationDelay: ".05s" }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "baseline",
            gap: 10,
          }}
        >
          <p className="sk-cap" style={{ margin: 0 }}>
            Level {level.index} · {level.current.name}
          </p>
          <span className="sk-num sk-cap" style={{ letterSpacing: 0 }}>
            {level.next ? `${level.next.min - myScore} to ${level.next.name}` : "Max level"}
          </span>
        </div>
        <p
          className="sk-num"
          style={{ margin: "8px 0 14px", fontSize: 36, fontWeight: 400, lineHeight: 1 }}
        >
          {myScore}
          <span
            style={{
              fontSize: 14,
              color: "rgba(255,255,255,0.56)",
              marginLeft: 6,
              letterSpacing: 0,
            }}
          >
            Iron score
          </span>
        </p>
        <ProgressBar pct={level.pct} />
        <div className="sk-stat-row" style={{ marginTop: 18, paddingTop: 16, borderTop: LINE }}>
          {[
            [String(completed.length), "Sessions"],
            [String(totalSets), "Sets"],
            [String(prCount), "Records"],
            [`${streak} day${streak === 1 ? "" : "s"}`, "Streak"],
          ].map(([v, l]) => (
            <div key={l}>
              <p className="sk-num" style={{ margin: 0, fontSize: 18, fontWeight: 500 }}>
                {v}
              </p>
              <p className="sk-cap" style={{ margin: "2px 0 0" }}>
                {l}
              </p>
            </div>
          ))}
        </div>
      </section>

      <Link
        to="/leaderboard"
        className="sk-fade sk-surface sk-row-btn"
        style={{ borderRadius: 20, marginBottom: 28, padding: "16px 18px", animationDelay: ".08s" }}
      >
        <span
          style={{
            width: 36,
            height: 36,
            borderRadius: 11,
            background: "rgba(255,255,255,0.05)",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            flexShrink: 0,
          }}
        >
          <Icon name="trophyHandles" size={16} color="#C6F432" />
        </span>
        <span style={{ flex: 1, minWidth: 0 }}>
          <span style={{ display: "block", fontSize: 14, fontWeight: 500 }}>
            Leaderboard{myRank > 0 ? ` · #${myRank}` : ""}
          </span>
          <span style={{ display: "block", marginTop: 3, fontSize: 12.5, color: MUTED }}>
            {myRank === 0
              ? "Train this month to get ranked"
              : above
                ? `${above.score - myScore} points behind ${(above.display_name ?? "the next athlete").split(" ")[0]}`
                : "You're top of the board"}
          </span>
        </span>
        <Chevron />
      </Link>

      <SectionTitle
        title="Achievements"
        right={
          <span className="sk-cap">{`${badges.filter((b) => b.earned).length} of ${badges.length}`}</span>
        }
        style={{ marginTop: 0 }}
      />
      <div className="sk-fade" style={{ marginBottom: 28, animationDelay: ".12s" }}>
        <BadgeGrid badges={badges} />
      </div>

      <SectionTitle
        title="This week's challenges"
        right={
          <span className="sk-cap">{`${challenges.filter((c) => c.done).length} of ${challenges.length} complete`}</span>
        }
        style={{ marginTop: 0 }}
      />
      <div
        className="sk-fade sk-surface"
        style={{ borderRadius: 20, overflow: "hidden", marginBottom: 28, animationDelay: ".16s" }}
      >
        {challenges.map((c, i) => (
          <div key={c.label} style={{ padding: "16px 18px", borderTop: i ? LINE : "none" }}>
            <div style={{ display: "flex", justifyContent: "space-between", gap: 10 }}>
              <p style={{ margin: 0, fontSize: 14, fontWeight: 500 }}>{c.label}</p>
              <span className="sk-num sk-cap" style={{ letterSpacing: 0 }}>
                {c.progressLabel}
              </span>
            </div>
            <p style={{ margin: "3px 0 10px", fontSize: 12.5, color: "rgba(255,255,255,0.56)" }}>
              {c.hint} · +{c.rewardXp} XP
            </p>
            <div
              style={{
                height: 3,
                borderRadius: 999,
                background: "rgba(255,255,255,0.08)",
                overflow: "hidden",
              }}
            >
              <div
                style={{
                  height: "100%",
                  width: `${c.pct}%`,
                  borderRadius: 999,
                  background: c.done
                    ? "linear-gradient(90deg, rgba(198,244,50,0.25), #C6F432)"
                    : "linear-gradient(90deg, rgba(198,244,50,0.15), rgba(198,244,50,0.7))",
                }}
              />
            </div>
          </div>
        ))}
      </div>

      <div
        className="sk-fade sk-surface"
        style={{ borderRadius: 20, overflow: "hidden", animationDelay: ".18s" }}
      >
        <Link to="/plan" className="sk-row-btn">
          <span style={{ flex: 1, fontSize: 14 }}>Training plan</span>
          <span
            className="sk-cap"
            style={{
              maxWidth: 160,
              whiteSpace: "nowrap",
              overflow: "hidden",
              textOverflow: "ellipsis",
            }}
          >
            {planName}
          </span>
          <Chevron />
        </Link>
        <Link to="/progress" search={{ seg: "body" }} className="sk-row-btn">
          <span style={{ flex: 1, fontSize: 14 }}>Body &amp; calories</span>
          <Chevron />
        </Link>
        <button
          type="button"
          className="sk-row-btn"
          disabled={busy}
          onClick={async () => {
            setBusy(true);
            try {
              await signOut(qc);
              router.navigate({ to: "/auth" });
            } catch (e) {
              toast.error((e as Error).message);
              setBusy(false);
            }
          }}
        >
          <span style={{ flex: 1, fontSize: 14, color: "#FF6B6D" }}>Sign out</span>
        </button>
      </div>

      <Sheet
        open={sheet === "profile"}
        onClose={() => setSheet(null)}
        title="Edit profile"
        text="How you appear on the leaderboard."
      >
        <div style={{ display: "flex", flexDirection: "column", gap: 12, marginBottom: 20 }}>
          <Field
            label="Display name"
            value={nameField}
            onChange={(e) => setNameField(e.target.value)}
          />
          <SelectField
            label="Primary goal"
            value={goalField}
            onChange={setGoalField}
            options={GOAL_OPTIONS.map((g) => ({ value: g, label: g }))}
          />
        </div>
        <button
          type="button"
          className="sk-btn sk-btn-light"
          disabled={busy}
          onClick={async () => {
            if (
              await save(
                {
                  name: nameField.trim() || null,
                  primary_goal: goalField || null,
                  training_experience: null,
                },
                "Profile updated",
              )
            )
              setSheet(null);
          }}
        >
          {busy ? "Saving…" : "Save changes"}
        </button>
      </Sheet>

      <Sheet
        open={sheet === "avatar"}
        onClose={() => setSheet(null)}
        title="Profile picture"
        text="Shown on your profile and the leaderboard."
      >
        <div style={{ display: "flex", justifyContent: "center", marginBottom: 20 }}>
          <Avatar
            name={name}
            image={profile?.avatar_url}
            color={profile?.avatar_color}
            size={88}
            radius={28}
            fontSize={28}
          />
        </div>
        <label
          className="sk-btn sk-btn-quiet"
          style={{ position: "relative", cursor: busy ? "wait" : "pointer", marginBottom: 10 }}
        >
          {busy ? "Uploading…" : "Upload a photo"}
          <input
            type="file"
            accept="image/*"
            onChange={onAvatarFile}
            disabled={busy}
            style={{ position: "absolute", width: 1, height: 1, opacity: 0 }}
          />
        </label>
        {profile?.avatar_url && (
          <button
            type="button"
            className="sk-btn"
            disabled={busy}
            onClick={() => save({ avatar_url: null }, "Profile photo removed")}
            style={{
              background: "transparent",
              color: "rgba(255,255,255,0.75)",
              height: 44,
              marginBottom: 8,
            }}
          >
            Remove photo
          </button>
        )}
        <p className="sk-cap" style={{ margin: "8px 0 10px", textAlign: "center" }}>
          Or choose a colour
        </p>
        <div style={{ display: "flex", justifyContent: "center", gap: 10 }}>
          {SWATCHES.map((sw) => {
            const on = !profile?.avatar_url && profile?.avatar_color === sw.color;
            return (
              <button
                key={sw.name}
                type="button"
                aria-label={sw.name}
                aria-pressed={on}
                onClick={() => save({ avatar_color: sw.color, avatar_url: null })}
                style={{
                  width: 36,
                  height: 36,
                  borderRadius: 999,
                  cursor: "pointer",
                  background: sw.color,
                  border: `2px solid ${on ? "#FFFFFF" : "transparent"}`,
                  boxShadow: "0 0 0 2px #171718 inset",
                  transition: "transform .15s",
                }}
              />
            );
          })}
        </div>
      </Sheet>
    </>
  );
}
