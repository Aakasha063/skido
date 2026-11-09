import { createFileRoute } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useEffect, useMemo, useRef, useState } from "react";
import { toast } from "sonner";
import { AppShell } from "@/components/AppShell";
import { SessionRow } from "@/components/sk/SessionRow";
import {
  ACCENT,
  Chips,
  Field,
  Icon,
  LINE,
  MiniStat,
  MUTED,
  Seg,
  SelectField,
  Sheet,
  Stat,
  TabHeader,
  TrendChart,
} from "@/components/sk/ui";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/lib/auth";
import { fetchStrengthHistory } from "@/lib/api";
import { useHistory, useMetrics, usePRs, useProfile } from "@/lib/hooks";
import { navyBodyFat } from "@/lib/bodyFat";
import { calculateCalorieTarget } from "@/lib/calories";
import { ACTIVITY_OPTIONS, GOALS, type GoalKey } from "@/lib/goals";
import { todayISO } from "@/lib/format";
import { fmtDate, fmtW, splitTitle } from "@/lib/skido";

type SegKey = "strength" | "body" | "history";

export const Route = createFileRoute("/progress")({
  validateSearch: (search: Record<string, unknown>): { seg?: SegKey } =>
    search["seg"] === "body" || search["seg"] === "history" || search["seg"] === "strength"
      ? { seg: search["seg"] as SegKey }
      : {},
  head: () => ({
    meta: [
      { title: "Progress — Skido" },
      {
        name: "description",
        content: "Strength trends, body measurements and your full workout history.",
      },
    ],
  }),
  component: () => (
    <AppShell tab="progress">
      <ProgressPage />
    </AppShell>
  ),
});

function ProgressPage() {
  const { seg = "strength" } = Route.useSearch();
  const navigate = Route.useNavigate();
  return (
    <>
      <TabHeader eyebrow="Your trends" title="Progress" />
      <Seg
        label="Progress views"
        options={[
          { value: "strength", label: "Strength" },
          { value: "body", label: "Body" },
          { value: "history", label: "History" },
        ]}
        value={seg}
        onChange={(v) => navigate({ search: { seg: v }, replace: true })}
        style={{ marginBottom: 22 }}
      />
      {seg === "strength" && <Strength />}
      {seg === "body" && <Body />}
      {seg === "history" && <History />}
    </>
  );
}

/* ───────────────────────── Strength ───────────────────────── */

function Strength() {
  const { user } = useAuth();
  const { data: points, isLoading } = useQuery({
    queryKey: ["strength-history", user?.id],
    queryFn: () => fetchStrengthHistory(user!.id),
    enabled: !!user,
  });
  const { data: prs } = usePRs();
  const [picked, setPicked] = useState<string | null>(null);
  const [showAll, setShowAll] = useState(false);

  const byExercise = useMemo(() => {
    const m = new Map<string, { name: string; pts: NonNullable<typeof points> }>();
    for (const p of points ?? []) {
      const e = m.get(p.exercise_id) ?? { name: p.exercise_name, pts: [] };
      e.pts.push(p);
      m.set(p.exercise_id, e);
    }
    return [...m.entries()].sort((a, b) => b[1].pts.length - a[1].pts.length);
  }, [points]);

  const selectedId =
    picked && byExercise.some(([id]) => id === picked) ? picked : byExercise[0]?.[0];
  const sel = byExercise.find(([id]) => id === selectedId)?.[1];
  const pts = sel ? [...sel.pts].sort((a, b) => a.session_date.localeCompare(b.session_date)) : [];
  const vals = pts.map((p) => p.best_e1rm);
  const best = vals.length ? Math.max(...vals) : 0;
  const delta = vals.length ? Math.round((vals[vals.length - 1]! - vals[0]!) * 10) / 10 : 0;
  const logged = [...pts].reverse();

  return (
    <div className="sk-fade">
      {isLoading && <div className="sk-skel" style={{ height: 320, borderRadius: 24 }} />}
      {!isLoading && byExercise.length === 0 && (
        <p
          className="sk-surface"
          style={{
            margin: 0,
            padding: 20,
            borderRadius: 20,
            fontSize: 13.5,
            lineHeight: 1.5,
            color: MUTED,
          }}
        >
          Log a few weighted sets and your strength trend for each exercise will appear here.
        </p>
      )}
      {sel && (
        <>
          <Chips
            options={byExercise.map(([id, e]) => ({ value: id, label: e.name }))}
            value={selectedId!}
            onChange={(v) => {
              setPicked(v);
              setShowAll(false);
            }}
          />
          <section
            className="sk-surface"
            style={{ borderRadius: 24, padding: "20px 20px 16px", marginBottom: 16 }}
          >
            <p className="sk-cap" style={{ margin: 0 }}>
              Estimated 1RM
            </p>
            <div style={{ display: "flex", alignItems: "baseline", gap: 8, marginTop: 8 }}>
              <span className="sk-num" style={{ fontSize: 40, fontWeight: 400, lineHeight: 1 }}>
                {fmtW(best)}
              </span>
              <span style={{ fontSize: 14, color: "rgba(255,255,255,0.56)" }}>kg</span>
              {vals.length > 1 && (
                <span className="sk-pill is-accent" style={{ marginLeft: "auto" }}>
                  {delta >= 0 ? "+" : ""}
                  {fmtW(delta)} kg
                </span>
              )}
            </div>
            {vals.length > 1 ? (
              <>
                <div style={{ marginTop: 18 }}>
                  <TrendChart
                    values={vals}
                    label={`Estimated one-rep max from ${vals[0]} to ${vals[vals.length - 1]} kilograms`}
                  />
                </div>
                <div
                  style={{
                    display: "flex",
                    justifyContent: "space-between",
                    fontSize: 11.5,
                    color: "rgba(255,255,255,0.52)",
                    marginTop: 8,
                  }}
                >
                  <span>{fmtDate(pts[0]!.session_date)}</span>
                  <span>{fmtDate(pts[pts.length - 1]!.session_date)}</span>
                </div>
              </>
            ) : (
              <p style={{ margin: "18px 0 0", fontSize: 13, color: "rgba(255,255,255,0.56)" }}>
                One more session and you'll see a trend line.
              </p>
            )}
            <div className="sk-stat-row" style={{ marginTop: 16, paddingTop: 14, borderTop: LINE }}>
              <MiniStat value={`${fmtW(vals[0] ?? 0)} kg`} label="Starting" />
              <MiniStat value={String(pts.length)} label="Sessions" />
              <MiniStat value={fmtDate(pts[pts.length - 1]!.session_date)} label="Last trained" />
            </div>
          </section>

          <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
            {(showAll ? logged : logged.slice(0, 5)).map((p) => (
              <div
                key={p.session_date}
                className="sk-row"
                style={{ display: "flex", alignItems: "center", gap: 14, padding: "12px 16px" }}
              >
                <span
                  className="sk-num"
                  style={{ flex: 1, fontSize: 13, color: MUTED, letterSpacing: 0 }}
                >
                  {fmtDate(p.session_date, { day: "numeric", month: "short", year: "numeric" })}
                </span>
                <span className="sk-num" style={{ fontSize: 13.5, letterSpacing: 0 }}>
                  {fmtW(p.best_weight)} kg × {p.best_reps}
                </span>
                <span
                  className="sk-num"
                  style={{
                    width: 92,
                    textAlign: "right",
                    fontSize: 12.5,
                    color: "rgba(255,255,255,0.56)",
                    letterSpacing: 0,
                  }}
                >
                  e1RM {fmtW(p.best_e1rm)}
                </span>
              </div>
            ))}
          </div>
          {logged.length > 5 && (
            <button
              type="button"
              className="sk-link-btn"
              onClick={() => setShowAll((v) => !v)}
              style={{ marginTop: 12 }}
            >
              {showAll ? "Show less" : `Show all ${logged.length} sessions`}
            </button>
          )}
        </>
      )}

      <h2 className="sk-h-section" style={{ margin: "24px 0 12px" }}>
        Personal records
      </h2>
      <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
        {(prs ?? []).length === 0 && (
          <p style={{ margin: 0, padding: "16px 18px", fontSize: 13.5, color: MUTED }}>
            No PRs yet — finish a session to set some.
          </p>
        )}
        {(prs ?? []).map((p, i) => {
          const isVolume = p.record_type === "volume";
          return (
            <div
              key={p.id}
              className="sk-row"
              style={{ display: "flex", alignItems: "center", gap: 14, padding: "14px 16px" }}
            >
              <span
                style={{
                  width: 34,
                  height: 34,
                  borderRadius: 10,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  background: "rgba(255,255,255,0.05)",
                  flexShrink: 0,
                }}
              >
                <Icon name="trophy" size={15} color={i === 0 ? ACCENT : "rgba(255,255,255,0.68)"} />
              </span>
              <div style={{ flex: 1, minWidth: 0 }}>
                <p style={{ margin: 0, fontSize: 14, fontWeight: 500 }}>
                  {(p.exercises as { name: string } | null)?.name ?? "Exercise"}
                </p>
                <p style={{ margin: "3px 0 0", fontSize: 12.5, color: "rgba(255,255,255,0.56)" }}>
                  {isVolume ? "Volume" : "Strength"} · {fmtDate(p.achieved_on)}
                </p>
              </div>
              <span
                className="sk-num"
                style={{ fontSize: 14, letterSpacing: 0, whiteSpace: "nowrap" }}
              >
                {isVolume
                  ? `${Math.round(Number(p.volume_kg ?? 0))} kg`
                  : `${fmtW(Number(p.weight_kg))} kg × ${p.reps}`}
              </span>
            </div>
          );
        })}
      </div>
    </div>
  );
}

/* ───────────────────────── Body ───────────────────────── */

type MetricRow = NonNullable<ReturnType<typeof useMetrics>["data"]>[number];
const latestWith = (rows: MetricRow[], key: keyof MetricRow) =>
  [...rows].reverse().find((m) => m[key] != null);

function Body() {
  const { user } = useAuth();
  const qc = useQueryClient();
  const { data: profile } = useProfile();
  const { data } = useMetrics();
  const rows = data ?? [];

  const [sheet, setSheet] = useState<null | "measure" | "bodyfat" | "calories">(null);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [weightInput, setWeightInput] = useState("");
  const [waistInput, setWaistInput] = useState("");
  const [sex, setSex] = useState<"male" | "female">("male");
  const [height, setHeight] = useState("");
  const [neck, setNeck] = useState("");
  const [bfWaist, setBfWaist] = useState("");
  const [hip, setHip] = useState("");
  const [age, setAge] = useState("");
  const [activity, setActivity] = useState("1.55");
  const [goal, setGoal] = useState<GoalKey>("cut");
  const [calculated, setCalculated] = useState<ReturnType<typeof calculateCalorieTarget> | null>(
    null,
  );
  const [saving, setSaving] = useState(false);
  const [metric, setMetric] = useState<"weight" | "waist">("weight");
  const [period, setPeriod] = useState<"1m" | "3m" | "all">("3m");
  const [expanded, setExpanded] = useState(false);

  const weights = rows.filter((m) => m.weight_kg != null);
  const waists = rows.filter((m) => m.waist_cm != null);
  const latestW = weights[weights.length - 1];
  const prevW = weights[weights.length - 2];
  const latestWa = waists[waists.length - 1];
  const prevWa = waists[waists.length - 2];
  const latestBf = latestWith(rows, "body_fat_percent");
  const latestCal = latestWith(rows, "target_calories");

  // Pre-fill the calculators once from onboarding / earlier measurements.
  const prefilled = useRef(false);
  useEffect(() => {
    if (prefilled.current || !profile || !data) return;
    prefilled.current = true;
    if (profile.sex === "male" || profile.sex === "female") setSex(profile.sex);
    if (profile.height_cm) setHeight(String(profile.height_cm));
    if (profile.activity_level) setActivity(String(profile.activity_level));
    if (profile.primary_goal && profile.primary_goal in GOALS)
      setGoal(profile.primary_goal as GoalKey);
    if (profile.date_of_birth)
      setAge(
        String(
          Math.floor(
            (Date.now() - new Date(profile.date_of_birth).getTime()) / (365.25 * 86400000),
          ),
        ),
      );
    const wa = latestWith(data, "waist_cm");
    const ne = latestWith(data, "neck_cm");
    const hp = latestWith(data, "hip_cm");
    if (wa?.waist_cm) setBfWaist(String(wa.waist_cm));
    if (ne?.neck_cm) setNeck(String(ne.neck_cm));
    if (hp?.hip_cm) setHip(String(hp.hip_cm));
  }, [profile, data]);

  const bodyFat = navyBodyFat({
    sex,
    height: Number(height),
    neck: Number(neck),
    waist: Number(bfWaist),
    hip: Number(hip),
  });
  const calcWeight = Number(weightInput) || Number(latestW?.weight_kg ?? 0);

  const delta = (a: number, b: number | undefined, unit: string) =>
    b == null
      ? "First entry"
      : `${a - b > 0 ? "+" : ""}${fmtW(Math.round((a - b) * 10) / 10)} ${unit} since last`;

  // Chart
  const source = metric === "weight" ? weights : waists;
  const valueOf = (m: MetricRow) => Number(metric === "weight" ? m.weight_kg : m.waist_cm);
  const days = { "1m": 31, "3m": 92, all: 100000 }[period];
  const lastTime = source.length
    ? new Date(`${source[source.length - 1]!.measured_on}T00:00`).getTime()
    : 0;
  const filtered = source.filter(
    (m) => (lastTime - new Date(`${m.measured_on}T00:00`).getTime()) / 86400000 <= days,
  );
  const vals = filtered.map(valueOf);
  const unit = metric === "weight" ? "kg" : "cm";
  const all = [...rows].reverse();

  async function run(
    op: () => PromiseLike<{ error: { message: string } | null }>,
    success: string,
  ) {
    if (!user) return;
    setSaving(true);
    try {
      const { error } = await op();
      if (error) {
        toast.error(error.message);
        return;
      }
      toast.success(success);
      qc.invalidateQueries({ queryKey: ["metrics", user.id] });
      setSheet(null);
    } finally {
      setSaving(false);
    }
  }

  const saveMeasure = () =>
    run(
      () =>
        editingId
          ? supabase
              .from("body_metrics")
              .update({
                weight_kg: weightInput ? Number(weightInput) : null,
                waist_cm: waistInput ? Number(waistInput) : null,
              })
              .eq("id", editingId)
          : supabase.from("body_metrics").insert({
              user_id: user!.id,
              measured_on: todayISO(),
              weight_kg: weightInput ? Number(weightInput) : null,
              waist_cm: waistInput ? Number(waistInput) : null,
            }),
      editingId ? "Measurement updated" : "Measurement saved",
    ).then(() => {
      setWeightInput("");
      setWaistInput("");
    });

  const saveBodyFat = () =>
    bodyFat != null &&
    run(
      () =>
        supabase.from("body_metrics").insert({
          user_id: user!.id,
          measured_on: todayISO(),
          body_fat_percent: bodyFat,
          height_cm: Number(height),
          waist_cm: Number(bfWaist),
          neck_cm: Number(neck) || null,
          hip_cm: sex === "female" ? Number(hip) || null : null,
        }),
      `Body fat ${bodyFat}% saved`,
    );

  function calculate() {
    if (calcWeight <= 0) {
      toast.error("Enter your bodyweight or save a measurement");
      return;
    }
    if (bodyFat == null && (Number(height) <= 0 || Number(age) <= 0)) {
      toast.error("Enter height and age, or calculate body fat first");
      return;
    }
    setCalculated(
      calculateCalorieTarget({
        weightKg: calcWeight,
        heightCm: Number(height),
        age: Number(age),
        sex,
        activityFactor: Number(activity),
        goal,
        bodyFatPercent: bodyFat,
      }),
    );
  }

  const saveCalories = () =>
    calculated &&
    run(
      () =>
        supabase.from("body_metrics").insert({
          user_id: user!.id,
          measured_on: todayISO(),
          weight_kg: calcWeight > 0 ? calcWeight : null,
          target_calories: calculated.targetCals,
        }),
      `Target ${calculated.targetCals} kcal saved`,
    );

  const openMeasure = () => {
    setEditingId(null);
    setWeightInput("");
    setWaistInput("");
    setSheet("measure");
  };

  const snapshot = [
    {
      label: "Weight",
      value: latestW ? fmtW(Number(latestW.weight_kg)) : "—",
      unit: latestW ? "kg" : undefined,
      note: latestW
        ? delta(Number(latestW.weight_kg), prevW ? Number(prevW.weight_kg) : undefined, "kg")
        : "Not logged",
      good: !!latestW && !!prevW && Number(latestW.weight_kg) < Number(prevW.weight_kg),
      open: openMeasure,
    },
    {
      label: "Waist",
      value: latestWa ? fmtW(Number(latestWa.waist_cm)) : "—",
      unit: latestWa ? "cm" : undefined,
      note: latestWa
        ? delta(Number(latestWa.waist_cm), prevWa ? Number(prevWa.waist_cm) : undefined, "cm")
        : "Not logged",
      good: !!latestWa && !!prevWa && Number(latestWa.waist_cm) < Number(prevWa.waist_cm),
      open: openMeasure,
    },
    {
      label: "Body fat",
      value: latestBf ? fmtW(Number(latestBf.body_fat_percent)) : "—",
      unit: latestBf ? "%" : undefined,
      note: latestBf ? "US Navy estimate" : "Tap to estimate",
      good: false,
      open: () => setSheet("bodyfat"),
    },
    {
      label: "Calories",
      value: latestCal ? String(Math.round(Number(latestCal.target_calories))) : "—",
      unit: latestCal ? "kcal" : undefined,
      note: latestCal ? "Daily target" : "Tap to calculate",
      good: false,
      open: () => {
        setCalculated(null);
        setSheet("calories");
      },
    },
  ];

  return (
    <div className="sk-fade">
      <div className="sk-surface sk-grid2" style={{ marginBottom: 16 }}>
        {snapshot.map((s) => (
          <button
            key={s.label}
            type="button"
            onClick={s.open}
            className="sk-row-btn"
            style={{ display: "block", padding: "16px 18px" }}
          >
            <Stat
              label={s.label}
              value={s.value}
              unit={s.unit}
              note={s.note}
              noteColor={s.good ? ACCENT : undefined}
            />
          </button>
        ))}
      </div>

      <section
        className="sk-surface"
        style={{ borderRadius: 24, padding: "18px 20px 16px", marginBottom: 16 }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            gap: 10,
            marginBottom: 16,
            flexWrap: "wrap",
          }}
        >
          <Seg
            label="Chart metric"
            options={[
              { value: "weight", label: "Weight" },
              { value: "waist", label: "Waist" },
            ]}
            value={metric}
            onChange={setMetric}
            style={{ flex: "0 0 auto" }}
            btnStyle={{ padding: "0 14px" }}
          />
          <div style={{ display: "flex", gap: 4 }}>
            {(
              [
                ["1m", "1M"],
                ["3m", "3M"],
                ["all", "All"],
              ] as const
            ).map(([k, label]) => (
              <button
                key={k}
                type="button"
                className="sk-mini-btn"
                aria-pressed={period === k}
                onClick={() => setPeriod(k)}
              >
                {label}
              </button>
            ))}
          </div>
        </div>
        {vals.length >= 2 ? (
          <>
            <TrendChart
              values={vals}
              color="rgba(255,255,255,0.75)"
              height={130}
              label={`${metric} from ${vals[0]} to ${vals[vals.length - 1]} ${unit}`}
            />
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                fontSize: 11.5,
                color: "rgba(255,255,255,0.52)",
                marginTop: 8,
              }}
            >
              <span>{fmtDate(filtered[0]!.measured_on)}</span>
              <span>
                {fmtW(Math.min(...vals))}–{fmtW(Math.max(...vals))} {unit}
              </span>
              <span>{fmtDate(filtered[filtered.length - 1]!.measured_on)}</span>
            </div>
          </>
        ) : (
          <p
            style={{
              margin: 0,
              padding: "40px 0",
              textAlign: "center",
              fontSize: 13,
              color: "rgba(255,255,255,0.56)",
            }}
          >
            Not enough measurements in this range yet.
          </p>
        )}
      </section>

      <div style={{ display: "flex", gap: 8, marginBottom: 24 }}>
        <button
          type="button"
          className="sk-btn sk-btn-light"
          onClick={openMeasure}
          style={{ height: 48, fontSize: 14, flex: "1.6 1 0", whiteSpace: "nowrap" }}
        >
          Log measurement
        </button>
        <button
          type="button"
          className="sk-btn sk-btn-quiet"
          onClick={() => setSheet("bodyfat")}
          style={{ height: 48, fontSize: 14, flex: "1 1 0" }}
        >
          Body fat
        </button>
        <button
          type="button"
          className="sk-btn sk-btn-quiet"
          onClick={() => {
            setCalculated(null);
            setSheet("calories");
          }}
          style={{ height: 48, fontSize: 14, flex: "1 1 0" }}
        >
          Calories
        </button>
      </div>

      <h2 className="sk-h-section" style={{ margin: "0 0 12px" }}>
        Measurements
      </h2>
      <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
        {all.length === 0 && (
          <p style={{ margin: 0, padding: "16px 18px", fontSize: 13.5, color: MUTED }}>
            No measurements yet — log your first weigh-in.
          </p>
        )}
        {(expanded ? all : all.slice(0, 4)).map((m, i) => (
          <div
            key={m.id}
            className="sk-row"
            style={{ display: "flex", alignItems: "center", gap: 14, padding: "14px 16px" }}
          >
            <div style={{ flex: 1, minWidth: 0 }}>
              <p style={{ margin: 0, fontSize: 14 }}>
                {[
                  m.weight_kg != null ? `${fmtW(Number(m.weight_kg))} kg` : null,
                  m.waist_cm != null ? `waist ${fmtW(Number(m.waist_cm))} cm` : null,
                  m.body_fat_percent != null
                    ? `${fmtW(Number(m.body_fat_percent))}% body fat`
                    : null,
                  m.target_calories ? `${Math.round(Number(m.target_calories))} kcal` : null,
                ]
                  .filter(Boolean)
                  .join(" · ") || "—"}
              </p>
              <p
                className="sk-num"
                style={{
                  margin: "3px 0 0",
                  fontSize: 12,
                  color: "rgba(255,255,255,0.56)",
                  letterSpacing: 0,
                }}
              >
                {fmtDate(m.measured_on, { day: "numeric", month: "short", year: "numeric" })}
              </p>
            </div>
            {i === 0 && (
              <button
                type="button"
                className="sk-link-btn"
                onClick={() => {
                  setEditingId(m.id);
                  setWeightInput(m.weight_kg != null ? String(m.weight_kg) : "");
                  setWaistInput(m.waist_cm != null ? String(m.waist_cm) : "");
                  setSheet("measure");
                }}
              >
                Edit
              </button>
            )}
          </div>
        ))}
      </div>
      {all.length > 4 && (
        <button
          type="button"
          className="sk-link-btn"
          onClick={() => setExpanded((v) => !v)}
          style={{ marginTop: 12 }}
        >
          {expanded ? "Show less" : `Show all ${all.length}`}
        </button>
      )}

      <Sheet
        open={sheet === "measure"}
        onClose={() => setSheet(null)}
        title={editingId ? "Edit measurement" : "Log measurement"}
        text="Weigh in at the same time of day for the cleanest trend."
      >
        <div style={{ display: "flex", gap: 10, marginBottom: 20 }}>
          <Field
            label="Bodyweight (kg)"
            inputMode="decimal"
            placeholder="80.4"
            value={weightInput}
            onChange={(e) => setWeightInput(e.target.value)}
            style={{ flex: 1 }}
          />
          <Field
            label="Waist (cm)"
            inputMode="decimal"
            placeholder="84"
            value={waistInput}
            onChange={(e) => setWaistInput(e.target.value)}
            style={{ flex: 1 }}
          />
        </div>
        <button
          type="button"
          className="sk-btn sk-btn-light"
          onClick={saveMeasure}
          disabled={saving || (!weightInput && !waistInput)}
        >
          {saving ? "Saving…" : editingId ? "Save changes" : "Save measurement"}
        </button>
      </Sheet>

      <Sheet
        open={sheet === "bodyfat"}
        onClose={() => setSheet(null)}
        title="Body-fat estimate"
        text="US Navy method — measure at the navel for waist and just below the larynx for neck."
      >
        <Seg
          radio
          label="Sex"
          options={[
            { value: "male", label: "Male" },
            { value: "female", label: "Female" },
          ]}
          value={sex}
          onChange={setSex}
          style={{ marginBottom: 14 }}
        />
        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(2, minmax(0, 1fr))",
            gap: 10,
            marginBottom: 18,
          }}
        >
          <Field
            label="Height (cm)"
            inputMode="numeric"
            placeholder="178"
            value={height}
            onChange={(e) => setHeight(e.target.value)}
          />
          <Field
            label="Neck (cm)"
            inputMode="decimal"
            placeholder="38"
            value={neck}
            onChange={(e) => setNeck(e.target.value)}
          />
          <Field
            label="Waist (cm)"
            inputMode="decimal"
            placeholder="84"
            value={bfWaist}
            onChange={(e) => setBfWaist(e.target.value)}
          />
          {sex === "female" && (
            <Field
              label="Hip (cm)"
              inputMode="decimal"
              placeholder="98"
              value={hip}
              onChange={(e) => setHip(e.target.value)}
            />
          )}
        </div>
        <div
          style={{
            display: "flex",
            alignItems: "baseline",
            justifyContent: "space-between",
            padding: "16px 18px",
            borderRadius: 16,
            background: "rgba(255,255,255,0.03)",
            border: "1px solid rgba(255,255,255,0.06)",
            marginBottom: 16,
          }}
        >
          <span className="sk-cap">US Navy estimate</span>
          <span>
            <span className="sk-num" style={{ fontSize: 28, fontWeight: 400 }}>
              {bodyFat != null ? fmtW(bodyFat) : "—"}
            </span>
            {bodyFat != null && (
              <span style={{ fontSize: 13, color: "rgba(255,255,255,0.56)", marginLeft: 3 }}>
                %
              </span>
            )}
          </span>
        </div>
        <button
          type="button"
          className="sk-btn sk-btn-light"
          onClick={saveBodyFat}
          disabled={bodyFat == null || saving}
        >
          {saving ? "Saving…" : "Save estimate"}
        </button>
      </Sheet>

      <Sheet
        open={sheet === "calories"}
        onClose={() => setSheet(null)}
        title="Daily calorie target"
        text="Estimated from your latest bodyweight and activity level."
      >
        <div
          style={{
            display: "grid",
            gridTemplateColumns: "repeat(2, minmax(0, 1fr))",
            gap: 10,
            marginBottom: 12,
          }}
        >
          <Field
            label="Height (cm)"
            inputMode="numeric"
            placeholder="178"
            value={height}
            onChange={(e) => setHeight(e.target.value)}
          />
          <Field
            label="Age"
            inputMode="numeric"
            placeholder="28"
            value={age}
            onChange={(e) => setAge(e.target.value)}
          />
        </div>
        <div style={{ display: "flex", flexDirection: "column", gap: 12, marginBottom: 18 }}>
          <SelectField
            label="Activity"
            value={activity}
            onChange={setActivity}
            options={ACTIVITY_OPTIONS}
          />
          <SelectField
            label="Goal"
            value={goal}
            onChange={(v) => setGoal(v as GoalKey)}
            options={Object.entries(GOALS).map(([k, g]) => ({ value: k, label: g.label }))}
          />
        </div>
        <p style={{ margin: "0 0 14px", fontSize: 12, color: "rgba(255,255,255,0.56)" }}>
          {bodyFat != null
            ? `Using Katch-McArdle with ${bodyFat}% body fat at ${fmtW(calcWeight)} kg.`
            : `Using Mifflin-St Jeor at ${calcWeight ? `${fmtW(calcWeight)} kg` : "your latest weight"} — add height and age.`}
        </p>
        {calculated && (
          <div
            className="sk-surface"
            style={{
              borderRadius: 18,
              padding: 18,
              marginBottom: 16,
              animation: "sk-scaleIn .3s ease-out",
            }}
          >
            <p className="sk-cap" style={{ margin: 0 }}>
              Daily target · {GOALS[goal].label}
            </p>
            <p
              className="sk-num"
              style={{ margin: "6px 0 0", fontSize: 36, fontWeight: 400, lineHeight: 1 }}
            >
              {calculated.targetCals}
              <span
                style={{
                  fontSize: 14,
                  color: "rgba(255,255,255,0.56)",
                  marginLeft: 4,
                  letterSpacing: 0,
                }}
              >
                kcal
              </span>
            </p>
            <p style={{ margin: "6px 0 14px", fontSize: 12.5, color: "rgba(255,255,255,0.56)" }}>
              Maintenance ≈ {Math.round(calculated.tdee / 10) * 10} kcal
            </p>
            <div className="sk-stat-row" style={{ paddingTop: 12, borderTop: LINE }}>
              <MiniStat value={`${calculated.protein}g`} label="Protein" />
              <MiniStat value={`${calculated.fat}g`} label="Fat" />
              <MiniStat value={`${calculated.carbs}g`} label="Carbs" />
            </div>
          </div>
        )}
        <div style={{ display: "flex", gap: 8 }}>
          <button type="button" className="sk-btn sk-btn-quiet" onClick={calculate}>
            Calculate
          </button>
          <button
            type="button"
            className="sk-btn sk-btn-light"
            onClick={saveCalories}
            disabled={!calculated || saving}
          >
            {saving ? "Saving…" : "Save target"}
          </button>
        </div>
      </Sheet>
    </div>
  );
}

/* ───────────────────────── History ───────────────────────── */

function History() {
  const { data: history, isLoading } = useHistory();
  const [filter, setFilter] = useState("all");
  const completed = (history ?? []).filter((s) => s.status === "completed");
  const names = [...new Set(completed.map((s) => splitTitle(s.title).day))];
  const list =
    filter === "all" ? completed : completed.filter((s) => splitTitle(s.title).day === filter);
  const secs = completed.reduce((a, s) => a + (s.duration_seconds ?? 0), 0);

  return (
    <div className="sk-fade">
      <div className="sk-surface sk-stat-row" style={{ borderRadius: 20, marginBottom: 16 }}>
        {[
          [String(completed.length), "Sessions"],
          [`${Math.round(secs / 360) / 10}h`, "Time trained"],
          [String(completed.reduce((a, s) => a + s.working_sets, 0)), "Working sets"],
        ].map(([v, l]) => (
          <div key={l} style={{ padding: "16px 18px" }}>
            <p className="sk-num" style={{ margin: 0, fontSize: 24, fontWeight: 400 }}>
              {v}
            </p>
            <p className="sk-cap" style={{ margin: "2px 0 0" }}>
              {l}
            </p>
          </div>
        ))}
      </div>
      {names.length > 1 && (
        <Chips
          options={[{ value: "all", label: "All" }, ...names.map((n) => ({ value: n, label: n }))]}
          value={filter}
          onChange={setFilter}
        />
      )}
      <div className="sk-surface" style={{ borderRadius: 20, overflow: "hidden" }}>
        {isLoading && <div className="sk-skel" style={{ height: 200, borderRadius: 0 }} />}
        {!isLoading && list.length === 0 && (
          <p style={{ margin: 0, padding: "16px 18px", fontSize: 13.5, color: MUTED }}>
            No sessions yet — finished workouts appear here.
          </p>
        )}
        {list.map((s) => (
          <SessionRow key={s.id} s={s} />
        ))}
      </div>
    </div>
  );
}
