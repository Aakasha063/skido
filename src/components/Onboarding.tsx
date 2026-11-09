import { useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";
import { supabase } from "@/integrations/supabase/client";
import type { Tables } from "@/integrations/supabase/types";
import { useAuth } from "@/lib/auth";
import { saveProfile, fetchWorkoutTemplateBySlug } from "@/lib/api";
import { navyBodyFat } from "@/lib/bodyFat";
import { calculateCalorieTarget } from "@/lib/calories";
import { ACTIVITY_OPTIONS, GOALS, type GoalKey } from "@/lib/goals";
import { todayISO } from "@/lib/format";
import { Choice, ChoiceGroup, Field } from "@/components/sk/ui";

const GOAL_HINTS: Record<GoalKey, string> = {
  cut: "About 20% below maintenance",
  recomp: "About 10% below maintenance",
  maintain: "Eat at maintenance",
  bulk: "About 10% above maintenance",
};

/** Available training plans — add more here as they launch. */
const PLANS = [
  {
    id: "v-taper",
    name: "V-Taper + Fat-Loss",
    subtitle: "5 mandatory days, Saturday optional",
    description:
      "Upper-lower split with lat-focus pulls, OHP, and daily cardio finishers. Ideal for 4–7 gym days.",
    available: true,
  },
  {
    id: "toned-physique",
    name: "Toned Physique Plan",
    subtitle: "5 days, lower-body emphasis",
    description:
      "Glute/quad/hamstring-focused lower days plus balanced upper-body accessory work. Hypertrophy and general fitness, beginner to intermediate.",
    available: true,
  },
  {
    id: "hybrid-physique",
    name: "Hybrid Physique 2.1",
    subtitle: "12 weeks · 5 days, Saturday optional",
    description:
      "Upper/lower split for hypertrophy and strength maintenance, plus incline walks, easy cycling and weekly bike HIIT for fat loss and conditioning.",
    available: true,
  },
  {
    id: "ppl",
    name: "Push / Pull / Legs",
    subtitle: "6 days, rest on Sunday",
    description:
      "Classic PPL split — high volume for intermediate lifters who can train 6 days a week.",
    available: false,
  },
  {
    id: "3day-fullbody",
    name: "3-Day Full-Body",
    subtitle: "3 sessions per week",
    description: "Compound-focused full-body sessions Mon / Wed / Fri. Great for busy schedules.",
    available: false,
  },
  {
    id: "2day-minimalist",
    name: "2-Day Minimalist",
    subtitle: "2 sessions per week",
    description: "Stripped-back strength for the time-constrained. Two full-body sessions.",
    available: false,
  },
] as const;

type PlanId = (typeof PLANS)[number]["id"];

/** Curated plans that persist a real workout_templates row on enrollment (matched by slug). */
const PLAN_TEMPLATE_SLUGS: Partial<Record<PlanId, string>> = {
  "v-taper": "v-taper-fat-loss",
  "toned-physique": "toned-physique-plan",
  "hybrid-physique": "hybrid-physique-2-1",
};

function recommendedPlan(gymDays: number, sex: "male" | "female"): PlanId {
  if (sex === "female") return "toned-physique";
  if (gymDays >= 6) return "ppl";
  if (gymDays >= 4) return "v-taper";
  if (gymDays >= 3) return "3day-fullbody";
  return "2day-minimalist";
}

const STEPS = [
  [
    "A little about you",
    "Used for accurate calorie and body-fat estimates. You can change this any time.",
  ],
  ["Height and weight", "This sets your starting point on the Body screen."],
  ["Age and activity", "Used to estimate how much energy you burn each day."],
  ["What's your goal?", "Sets the direction of your calorie target."],
  ["Your training week", "How often you can train shapes which plan we recommend."],
  ["Body-fat measurements", "Optional. Adds a starting estimate using the US Navy method."],
  [
    "Choose your training plan",
    "Based on your profile we've highlighted the best fit. You can switch plans at any time from the Plan page.",
  ],
] as const;

export function Onboarding() {
  const { user } = useAuth();
  const qc = useQueryClient();
  const [step, setStep] = useState(0);

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
  const [selectedPlan, setSelectedPlan] = useState<PlanId | null>(null);
  const [saving, setSaving] = useState(false);

  const recommended = recommendedPlan(gymDays, sex);
  const effectivePlanId = selectedPlan ?? recommended;
  const bfPreview = navyBodyFat({
    sex,
    height: Number(height),
    neck: Number(neck),
    waist: Number(waist),
    hip: Number(hip),
  });

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
        if (age) patch.date_of_birth = `${new Date().getFullYear() - Number(age)}-01-01`;
        if (activity) patch.activity_level = Number(activity);
        if (goal) patch.primary_goal = goal;
        patch.gym_days_per_week = gymDays;
        if (injuries.trim()) patch.past_injuries = injuries.trim();

        if (!customPlan) {
          const templateSlug = PLAN_TEMPLATE_SLUGS[effectivePlanId];
          if (templateSlug) {
            const template = await fetchWorkoutTemplateBySlug(templateSlug);
            if (template) patch.active_template_id = template.id;
          }
        }
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

  const last = step === STEPS.length - 1;
  const [title, text] = STEPS[step]!;

  return (
    <div
      style={{
        position: "relative",
        minHeight: "100dvh",
        display: "flex",
        flexDirection: "column",
        maxWidth: 400,
        margin: "0 auto",
        padding:
          "calc(24px + env(safe-area-inset-top)) 24px calc(32px + env(safe-area-inset-bottom))",
      }}
    >
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
          marginBottom: 18,
        }}
      >
        <span className="sk-cap sk-num" style={{ letterSpacing: 0 }}>
          Step {step + 1} of {STEPS.length}
        </span>
        <button
          type="button"
          className="sk-link-btn"
          onClick={() => finish(true)}
          disabled={saving}
          style={{ color: "rgba(255,255,255,0.62)", padding: "6px 0" }}
        >
          Skip for now
        </button>
      </div>
      <div style={{ display: "flex", gap: 4, marginBottom: 44 }} aria-hidden="true">
        {STEPS.map((_, i) => (
          <span
            key={i}
            style={{
              flex: 1,
              height: 3,
              borderRadius: 999,
              background: i <= step ? "#FFFFFF" : "rgba(255,255,255,0.1)",
              transition: "background .4s",
            }}
          />
        ))}
      </div>

      <div key={step} className={step % 2 ? "sk-fade" : "sk-fade2"} style={{ flex: 1 }}>
        <h1
          style={{
            margin: 0,
            fontSize: 26,
            lineHeight: 1.2,
            fontWeight: 600,
            letterSpacing: "-0.03em",
          }}
        >
          {title}
        </h1>
        <p
          style={{
            margin: "8px 0 32px",
            fontSize: 14.5,
            lineHeight: 1.55,
            color: "rgba(255,255,255,0.62)",
          }}
        >
          {text}
        </p>

        {step === 0 && (
          <ChoiceGroup label="Sex">
            <Choice label="Male" checked={sex === "male"} onClick={() => setSex("male")} />
            <Choice label="Female" checked={sex === "female"} onClick={() => setSex("female")} />
          </ChoiceGroup>
        )}

        {step === 1 && (
          <div style={{ display: "flex", gap: 12 }}>
            <Field
              label="Height (cm)"
              inputMode="numeric"
              placeholder="178"
              value={height}
              onChange={(e) => setHeight(e.target.value)}
              style={{ flex: 1 }}
            />
            <Field
              label="Weight (kg)"
              inputMode="decimal"
              placeholder="82"
              value={weight}
              onChange={(e) => setWeight(e.target.value)}
              style={{ flex: 1 }}
            />
          </div>
        )}

        {step === 2 && (
          <>
            <Field
              label="Age"
              inputMode="numeric"
              placeholder="28"
              value={age}
              onChange={(e) => setAge(e.target.value)}
              style={{ maxWidth: 160, marginBottom: 18 }}
            />
            <p className="sk-cap" style={{ margin: "0 0 8px" }}>
              Activity level
            </p>
            <ChoiceGroup label="Activity level">
              {ACTIVITY_OPTIONS.map((a) => (
                <Choice
                  key={a.value}
                  label={a.label}
                  hint={a.hint}
                  checked={activity === a.value}
                  onClick={() => setActivity(a.value)}
                />
              ))}
            </ChoiceGroup>
          </>
        )}

        {step === 3 && (
          <ChoiceGroup label="Goal">
            {(Object.keys(GOALS) as GoalKey[]).map((k) => (
              <Choice
                key={k}
                label={GOALS[k].label}
                hint={GOAL_HINTS[k]}
                checked={goal === k}
                onClick={() => setGoal(k)}
              />
            ))}
          </ChoiceGroup>
        )}

        {step === 4 && (
          <>
            <p className="sk-cap" style={{ margin: "0 0 8px" }}>
              How many days a week can you train?
            </p>
            <div className="sk-seg" role="radiogroup" aria-label="Training days per week">
              {[1, 2, 3, 4, 5, 6, 7].map((d) => (
                <button
                  key={d}
                  type="button"
                  role="radio"
                  aria-checked={gymDays === d}
                  className="sk-seg-btn"
                  onClick={() => setGymDays(d)}
                  style={{ padding: 0 }}
                >
                  {d}
                </button>
              ))}
            </div>
            <p style={{ margin: "10px 0 24px", fontSize: 12.5, color: "rgba(255,255,255,0.56)" }}>
              {gymDays === 1
                ? "1 day — Minimalist training"
                : gymDays <= 3
                  ? `${gymDays} days — Full-body or Upper/Lower split`
                  : gymDays <= 5
                    ? `${gymDays} days — Split training recommended`
                    : `${gymDays} days — High-frequency training`}
            </p>
            <div className="sk-label">
              <label htmlFor="onb-injuries" className="sk-cap">
                Any past injuries we should know about? (optional)
              </label>
              <textarea
                id="onb-injuries"
                className="sk-field"
                rows={3}
                value={injuries}
                onChange={(e) => setInjuries(e.target.value)}
                placeholder="e.g. Lower back pain, bad left knee, rotator cuff issue..."
              />
            </div>
            <p
              style={{
                margin: "10px 0 0",
                fontSize: 12,
                lineHeight: 1.5,
                color: "rgba(255,255,255,0.5)",
              }}
            >
              This helps you remember to be careful — we don't auto-remove exercises based on
              injuries.
            </p>
          </>
        )}

        {step === 5 && (
          <>
            <div style={{ display: "flex", gap: 10, flexWrap: "wrap" }}>
              <Field
                label="Waist (cm)"
                inputMode="decimal"
                placeholder="86"
                value={waist}
                onChange={(e) => setWaist(e.target.value)}
                style={{ flex: 1, minWidth: 96 }}
              />
              <Field
                label="Neck (cm)"
                inputMode="decimal"
                placeholder="38"
                value={neck}
                onChange={(e) => setNeck(e.target.value)}
                style={{ flex: 1, minWidth: 96 }}
              />
              {sex === "female" && (
                <Field
                  label="Hip (cm)"
                  inputMode="decimal"
                  placeholder="98"
                  value={hip}
                  onChange={(e) => setHip(e.target.value)}
                  style={{ flex: 1, minWidth: 96 }}
                />
              )}
            </div>
            <p style={{ margin: "16px 0 0", fontSize: 13, color: "rgba(255,255,255,0.62)" }}>
              {bfPreview != null
                ? `Estimated body fat: ${bfPreview}%`
                : height
                  ? "Enter your waist and neck to see an estimate."
                  : "Add your height (step 2) plus waist and neck to see an estimate."}
            </p>
          </>
        )}

        {step === 6 && (
          <div
            role="radiogroup"
            aria-label="Training plan"
            style={{ display: "flex", flexDirection: "column", gap: 8 }}
          >
            {PLANS.map((plan) => {
              const isRecommended = plan.id === recommended && plan.available;
              const on = plan.available && effectivePlanId === plan.id;
              return (
                <button
                  key={plan.id}
                  type="button"
                  role="radio"
                  aria-checked={on}
                  aria-disabled={!plan.available}
                  disabled={!plan.available}
                  className="sk-choice"
                  onClick={() => plan.available && setSelectedPlan(plan.id)}
                  style={{
                    alignItems: "flex-start",
                    opacity: plan.available ? 1 : 0.5,
                    cursor: plan.available ? "pointer" : "default",
                  }}
                >
                  <span style={{ minWidth: 0 }}>
                    <span
                      style={{ display: "flex", alignItems: "center", gap: 8, flexWrap: "wrap" }}
                    >
                      {plan.name}
                      {isRecommended && <span className="sk-pill is-accent">Best fit</span>}
                      {!plan.available && <span className="sk-pill">Coming soon</span>}
                    </span>
                    <small>{plan.subtitle}</small>
                    <small style={{ marginTop: 6, lineHeight: 1.45 }}>{plan.description}</small>
                  </span>
                  <span className="sk-dot" style={{ marginTop: 2 }} />
                </button>
              );
            })}
          </div>
        )}
      </div>

      <div style={{ display: "flex", gap: 8, marginTop: 32 }}>
        {step > 0 && (
          <button
            type="button"
            className="sk-btn sk-btn-quiet"
            onClick={() => setStep((s) => Math.max(0, s - 1))}
            disabled={saving}
            style={{ width: "auto", padding: "0 22px" }}
          >
            Back
          </button>
        )}
        {last ? (
          <button
            type="button"
            className="sk-btn sk-btn-accent"
            onClick={() => finish(false)}
            disabled={saving}
          >
            {saving ? "Saving…" : "Enroll & get started"}
          </button>
        ) : (
          <button
            type="button"
            className="sk-btn sk-btn-light"
            onClick={() => setStep((s) => s + 1)}
          >
            Continue
          </button>
        )}
      </div>
      {last && (
        <button
          type="button"
          className="sk-link-btn"
          onClick={() => finish(false, true)}
          disabled={saving}
          style={{ margin: "16px auto 0" }}
        >
          I'll manage my own plan
        </button>
      )}
    </div>
  );
}
