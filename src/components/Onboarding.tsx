import { useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";
import { supabase } from "@/integrations/supabase/client";
import type { Tables } from "@/integrations/supabase/types";
import { useAuth } from "@/lib/auth";
import { saveProfile } from "@/lib/api";
import { navyBodyFat } from "@/lib/bodyFat";
import { calculateCalorieTarget } from "@/lib/calories";
import { GOALS, type GoalKey } from "@/lib/goals";
import { todayISO } from "@/lib/format";

const TOTAL_STEPS = 7;

const LABEL_STYLE = { fontSize: 13, fontWeight: 500 };
const INPUT_STYLE = {
  height: 40,
  borderRadius: 8,
  border: "1px solid oklch(0.27 0.005 250)",
  background: "transparent",
  color: "inherit",
  padding: "0 12px",
  fontSize: 14,
  boxSizing: "border-box" as const,
  width: "100%",
};

function segButtonStyle(selected: boolean) {
  return {
    flex: 1,
    height: 40,
    borderRadius: 8,
    border: "1px solid oklch(0.27 0.005 250)",
    background: selected ? "oklch(0.92 0.25 110)" : "transparent",
    color: selected ? "oklch(0.07 0.01 110)" : "inherit",
    fontSize: 14,
    cursor: "pointer",
  };
}

function goalButtonStyle(selected: boolean) {
  return {
    textAlign: "left" as const,
    padding: "14px 16px",
    borderRadius: 10,
    border: `1px solid ${selected ? "oklch(0.92 0.25 110)" : "oklch(0.27 0.005 250)"}`,
    background: selected ? "oklch(0.92 0.25 110 / 10%)" : "transparent",
    color: "inherit",
    fontSize: 14,
    fontWeight: 500,
    cursor: "pointer",
  };
}

/** Available training plans — add more here as they launch. */
const PLANS = [
  {
    id: "v-taper",
    name: "V-Taper + Fat-Loss",
    subtitle: "5 mandatory days, Saturday optional",
    description: "Upper-lower split with lat-focus pulls, OHP, and daily cardio finishers. Ideal for 4–7 gym days.",
    minDays: 4,
    available: true,
    badge: "Recommended",
  },
  {
    id: "ppl",
    name: "Push / Pull / Legs",
    subtitle: "6 days, rest on Sunday",
    description: "Classic PPL split — high volume for intermediate lifters who can train 6 days a week.",
    minDays: 6,
    available: false,
    badge: "Coming soon",
  },
  {
    id: "3day-fullbody",
    name: "3-Day Full-Body",
    subtitle: "3 sessions per week",
    description: "Compound-focused full-body sessions Mon / Wed / Fri. Great for busy schedules.",
    minDays: 3,
    available: false,
    badge: "Coming soon",
  },
  {
    id: "2day-minimalist",
    name: "2-Day Minimalist",
    subtitle: "2 sessions per week",
    description: "Stripped-back strength for the time-constrained. Two full-body sessions.",
    minDays: 1,
    available: false,
    badge: "Coming soon",
  },
] as const;

type PlanId = (typeof PLANS)[number]["id"];

function recommendedPlan(gymDays: number): PlanId {
  if (gymDays >= 6) return "ppl";
  if (gymDays >= 4) return "v-taper";
  if (gymDays >= 3) return "3day-fullbody";
  return "2day-minimalist";
}

export function Onboarding() {
  const { user } = useAuth();
  const qc = useQueryClient();
  const [step, setStep] = useState(0);

  // Profile fields
  const [sex, setSex] = useState<"male" | "female">("male");
  const [height, setHeight] = useState("");
  const [weight, setWeight] = useState("");
  const [age, setAge] = useState("");
  const [activity, setActivity] = useState("1.55");
  const [goal, setGoal] = useState<GoalKey>("cut");
  const [gymDays, setGymDays] = useState<number>(4);
  const [injuries, setInjuries] = useState("");
  const [waist, setWaist] = useState("");
  const [neck, setNeck] = useState("");
  const [hip, setHip] = useState("");

  // Plan step
  const [selectedPlan, setSelectedPlan] = useState<PlanId | null>(null);
  const [saving, setSaving] = useState(false);

  const effectivePlanId = selectedPlan ?? recommendedPlan(gymDays);

  async function finish(skip: boolean, customPlan = false) {
    if (!user) return;
    setSaving(true);
    try {
      const patch: Partial<Tables<"profiles">> = { onboarding_completed: true };
      if (!skip) {
        if (sex) patch.sex = sex;
        if (height) patch.height_cm = Number(height);
        if (weight) {
          patch.current_weight_kg = Number(weight);
          patch.starting_weight_kg = Number(weight);
        }
        if (age) {
          const birthYear = new Date().getFullYear() - Number(age);
          patch.date_of_birth = `${birthYear}-01-01`;
        }
        if (activity) patch.activity_level = Number(activity);
        if (goal) patch.primary_goal = goal;
        patch.gym_days_per_week = gymDays;
        if (injuries.trim()) patch.past_injuries = injuries.trim();
      }

      await saveProfile(user.id, patch);

      if (!skip) {
        const weightNum = weight ? Number(weight) : null;
        const heightNum = height ? Number(height) : null;
        const ageNum = age ? Number(age) : null;
        const bf = navyBodyFat({
          sex,
          height: Number(height),
          neck: Number(neck),
          waist: Number(waist),
          hip: Number(hip),
        });

        let targetCals: number | null = null;
        if (weightNum && (bf != null || (heightNum && ageNum))) {
          targetCals = calculateCalorieTarget({
            weightKg: weightNum,
            heightCm: heightNum ?? 0,
            age: ageNum ?? 0,
            sex,
            activityFactor: Number(activity),
            goal,
            bodyFatPercent: bf,
          }).targetCals;
        }

        if (weightNum != null || waist || bf != null || targetCals != null) {
          const { error: metricErr } = await supabase.from("body_metrics").insert({
            user_id: user.id,
            measured_on: todayISO(),
            weight_kg: weightNum,
            waist_cm: waist ? Number(waist) : null,
            neck_cm: neck ? Number(neck) : null,
            hip_cm: sex === "female" && hip ? Number(hip) : null,
            height_cm: heightNum,
            body_fat_percent: bf,
            target_calories: targetCals,
          });
          if (metricErr) throw metricErr;
        }
      }

      qc.invalidateQueries({ queryKey: ["profile", user.id] });
      qc.invalidateQueries({ queryKey: ["metrics", user.id] });
    } catch (e) {
      toast.error(e instanceof Error ? e.message : "Failed to save — please try again");
      setSaving(false);
    }
  }

  const GYM_DAYS = [1, 2, 3, 4, 5, 6, 7];

  return (
    <div
      style={{
        display: "flex",
        minHeight: "100vh",
        alignItems: "center",
        justifyContent: "center",
        padding: "48px 20px",
        background: "oklch(0.045 0.003 250)",
        color: "oklch(0.96 0.002 250)",
        fontFamily: "'Inter', ui-sans-serif, system-ui, sans-serif",
        boxSizing: "border-box",
      }}
    >
      <div style={{ width: "100%", maxWidth: 460 }}>
        {/* Header */}
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
            marginBottom: 24,
          }}
        >
          <span
            style={{
              fontSize: 12,
              fontWeight: 600,
              color: "oklch(0.63 0.006 250)",
              textTransform: "uppercase",
              letterSpacing: "0.06em",
            }}
          >
            Step {step + 1} of {TOTAL_STEPS}
          </span>
          <button
            onClick={() => finish(true)}
            disabled={saving}
            style={{
              fontSize: 13,
              color: "oklch(0.63 0.006 250)",
              background: "transparent",
              border: "none",
              cursor: saving ? "wait" : "pointer",
              padding: 0,
            }}
          >
            Skip for now
          </button>
        </div>

        {/* Progress bar */}
        <div
          style={{
            height: 3,
            borderRadius: 999,
            background: "oklch(0.22 0.005 250)",
            overflow: "hidden",
            marginBottom: 32,
          }}
        >
          <div
            style={{
              height: "100%",
              background: "oklch(0.92 0.25 110)",
              width: `${((step + 1) / TOTAL_STEPS) * 100}%`,
              transition: "width 0.3s",
            }}
          />
        </div>

        {/* ── Step 0: Sex ─────────────────────────────────── */}
        {step === 0 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Tell us about yourself
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Used for accurate calorie and body-fat calculations. You can skip and fill this in
              later.
            </p>
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              <label style={LABEL_STYLE}>Sex</label>
              <div style={{ display: "flex", gap: 8 }}>
                <button onClick={() => setSex("male")} style={segButtonStyle(sex === "male")}>
                  Male
                </button>
                <button onClick={() => setSex("female")} style={segButtonStyle(sex === "female")}>
                  Female
                </button>
              </div>
            </div>
          </>
        )}

        {/* ── Step 1: Height & Weight ──────────────────────── */}
        {step === 1 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Height &amp; weight
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              This sets your starting point on the Body page.
            </p>
            <div style={{ display: "flex", gap: 12 }}>
              <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: 8 }}>
                <label style={LABEL_STYLE}>Height (cm)</label>
                <input
                  inputMode="numeric"
                  value={height}
                  onChange={(e) => setHeight(e.target.value)}
                  placeholder="178"
                  style={INPUT_STYLE}
                />
              </div>
              <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: 8 }}>
                <label style={LABEL_STYLE}>Weight (kg)</label>
                <input
                  inputMode="decimal"
                  value={weight}
                  onChange={(e) => setWeight(e.target.value)}
                  placeholder="82"
                  style={INPUT_STYLE}
                />
              </div>
            </div>
          </>
        )}

        {/* ── Step 2: Age & Activity ───────────────────────── */}
        {step === 2 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Age &amp; activity
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Used to estimate your daily calorie needs.
            </p>
            <div style={{ display: "flex", gap: 12, marginBottom: 16 }}>
              <div style={{ flex: 1, display: "flex", flexDirection: "column", gap: 8 }}>
                <label style={LABEL_STYLE}>Age</label>
                <input
                  inputMode="numeric"
                  value={age}
                  onChange={(e) => setAge(e.target.value)}
                  placeholder="28"
                  style={INPUT_STYLE}
                />
              </div>
            </div>
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              <label style={LABEL_STYLE}>Activity level</label>
              <select
                value={activity}
                onChange={(e) => setActivity(e.target.value)}
                style={{ ...INPUT_STYLE, background: "oklch(0.045 0.003 250)" }}
              >
                <option value="1.2">Sedentary — little exercise</option>
                <option value="1.375">Light — 1-3 sessions/week</option>
                <option value="1.55">Moderate — 3-5 sessions/week</option>
                <option value="1.725">High — 6-7 sessions/week</option>
                <option value="1.9">Very high — physical job + training</option>
              </select>
            </div>
          </>
        )}

        {/* ── Step 3: Goal ─────────────────────────────────── */}
        {step === 3 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              What's your goal?
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Sets your calorie target's direction.
            </p>
            <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
              {(Object.keys(GOALS) as GoalKey[]).map((key) => (
                <button
                  key={key}
                  onClick={() => setGoal(key)}
                  style={goalButtonStyle(goal === key)}
                >
                  {GOALS[key].label}
                </button>
              ))}
            </div>
          </>
        )}

        {/* ── Step 4: Gym days + Injuries ──────────────────── */}
        {step === 4 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Your schedule &amp; history
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Helps us suggest the best training plan for you.
            </p>

            {/* Gym days */}
            <div style={{ display: "flex", flexDirection: "column", gap: 8, marginBottom: 24 }}>
              <label style={LABEL_STYLE}>How many days a week can you train?</label>
              <div style={{ display: "flex", gap: 6 }}>
                {GYM_DAYS.map((d) => (
                  <button
                    key={d}
                    onClick={() => setGymDays(d)}
                    style={{
                      flex: 1,
                      height: 44,
                      borderRadius: 8,
                      border: `1px solid ${gymDays === d ? "oklch(0.92 0.25 110)" : "oklch(0.27 0.005 250)"}`,
                      background: gymDays === d ? "oklch(0.92 0.25 110 / 15%)" : "transparent",
                      color: gymDays === d ? "oklch(0.92 0.25 110)" : "oklch(0.63 0.006 250)",
                      fontSize: 15,
                      fontWeight: gymDays === d ? 700 : 500,
                      cursor: "pointer",
                      transition: "all 0.15s",
                    }}
                  >
                    {d}
                  </button>
                ))}
              </div>
              <p style={{ margin: 0, fontSize: 12, color: "oklch(0.45 0.006 250)" }}>
                {gymDays === 1
                  ? "1 day — Minimalist training"
                  : gymDays <= 3
                    ? `${gymDays} days — Full-body or Upper/Lower split`
                    : gymDays <= 5
                      ? `${gymDays} days — Split training recommended`
                      : `${gymDays} days — High-frequency training`}
              </p>
            </div>

            {/* Past injuries */}
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              <label style={LABEL_STYLE}>
                Any past injuries we should know about?{" "}
                <span style={{ color: "oklch(0.45 0.006 250)", fontWeight: 400 }}>(optional)</span>
              </label>
              <textarea
                value={injuries}
                onChange={(e) => setInjuries(e.target.value)}
                placeholder="e.g. Lower back pain, bad left knee, rotator cuff issue..."
                rows={3}
                style={{
                  ...INPUT_STYLE,
                  height: "auto",
                  padding: "10px 12px",
                  resize: "none",
                  lineHeight: 1.5,
                  fontFamily: "inherit",
                }}
              />
              <p style={{ margin: 0, fontSize: 12, color: "oklch(0.45 0.006 250)" }}>
                This helps you remember to be careful — we don't auto-remove exercises based on injuries.
              </p>
            </div>
          </>
        )}

        {/* ── Step 5: Body-fat measurements ────────────────── */}
        {step === 5 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Body-fat measurements
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Optional. Adds a starting body-fat estimate using the U.S. Navy method.
            </p>
            <div style={{ display: "flex", gap: 12, flexWrap: "wrap" }}>
              <div
                style={{ flex: 1, minWidth: 100, display: "flex", flexDirection: "column", gap: 8 }}
              >
                <label style={LABEL_STYLE}>Waist (cm)</label>
                <input
                  inputMode="decimal"
                  value={waist}
                  onChange={(e) => setWaist(e.target.value)}
                  placeholder="86"
                  style={INPUT_STYLE}
                />
              </div>
              <div
                style={{ flex: 1, minWidth: 100, display: "flex", flexDirection: "column", gap: 8 }}
              >
                <label style={LABEL_STYLE}>Neck (cm)</label>
                <input
                  inputMode="decimal"
                  value={neck}
                  onChange={(e) => setNeck(e.target.value)}
                  placeholder="38"
                  style={INPUT_STYLE}
                />
              </div>
              {sex === "female" && (
                <div
                  style={{
                    flex: 1,
                    minWidth: 100,
                    display: "flex",
                    flexDirection: "column",
                    gap: 8,
                  }}
                >
                  <label style={LABEL_STYLE}>Hip (cm)</label>
                  <input
                    inputMode="decimal"
                    value={hip}
                    onChange={(e) => setHip(e.target.value)}
                    placeholder="98"
                    style={INPUT_STYLE}
                  />
                </div>
              )}
            </div>
            <p style={{ margin: "12px 0 0", fontSize: 12, color: "oklch(0.4 0.006 250)" }}>
              Hip is only used for female body-fat estimates.
            </p>
          </>
        )}

        {/* ── Step 6: Plan selection ───────────────────────── */}
        {step === 6 && (
          <>
            <h1 style={{ margin: 0, fontSize: 24, fontWeight: 600, letterSpacing: "-0.02em" }}>
              Choose your training plan
            </h1>
            <p style={{ margin: "8px 0 28px", fontSize: 14, color: "oklch(0.63 0.006 250)" }}>
              Based on your schedule ({gymDays} day{gymDays !== 1 ? "s" : ""}/week) we've highlighted the best fit.
              You can switch plans at any time from the Plan page.
            </p>

            <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
              {PLANS.map((plan) => {
                const isRecommended = plan.id === recommendedPlan(gymDays);
                const isSelected = effectivePlanId === plan.id;
                return (
                  <button
                    key={plan.id}
                    onClick={() => plan.available && setSelectedPlan(plan.id as PlanId)}
                    disabled={!plan.available}
                    style={{
                      textAlign: "left" as const,
                      padding: "14px 16px",
                      borderRadius: 12,
                      border: `1px solid ${
                        isSelected && plan.available
                          ? "oklch(0.92 0.25 110)"
                          : isRecommended
                            ? "oklch(0.92 0.25 110 / 40%)"
                            : "oklch(0.27 0.005 250)"
                      }`,
                      background:
                        isSelected && plan.available
                          ? "oklch(0.92 0.25 110 / 10%)"
                          : "transparent",
                      color: "inherit",
                      cursor: plan.available ? "pointer" : "default",
                      opacity: !plan.available ? 0.55 : 1,
                      transition: "all 0.15s",
                      position: "relative" as const,
                    }}
                  >
                    <div
                      style={{
                        display: "flex",
                        alignItems: "flex-start",
                        justifyContent: "space-between",
                        gap: 8,
                      }}
                    >
                      <div>
                        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                          <p style={{ margin: 0, fontSize: 14, fontWeight: 600 }}>{plan.name}</p>
                          {isRecommended && plan.available && (
                            <span
                              style={{
                                borderRadius: 5,
                                background: "oklch(0.92 0.25 110)",
                                color: "oklch(0.07 0.01 110)",
                                padding: "2px 7px",
                                fontSize: 10,
                                fontWeight: 700,
                                letterSpacing: "0.04em",
                                textTransform: "uppercase" as const,
                              }}
                            >
                              Best fit
                            </span>
                          )}
                        </div>
                        <p
                          style={{
                            margin: "3px 0 0",
                            fontSize: 12.5,
                            color: "oklch(0.63 0.006 250)",
                          }}
                        >
                          {plan.subtitle}
                        </p>
                        <p
                          style={{
                            margin: "6px 0 0",
                            fontSize: 12,
                            color: "oklch(0.5 0.006 250)",
                            lineHeight: 1.5,
                          }}
                        >
                          {plan.description}
                        </p>
                      </div>
                      {!plan.available && (
                        <span
                          style={{
                            flexShrink: 0,
                            borderRadius: 5,
                            border: "1px solid oklch(0.27 0.005 250)",
                            padding: "2px 8px",
                            fontSize: 10,
                            fontWeight: 600,
                            color: "oklch(0.45 0.006 250)",
                            whiteSpace: "nowrap" as const,
                          }}
                        >
                          Coming soon
                        </span>
                      )}
                      {plan.available && isSelected && (
                        <span
                          style={{
                            flexShrink: 0,
                            width: 20,
                            height: 20,
                            borderRadius: 999,
                            background: "oklch(0.92 0.25 110)",
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                          }}
                        >
                          <svg
                            width="12"
                            height="12"
                            viewBox="0 0 24 24"
                            fill="none"
                            stroke="oklch(0.07 0.01 110)"
                            strokeWidth="3"
                            strokeLinecap="round"
                          >
                            <polyline points="20 6 9 17 4 12" />
                          </svg>
                        </span>
                      )}
                    </div>
                  </button>
                );
              })}

              {/* Build my own option */}
              <button
                onClick={() => finish(false, true)}
                disabled={saving}
                style={{
                  textAlign: "left" as const,
                  padding: "14px 16px",
                  borderRadius: 12,
                  border: "1px dashed oklch(0.27 0.005 250)",
                  background: "transparent",
                  color: "oklch(0.63 0.006 250)",
                  fontSize: 14,
                  cursor: saving ? "wait" : "pointer",
                  opacity: saving ? 0.7 : 1,
                }}
              >
                <p style={{ margin: 0, fontWeight: 500, color: "oklch(0.8 0.006 250)" }}>
                  I'll manage my own plan
                </p>
                <p style={{ margin: "4px 0 0", fontSize: 12.5 }}>
                  Skip plan assignment — go straight to the dashboard and choose workouts manually.
                </p>
              </button>
            </div>
          </>
        )}

        {/* ── Navigation ───────────────────────────────────── */}
        <div style={{ marginTop: 36, display: "flex", gap: 8 }}>
          {step > 0 && (
            <button
              onClick={() => setStep((s) => s - 1)}
              disabled={saving}
              style={{
                flexShrink: 0,
                height: 44,
                padding: "0 18px",
                borderRadius: 8,
                border: "1px solid oklch(0.27 0.005 250)",
                background: "transparent",
                color: "inherit",
                fontSize: 14,
                cursor: saving ? "wait" : "pointer",
              }}
            >
              Back
            </button>
          )}

          {/* On plan step, the primary action is "Enroll & start" */}
          {step === TOTAL_STEPS - 1 ? (
            <button
              onClick={() => finish(false)}
              disabled={saving}
              style={{
                flex: 1,
                height: 44,
                borderRadius: 8,
                border: "none",
                background: "oklch(0.92 0.25 110)",
                color: "oklch(0.07 0.01 110)",
                fontSize: 14,
                fontWeight: 600,
                cursor: saving ? "wait" : "pointer",
                opacity: saving ? 0.7 : 1,
              }}
            >
              {saving ? "Saving..." : "Enroll & get started →"}
            </button>
          ) : (
            <button
              onClick={() => setStep((s) => s + 1)}
              style={{
                flex: 1,
                height: 44,
                borderRadius: 8,
                border: "none",
                background: "oklch(0.92 0.25 110)",
                color: "oklch(0.07 0.01 110)",
                fontSize: 14,
                fontWeight: 600,
                cursor: "pointer",
              }}
            >
              Continue
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
