import { createFileRoute, Link } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";
import { AppShell } from "@/components/AppShell";
import {
  ACCENT,
  Chevron,
  LINE,
  MUTED,
  ProgressBar,
  Seg,
  Sheet,
  TabHeader,
} from "@/components/sk/ui";
import { useAuth } from "@/lib/auth";
import { fetchTemplatePreview, fetchWorkoutTemplates, setActiveTemplate } from "@/lib/api";
import { useHistory, usePlanDays, useProfile, useTemplate, type PlanDay } from "@/lib/hooks";
import { buildWeekStatus } from "@/lib/weekStatus";
import { DAY_LABELS } from "@/lib/format";
import { getSaturdayChoice, setSaturdayChoice } from "@/lib/saturday";

export const Route = createFileRoute("/plan")({
  head: () => ({
    meta: [
      { title: "Training Plan — Skido" },
      {
        name: "description",
        content:
          "Your weekly training plan: every session, the optional Saturday specialisation and your recovery day.",
      },
    ],
  }),
  component: () => (
    <AppShell tab="plan">
      <PlanPage />
    </AppShell>
  ),
});

const optionalLabel = (d: PlanDay) =>
  (d.focus ?? d.name ?? "").replace(/^Optional (Specialization|Activity): /, "");

function PlanPage() {
  const { user } = useAuth();
  const { data: profile } = useProfile();
  const { days, hasCustom, isLoading } = usePlanDays();
  const { data: template } = useTemplate();
  const { data: history } = useHistory();
  const [sheet, setSheet] = useState(false);
  const [satSlug, setSatSlug] = useState(() => getSaturdayChoice(user?.id));

  const week = buildWeekStatus(history ?? [], profile?.created_at?.slice(0, 10) ?? "");
  const training = days
    .filter((d) => !d.is_optional && d.day_of_week !== 0)
    .sort((a, b) => ((a.day_of_week + 6) % 7) - ((b.day_of_week + 6) % 7));
  const mandatory = training.filter((d) => !d.is_rest);
  const optional = days.filter((d) => d.is_optional && d.day_of_week !== 0);
  const sunday = days.find((d) => d.day_of_week === 0);
  const weekDone = mandatory.filter((d) => week.statusFor(d).isDone).length;
  const sat = optional.find((d) => d.slug === satSlug) ?? optional[0];

  const planName = hasCustom ? "Custom Weekly Plan" : (template?.name ?? "Your plan");
  const planSubtitle = hasCustom ? "Your personal routine" : (template?.description ?? "");
  const planMeta = [
    `${mandatory.length} mandatory session${mandatory.length === 1 ? "" : "s"}`,
    optional.length ? "Saturday optional" : null,
    sunday ? "Sunday recovery" : null,
  ]
    .filter(Boolean)
    .join(" · ");

  return (
    <>
      <TabHeader eyebrow="Week of training" title="Plan" />

      <section
        className="sk-fade sk-surface"
        style={{ borderRadius: 24, padding: "20px 22px", marginBottom: 16 }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "flex-start",
            gap: 12,
          }}
        >
          <div style={{ minWidth: 0 }}>
            <p className="sk-eyebrow" style={{ margin: 0 }}>
              Current plan
            </p>
            <h2
              style={{
                margin: "8px 0 0",
                fontSize: 20,
                fontWeight: 600,
                letterSpacing: "-0.025em",
              }}
            >
              {planName}
            </h2>
            {planSubtitle && (
              <p
                style={{
                  margin: "4px 0 0",
                  fontSize: 13.5,
                  lineHeight: 1.45,
                  color: MUTED,
                  display: "-webkit-box",
                  WebkitLineClamp: 2,
                  WebkitBoxOrient: "vertical",
                  overflow: "hidden",
                }}
              >
                {planSubtitle}
              </p>
            )}
          </div>
          <button type="button" className="sk-icon-btn sk-text-pill" onClick={() => setSheet(true)}>
            Change
          </button>
        </div>
        <p className="sk-cap" style={{ margin: "14px 0 0" }}>
          {planMeta}
        </p>
        <div style={{ marginTop: 18, paddingTop: 16, borderTop: LINE }}>
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              fontSize: 13,
              marginBottom: 10,
            }}
          >
            <span>This week</span>
            <span className="sk-num" style={{ color: MUTED, letterSpacing: 0 }}>
              {weekDone} of {mandatory.length} done
            </span>
          </div>
          <ProgressBar pct={mandatory.length ? (weekDone / mandatory.length) * 100 : 0} />
        </div>
      </section>

      <h2
        className="sk-fade sk-h-section"
        style={{ margin: "28px 0 12px", animationDelay: ".05s" }}
      >
        Training days
      </h2>
      <div
        className="sk-fade sk-surface"
        style={{ borderRadius: 20, overflow: "hidden", animationDelay: ".08s" }}
      >
        {isLoading && <div className="sk-skel" style={{ height: 240, borderRadius: 0 }} />}
        {!isLoading && training.length === 0 && (
          <p style={{ margin: 0, padding: 18, fontSize: 13.5, color: MUTED }}>
            No training days yet — pick a plan with Change.
          </p>
        )}
        {training.map((d) => (
          <DayRow key={d.id} day={d} status={week.statusFor(d)} />
        ))}
      </div>

      {optional.length > 0 && sat && (
        <>
          <h2
            className="sk-fade sk-h-section"
            style={{ margin: "28px 0 4px", animationDelay: ".1s" }}
          >
            Saturday · optional
          </h2>
          <p className="sk-fade sk-cap" style={{ margin: "0 0 12px", animationDelay: ".1s" }}>
            Pick this week's session
          </p>
          <div
            className="sk-fade sk-surface"
            style={{ borderRadius: 20, padding: 16, animationDelay: ".12s" }}
          >
            {optional.length > 1 && (
              <div
                className="sk-chips"
                style={{ margin: "0 0 4px", padding: 0, overflowX: "auto" }}
              >
                <Seg
                  label="Saturday focus"
                  options={optional.map((d) => ({ value: d.slug, label: optionalLabel(d) }))}
                  value={sat.slug}
                  onChange={(slug) => {
                    setSatSlug(slug);
                    setSaturdayChoice(user?.id, slug);
                  }}
                  style={{ flex: "1 0 auto" }}
                />
              </div>
            )}
            <Link
              to="/workout/$slug"
              params={{ slug: sat.slug }}
              className="sk-row-btn"
              style={{ marginTop: 8, padding: "12px 4px", borderRadius: 12 }}
            >
              <span style={{ flex: 1, minWidth: 0 }}>
                <span style={{ display: "block", fontSize: 14, fontWeight: 500 }}>
                  {optionalLabel(sat)}
                </span>
                <span style={{ display: "block", marginTop: 3, fontSize: 12.5, color: MUTED }}>
                  {[
                    `${sat.exercise_count} exercise${sat.exercise_count === 1 ? "" : "s"}`,
                    sat.estimated_minutes_min
                      ? `${sat.estimated_minutes_min}–${sat.estimated_minutes_max} min`
                      : null,
                    sat.cardio_note,
                  ]
                    .filter(Boolean)
                    .join(" · ")}
                </span>
              </span>
              <Chevron />
            </Link>
          </div>
        </>
      )}

      <div
        className="sk-fade sk-surface"
        style={{
          borderRadius: 20,
          padding: "16px 18px",
          marginTop: 16,
          display: "flex",
          gap: 14,
          alignItems: "flex-start",
          animationDelay: ".14s",
        }}
      >
        <span
          style={{
            width: 40,
            height: 40,
            borderRadius: 12,
            flexShrink: 0,
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            border: "1px dashed rgba(255,255,255,0.14)",
            fontSize: 12,
            fontWeight: 600,
            color: MUTED,
          }}
        >
          Sun
        </span>
        <div>
          <p style={{ margin: 0, fontSize: 14, fontWeight: 500 }}>Complete rest</p>
          <p style={{ margin: "4px 0 0", fontSize: 12.5, lineHeight: 1.5, color: MUTED }}>
            {sunday?.cardio_note ??
              sunday?.notes ??
              "Easy walking, light mobility, stretching if desired. Sleep and recover fully."}
          </p>
        </div>
      </div>

      <PlansSheet
        open={sheet}
        onClose={() => setSheet(false)}
        activeId={profile?.active_template_id ?? null}
        hasCustom={hasCustom}
      />
    </>
  );
}

function DayRow({
  day,
  status,
}: {
  day: PlanDay;
  status: ReturnType<ReturnType<typeof buildWeekStatus>["statusFor"]>;
}) {
  const st = day.is_rest
    ? "rest"
    : status.isDone
      ? "done"
      : status.isToday
        ? "today"
        : status.isMissed
          ? "missed"
          : "upcoming";
  const look = {
    done: {
      label: "Done",
      color: ACCENT,
      bg: "rgba(198,244,50,0.12)",
      ink: ACCENT,
      border: "1px solid transparent",
    },
    today: {
      label: "Today",
      color: "#FFFFFF",
      bg: "#FFFFFF",
      ink: "#0F0F10",
      border: "1px solid transparent",
    },
    missed: {
      label: "Missed",
      color: "#FF6B6D",
      bg: "transparent",
      ink: "rgba(255,255,255,0.75)",
      border: "1px solid rgba(255,255,255,0.12)",
    },
    upcoming: {
      label: "",
      color: MUTED,
      bg: "transparent",
      ink: "rgba(255,255,255,0.75)",
      border: "1px solid rgba(255,255,255,0.12)",
    },
    rest: {
      label: "Rest",
      color: MUTED,
      bg: "transparent",
      ink: MUTED,
      border: "1px dashed rgba(255,255,255,0.14)",
    },
  }[st];
  const meta = day.is_rest
    ? "Recovery"
    : [
        `${day.exercise_count} exercise${day.exercise_count === 1 ? "" : "s"}`,
        day.estimated_minutes_min
          ? `${day.estimated_minutes_min}–${day.estimated_minutes_max} min`
          : null,
        day.cardio_note ? "cardio" : null,
      ]
        .filter(Boolean)
        .join(" · ");
  return (
    <Link
      to="/workout/$slug"
      params={{ slug: day.slug }}
      className="sk-row-btn"
      style={{ padding: 16 }}
    >
      <span
        style={{
          width: 40,
          height: 40,
          borderRadius: 12,
          flexShrink: 0,
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          fontSize: 12,
          fontWeight: 600,
          background: look.bg,
          color: look.ink,
          border: look.border,
        }}
      >
        {day.day_of_week != null ? DAY_LABELS[day.day_of_week] : (day.name ?? "").slice(0, 3)}
      </span>
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
          {day.is_rest ? "Rest day" : (day.focus ?? day.name)}
        </span>
        <span style={{ display: "block", marginTop: 3, fontSize: 12.5, color: MUTED }}>{meta}</span>
      </span>
      <span style={{ fontSize: 12, fontWeight: 500, color: look.color, whiteSpace: "nowrap" }}>
        {look.label}
      </span>
      <Chevron />
    </Link>
  );
}

function PlansSheet({
  open,
  onClose,
  activeId,
  hasCustom,
}: {
  open: boolean;
  onClose: () => void;
  activeId: string | null;
  hasCustom: boolean;
}) {
  const { user } = useAuth();
  const qc = useQueryClient();
  const [preview, setPreview] = useState<string | null>(null);
  const [switching, setSwitching] = useState<string | null>(null);
  const { data: templates } = useQuery({
    queryKey: ["workout-templates"],
    queryFn: fetchWorkoutTemplates,
    enabled: open,
  });
  const enrolled = (templates ?? []).find((t) => t.id === activeId);
  const others = (templates ?? []).filter((t) => t.id !== activeId);

  async function switchTo(id: string) {
    if (!user) return;
    setSwitching(id);
    try {
      await setActiveTemplate(user.id, id);
      await Promise.all([
        qc.invalidateQueries({ queryKey: ["profile", user.id] }),
        qc.invalidateQueries({ queryKey: ["days", user.id] }),
      ]);
      toast.success("Plan switched");
      onClose();
    } catch (e) {
      toast.error((e as Error).message);
    } finally {
      setSwitching(null);
    }
  }

  return (
    <Sheet
      open={open}
      onClose={onClose}
      title="Training plans"
      text="Switch programmes when you're ready for a new block."
    >
      {enrolled && (
        <div
          className="sk-surface"
          style={{ borderRadius: 18, padding: "16px 18px", borderColor: "rgba(198,244,50,0.3)" }}
        >
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              gap: 10,
            }}
          >
            <p style={{ margin: 0, fontSize: 15, fontWeight: 500 }}>{enrolled.name}</p>
            <span className="sk-pill is-accent">
              {hasCustom ? "Overridden by custom" : "Enrolled"}
            </span>
          </div>
          {enrolled.description && (
            <p style={{ margin: "4px 0 0", fontSize: 13, lineHeight: 1.5, color: MUTED }}>
              {enrolled.description}
            </p>
          )}
          <PreviewToggle
            id={enrolled.id}
            open={preview === enrolled.id}
            onToggle={() => setPreview((p) => (p === enrolled.id ? null : enrolled.id))}
          />
        </div>
      )}
      {others.map((t) => (
        <div
          key={t.id}
          className="sk-surface"
          style={{ borderRadius: 18, padding: "16px 18px", marginTop: 10 }}
        >
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              gap: 10,
            }}
          >
            <p style={{ margin: 0, fontSize: 15, fontWeight: 500 }}>{t.name}</p>
            <button
              type="button"
              className="sk-icon-btn sk-text-pill"
              disabled={!!switching}
              onClick={() => switchTo(t.id)}
            >
              {switching === t.id ? "Switching…" : "Switch"}
            </button>
          </div>
          {t.description && (
            <p style={{ margin: "4px 0 0", fontSize: 13, lineHeight: 1.5, color: MUTED }}>
              {t.description}
            </p>
          )}
          <PreviewToggle
            id={t.id}
            open={preview === t.id}
            onToggle={() => setPreview((p) => (p === t.id ? null : t.id))}
          />
        </div>
      ))}

      <h3 className="sk-cap" style={{ margin: "22px 0 10px" }}>
        Custom plan
      </h3>
      <Link to="/builder" className="sk-btn sk-btn-quiet" onClick={onClose}>
        {hasCustom ? "Edit your custom plan" : "+ Build a custom plan"}
      </Link>
    </Sheet>
  );
}

function PreviewToggle({
  id,
  open,
  onToggle,
}: {
  id: string;
  open: boolean;
  onToggle: () => void;
}) {
  const { data, isLoading } = useQuery({
    queryKey: ["template-preview", id],
    queryFn: () => fetchTemplatePreview(id),
    enabled: open,
  });
  return (
    <>
      <button
        type="button"
        className="sk-link-btn"
        onClick={onToggle}
        aria-expanded={open}
        style={{ marginTop: 10, fontSize: 12.5 }}
      >
        {open ? "Hide preview" : "Preview this plan"}
      </button>
      {open && (
        <div style={{ marginTop: 10, display: "flex", flexDirection: "column", gap: 10 }}>
          {isLoading && <div className="sk-spinner" />}
          {!isLoading && (data ?? []).length === 0 && (
            <p style={{ margin: 0, fontSize: 12.5, color: MUTED }}>No days in this plan yet.</p>
          )}
          {(data ?? []).map((d) => (
            <div key={d.id} style={{ paddingTop: 10, borderTop: LINE }}>
              <p style={{ margin: 0, fontSize: 13, fontWeight: 500 }}>
                <span className="sk-cap" style={{ marginRight: 8 }}>
                  {d.day_of_week != null ? DAY_LABELS[d.day_of_week] : ""}
                </span>
                {d.is_rest ? "Rest day" : (d.focus ?? d.name)}
                {d.is_optional && <span className="sk-cap"> · optional</span>}
              </p>
              {d.exercises.length > 0 && (
                <ul
                  style={{
                    margin: "6px 0 0",
                    padding: 0,
                    listStyle: "none",
                    display: "flex",
                    flexDirection: "column",
                    gap: 3,
                  }}
                >
                  {d.exercises.map((we) => (
                    <li key={we.id} style={{ fontSize: 12.5, color: MUTED }}>
                      {(we.exercises as { name?: string } | null)?.name ?? "Exercise"} — {we.sets} ×{" "}
                      {we.rep_range}
                    </li>
                  ))}
                </ul>
              )}
              {d.cardio_note && (
                <p style={{ margin: "4px 0 0", fontSize: 12, color: "rgba(255,255,255,0.5)" }}>
                  Cardio: {d.cardio_note}
                </p>
              )}
            </div>
          ))}
        </div>
      )}
    </>
  );
}
