export const GOALS = {
  cut: { label: "Fat loss", factor: 0.8 },
  recomp: { label: "Slow cut / recomp", factor: 0.9 },
  maintain: { label: "Maintain", factor: 1 },
  bulk: { label: "Lean gain", factor: 1.1 },
} as const;

export type GoalKey = keyof typeof GOALS;

/** Activity multipliers used by the calorie calculator (stored as profiles.activity_level). */
export const ACTIVITY_OPTIONS = [
  { value: "1.2", label: "Sedentary", hint: "Little exercise" },
  { value: "1.375", label: "Light", hint: "1–3 sessions a week" },
  { value: "1.55", label: "Moderate", hint: "3–5 sessions a week" },
  { value: "1.725", label: "High", hint: "6–7 sessions a week" },
  { value: "1.9", label: "Very high", hint: "Physical job plus training" },
];
