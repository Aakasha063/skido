import { createFileRoute, Link, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { toast } from "sonner";
import { AppShell } from "@/components/AppShell";
import { useAuth } from "@/lib/auth";
import { supabase } from "@/integrations/supabase/client";
import { createCustomPlan, fetchDays, type CustomDayInput } from "@/lib/api";
import { BodyMap } from "@/components/BodyMap";
import { BODY_MAP_TO_SEARCH_TERMS, MuscleSlug } from "@/lib/muscles";

export const Route = createFileRoute("/builder")({
  head: () => ({ meta: [{ title: "Custom Plan Builder — Skido" }] }),
  component: () => (
    <AppShell>
      <BuilderPage />
    </AppShell>
  ),
});

const DAY_LABELS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
const DAY_SHORT = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
const DOW_MAP = [1, 2, 3, 4, 5, 6, 0];

type ExerciseState = {
  exerciseId: string;
  name: string;
  category: string;
  sets: number;
  repRange: string;
  restSeconds: number;
};

type DayState = {
  dayOfWeek: number;
  name: string;
  isOptional: boolean;
  exercises: ExerciseState[];
};

const MUSCLE_FILTER_CHIPS = [
  "All",
  "Lower Back",
  "Upper Back",
  "Chest",
  "Shoulders",
  "Arms",
  "Legs",
  "Core",
  "Cardio",
];

function BuilderPage() {
  const { user } = useAuth();
  const navigate = useNavigate();

  const [daysState, setDaysState] = useState<DayState[]>(
    DOW_MAP.map((dow) => ({
      dayOfWeek: dow,
      name: "",
      isOptional: false,
      exercises: [],
    }))
  );

  const [activeDayIdx, setActiveDayIdx] = useState(0);
  const [mobileTab, setMobileTab] = useState<"day" | "library">("day");
  const [search, setSearch] = useState("");
  const [selectedMuscle, setSelectedMuscle] = useState<string>("All");
  const [selectedBodySlug, setSelectedBodySlug] = useState<MuscleSlug | null>(null);
  const [showBodyMap, setShowBodyMap] = useState(false);
  const [isSaving, setIsSaving] = useState(false);

  const { data: results, isLoading: loadingSearch } = useQuery({
    queryKey: ["exercise-search", search, selectedMuscle],
    queryFn: async () => {
      let q = supabase
        .from("exercises")
        .select("id, name, category, primary_muscle, equipment, default_rep_range, default_rest_seconds, gif_url")
        .eq("status", "active")
        .order("name")
        .limit(80);

      if (selectedMuscle !== "All") {
        if (selectedMuscle === "Lower Back") {
          q = q.or("primary_muscle.ilike.%lower back%,name.ilike.%deadlift%,name.ilike.%hyperextension%,name.ilike.%good morning%,name.ilike.%back extension%");
        } else if (selectedMuscle === "Upper Back") {
          q = q.or("primary_muscle.ilike.%upper back%,primary_muscle.ilike.%lats%,primary_muscle.ilike.%traps%,primary_muscle.ilike.%mid back%");
        } else if (selectedMuscle === "Chest") {
          q = q.or("primary_muscle.ilike.%chest%,primary_muscle.ilike.%upper chest%");
        } else if (selectedMuscle === "Shoulders") {
          q = q.or("primary_muscle.ilike.%delt%");
        } else if (selectedMuscle === "Arms") {
          q = q.or("primary_muscle.ilike.%biceps%,primary_muscle.ilike.%triceps%,primary_muscle.ilike.%forearms%");
        } else if (selectedMuscle === "Legs") {
          q = q.or("primary_muscle.ilike.%quads%,primary_muscle.ilike.%hamstrings%,primary_muscle.ilike.%glutes%,primary_muscle.ilike.%calves%");
        } else if (selectedMuscle === "Core") {
          q = q.or("primary_muscle.ilike.%abs%,category.eq.core");
        } else if (selectedMuscle === "Cardio") {
          q = q.or("primary_muscle.ilike.%cardio%,category.eq.cardio");
        }
      }

      if (search) {
        q = q.or(`name.ilike.%${search}%,primary_muscle.ilike.%${search}%,equipment.ilike.%${search}%,category.ilike.%${search}%`);
      }
      const { data, error } = await q;
      if (error) throw error;
      return data;
    },
  });

  const { data: currentDays, refetch } = useQuery({
    queryKey: ["days", user?.id],
    queryFn: () => fetchDays(user?.id),
    enabled: !!user,
  });
  const existingCustom = currentDays?.find((d) => d.is_custom);

  async function handleSave() {
    if (!user) return;

    const payload: CustomDayInput[] = daysState.map((d) => ({
      dayOfWeek: d.dayOfWeek,
      name: d.name,
      isOptional: d.isOptional,
      exercises: d.exercises.map((ex) => ({
        exerciseId: ex.exerciseId,
        sets: ex.sets,
        repRange: ex.repRange,
        restSeconds: ex.restSeconds,
      })),
    }));

    const activePayload = payload.filter((d) => d.exercises.length > 0 || d.name.trim() !== "");

    if (activePayload.length === 0) {
      toast.error("Please add at least one exercise or name a day to create your plan.");
      return;
    }

    setIsSaving(true);
    try {
      await createCustomPlan(user.id, activePayload);
      toast.success("Custom plan saved!");
      await refetch();
      navigate({ to: "/plan" });
    } catch (e: any) {
      toast.error(e.message);
    } finally {
      setIsSaving(false);
    }
  }

  function updateActiveDay(updater: (day: DayState) => DayState) {
    setDaysState((prev) => {
      const copy = [...prev];
      const target = copy[activeDayIdx];
      if (!target) return prev;
      copy[activeDayIdx] = updater(target);
      return copy;
    });
  }

  function toggleAddExercise(ex: any) {
    updateActiveDay((day) => {
      const exists = day.exercises.find((e) => e.exerciseId === ex.id);
      if (exists) {
        toast.info(`Removed ${ex.name || "exercise"}`);
        return { ...day, exercises: day.exercises.filter((e) => e.exerciseId !== ex.id) };
      }
      toast.success(`Added ${ex.name || "exercise"} to ${DAY_SHORT[activeDayIdx]}`);
      return {
        ...day,
        exercises: [
          ...day.exercises,
          {
            exerciseId: ex.id,
            name: ex.name,
            category: ex.category || "strength",
            sets: 3,
            repRange: ex.default_rep_range || (ex.category === "cardio" ? "15" : "8-12"),
            restSeconds: ex.default_rest_seconds || 120,
          },
        ],
      };
    });
  }

  function updateExercise(index: number, updates: Partial<ExerciseState>) {
    updateActiveDay((day) => {
      const exCopy = [...day.exercises];
      const target = exCopy[index];
      if (!target) return day;
      exCopy[index] = { ...target, ...updates };
      return { ...day, exercises: exCopy };
    });
  }

  function moveExercise(index: number, direction: "up" | "down") {
    updateActiveDay((day) => {
      const copy = [...day.exercises];
      const itemA = copy[index];
      if (!itemA) return day;
      if (direction === "up" && index > 0) {
        const itemB = copy[index - 1];
        if (itemB) {
          copy[index - 1] = itemA;
          copy[index] = itemB;
        }
      } else if (direction === "down" && index < copy.length - 1) {
        const itemB = copy[index + 1];
        if (itemB) {
          copy[index + 1] = itemA;
          copy[index] = itemB;
        }
      }
      return { ...day, exercises: copy };
    });
  }

  const activeDay = daysState[activeDayIdx] || daysState[0]!;

  return (
    <div style={{ maxWidth: 1100, margin: "0 auto", padding: "16px 12px 60px" }}>
      {/* Top Header */}
      <div style={{ marginBottom: 16 }}>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", gap: 12 }}>
          <Link
            to="/plan"
            style={{
              color: "oklch(0.65 0.02 250)",
              textDecoration: "none",
              fontSize: 13,
              display: "inline-flex",
              alignItems: "center",
              gap: 4,
            }}
          >
            ← Back to Plan
          </Link>
          <button
            onClick={handleSave}
            disabled={isSaving}
            style={{
              background: "oklch(0.92 0.25 110)",
              color: "oklch(0.07 0.01 110)",
              border: "none",
              borderRadius: 8,
              padding: "8px 16px",
              fontSize: 13,
              fontWeight: 700,
              cursor: isSaving ? "wait" : "pointer",
              opacity: isSaving ? 0.7 : 1,
              transition: "all 0.2s",
              boxShadow: "0 2px 10px rgba(252, 238, 10, 0.25)",
            }}
          >
            {isSaving ? "Saving..." : "Save Plan"}
          </button>
        </div>

        <h1 style={{ fontSize: 24, fontWeight: 800, letterSpacing: "-0.03em", margin: "10px 0 2px" }}>
          Custom Plan Builder
        </h1>
        {existingCustom && (
          <div style={{ fontSize: 12, color: "oklch(0.7 0.15 40)", fontWeight: 500 }}>
            Saving will overwrite your current custom schedule.
          </div>
        )}
      </div>

      {/* Horizontal Day Selector (Mobile Swipeable / Thumb-Friendly) */}
      <div
        style={{
          display: "flex",
          gap: 8,
          overflowX: "auto",
          paddingBottom: 8,
          marginBottom: 16,
          WebkitOverflowScrolling: "touch",
          scrollbarWidth: "none",
        }}
      >
        {daysState.map((day, idx) => {
          const isActive = idx === activeDayIdx;
          const count = day.exercises.length;
          return (
            <button
              key={day.dayOfWeek}
              onClick={() => setActiveDayIdx(idx)}
              style={{
                flexShrink: 0,
                minWidth: 72,
                padding: "8px 10px",
                borderRadius: 10,
                border: isActive ? "1.5px solid oklch(0.92 0.25 110)" : "1px solid oklch(0.22 0.005 250)",
                background: isActive ? "oklch(0.18 0.01 250)" : "oklch(0.11 0.005 250)",
                cursor: "pointer",
                textAlign: "center",
                color: isActive ? "white" : "oklch(0.65 0.01 250)",
                transition: "all 0.15s",
              }}
            >
              <div style={{ fontSize: 13, fontWeight: 700 }}>{DAY_SHORT[idx]}</div>
              <div
                style={{
                  fontSize: 10.5,
                  marginTop: 2,
                  color: count > 0 ? "oklch(0.92 0.25 110)" : "oklch(0.45 0.01 250)",
                  fontWeight: count > 0 ? 600 : 400,
                }}
              >
                {count > 0 ? `${count} ex` : "Rest"}
              </div>
            </button>
          );
        })}
      </div>

      {/* Mobile Segmented Switcher (Workout vs Add Exercises) */}
      <div
        style={{
          display: "flex",
          gap: 6,
          background: "oklch(0.09 0.004 250)",
          border: "1px solid oklch(0.2 0.005 250)",
          borderRadius: 10,
          padding: 3,
          marginBottom: 16,
        }}
      >
        <button
          onClick={() => setMobileTab("day")}
          style={{
            flex: 1,
            padding: "8px 12px",
            borderRadius: 8,
            border: "none",
            background: mobileTab === "day" ? "oklch(0.2 0.008 250)" : "transparent",
            color: mobileTab === "day" ? "white" : "oklch(0.6 0.01 250)",
            fontSize: 13,
            fontWeight: 700,
            cursor: "pointer",
          }}
        >
          {DAY_LABELS[activeDayIdx]} Workout ({activeDay.exercises.length})
        </button>
        <button
          onClick={() => setMobileTab("library")}
          style={{
            flex: 1,
            padding: "8px 12px",
            borderRadius: 8,
            border: "none",
            background: mobileTab === "library" ? "oklch(0.92 0.25 110)" : "transparent",
            color: mobileTab === "library" ? "oklch(0.07 0.01 110)" : "oklch(0.7 0.01 250)",
            fontSize: 13,
            fontWeight: 700,
            cursor: "pointer",
          }}
        >
          + Add Exercises
        </button>
      </div>

      {/* Main Content Area: Responsive Grid / Flex */}
      <div
        style={{
          display: "grid",
          gridTemplateColumns: "1fr",
          gap: 16,
        }}
      >
        {/* VIEW 1: Active Day Workout Configuration */}
        {(mobileTab === "day" || typeof window !== "undefined" && window.innerWidth >= 900) && (
          <div
            style={{
              background: "oklch(0.12 0.005 250)",
              border: "1px solid oklch(0.24 0.005 250)",
              borderRadius: 14,
              padding: "16px 14px",
            }}
          >
            {/* Day Title Input */}
            <div style={{ marginBottom: 14 }}>
              <label style={{ display: "block", fontSize: 12, fontWeight: 600, color: "oklch(0.65 0.01 250)", marginBottom: 6 }}>
                Workout Name (e.g. Chest & Triceps)
              </label>
              <input
                type="text"
                placeholder="Leave blank for Rest Day"
                value={activeDay.name}
                onChange={(e) => updateActiveDay((d) => ({ ...d, name: e.target.value }))}
                style={{
                  width: "100%",
                  background: "oklch(0.08 0.004 250)",
                  border: "1px solid oklch(0.22 0.005 250)",
                  color: "white",
                  padding: "9px 12px",
                  borderRadius: 8,
                  fontSize: 14,
                  outline: "none",
                }}
              />
            </div>

            {/* Optional Checkbox */}
            <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 18 }}>
              <input
                type="checkbox"
                id="isOptional"
                checked={activeDay.isOptional}
                onChange={(e) => updateActiveDay((d) => ({ ...d, isOptional: e.target.checked }))}
                style={{ width: 16, height: 16, accentColor: "oklch(0.92 0.25 110)", cursor: "pointer" }}
              />
              <label htmlFor="isOptional" style={{ fontSize: 12.5, color: "oklch(0.75 0.01 250)", cursor: "pointer" }}>
                Optional workout (no penalty if skipped)
              </label>
            </div>

            {/* Exercise List */}
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 12 }}>
              <h3 style={{ margin: 0, fontSize: 14, fontWeight: 700, color: "white" }}>
                Selected Exercises ({activeDay.exercises.length})
              </h3>
              <button
                onClick={() => setMobileTab("library")}
                style={{
                  background: "transparent",
                  border: "none",
                  color: "oklch(0.92 0.25 110)",
                  fontSize: 12,
                  fontWeight: 700,
                  cursor: "pointer",
                }}
              >
                + Add more
              </button>
            </div>

            {activeDay.exercises.length === 0 ? (
              <div
                style={{
                  padding: "32px 16px",
                  textAlign: "center",
                  border: "1px dashed oklch(0.24 0.01 250)",
                  borderRadius: 12,
                  background: "oklch(0.09 0.004 250)",
                }}
              >
                <div style={{ fontSize: 24, marginBottom: 6 }}>💤</div>
                <div style={{ fontSize: 13.5, fontWeight: 600, color: "white" }}>Rest Day</div>
                <p style={{ fontSize: 12, color: "oklch(0.55 0.01 250)", margin: "4px 0 14px" }}>
                  No exercises added yet for {DAY_LABELS[activeDayIdx]}.
                </p>
                <button
                  onClick={() => setMobileTab("library")}
                  style={{
                    background: "oklch(0.92 0.25 110)",
                    color: "oklch(0.07 0.01 110)",
                    border: "none",
                    borderRadius: 8,
                    padding: "8px 16px",
                    fontSize: 12.5,
                    fontWeight: 700,
                    cursor: "pointer",
                  }}
                >
                  + Add Exercise
                </button>
              </div>
            ) : (
              <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                {activeDay.exercises.map((ex, idx) => (
                  <div
                    key={`${ex.exerciseId}-${idx}`}
                    style={{
                      background: "oklch(0.09 0.004 250)",
                      border: "1px solid oklch(0.22 0.005 250)",
                      borderRadius: 10,
                      padding: "12px 14px",
                    }}
                  >
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 10 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 8, minWidth: 0 }}>
                        <span
                          style={{
                            fontSize: 11,
                            fontWeight: 700,
                            color: "oklch(0.92 0.25 110)",
                            background: "oklch(0.18 0.01 250)",
                            width: 22,
                            height: 22,
                            borderRadius: 999,
                            display: "flex",
                            alignItems: "center",
                            justifyContent: "center",
                            flexShrink: 0,
                          }}
                        >
                          {idx + 1}
                        </span>
                        <h4
                          style={{
                            margin: 0,
                            fontSize: 13.5,
                            fontWeight: 700,
                            whiteSpace: "nowrap",
                            overflow: "hidden",
                            textOverflow: "ellipsis",
                          }}
                        >
                          {ex.name}
                        </h4>
                      </div>

                      {/* Reorder and Delete Actions */}
                      <div style={{ display: "flex", alignItems: "center", gap: 4, flexShrink: 0 }}>
                        <button
                          onClick={() => moveExercise(idx, "up")}
                          disabled={idx === 0}
                          style={{
                            background: "oklch(0.16 0.005 250)",
                            border: "none",
                            borderRadius: 4,
                            color: idx === 0 ? "oklch(0.3 0.01 250)" : "white",
                            width: 26,
                            height: 26,
                            fontSize: 12,
                            cursor: idx === 0 ? "default" : "pointer",
                          }}
                        >
                          ↑
                        </button>
                        <button
                          onClick={() => moveExercise(idx, "down")}
                          disabled={idx === activeDay.exercises.length - 1}
                          style={{
                            background: "oklch(0.16 0.005 250)",
                            border: "none",
                            borderRadius: 4,
                            color: idx === activeDay.exercises.length - 1 ? "oklch(0.3 0.01 250)" : "white",
                            width: 26,
                            height: 26,
                            fontSize: 12,
                            cursor: idx === activeDay.exercises.length - 1 ? "default" : "pointer",
                          }}
                        >
                          ↓
                        </button>
                        <button
                          onClick={() => toggleAddExercise({ id: ex.exerciseId, name: ex.name })}
                          style={{
                            background: "oklch(0.2 0.05 30)",
                            border: "none",
                            borderRadius: 4,
                            color: "oklch(0.7 0.15 40)",
                            width: 26,
                            height: 26,
                            fontSize: 12,
                            fontWeight: 700,
                            cursor: "pointer",
                            marginLeft: 4,
                          }}
                        >
                          ✕
                        </button>
                      </div>
                    </div>

                    {/* Responsive Exercise Inputs (Sets, Reps, Rest) */}
                    <div style={{ display: "grid", gridTemplateColumns: "1fr 1.5fr 1fr", gap: 8 }}>
                      {ex.category === "cardio" ? (
                        <div style={{ gridColumn: "1 / -1" }}>
                          <label style={{ display: "block", fontSize: 10.5, color: "oklch(0.55 0.01 250)", marginBottom: 3 }}>
                            Duration (mins)
                          </label>
                          <input
                            type="text"
                            placeholder="e.g. 15"
                            value={ex.repRange}
                            onChange={(e) => updateExercise(idx, { repRange: e.target.value })}
                            style={{
                              width: "100%",
                              background: "oklch(0.14 0.005 250)",
                              border: "1px solid oklch(0.24 0.005 250)",
                              color: "white",
                              padding: "6px 8px",
                              borderRadius: 6,
                              fontSize: 13,
                            }}
                          />
                        </div>
                      ) : (
                        <>
                          <div>
                            <label style={{ display: "block", fontSize: 10.5, color: "oklch(0.55 0.01 250)", marginBottom: 3 }}>
                              Sets
                            </label>
                            <input
                              type="number"
                              min="1"
                              value={ex.sets}
                              onChange={(e) => updateExercise(idx, { sets: Number(e.target.value) })}
                              style={{
                                width: "100%",
                                background: "oklch(0.14 0.005 250)",
                                border: "1px solid oklch(0.24 0.005 250)",
                                color: "white",
                                padding: "6px 8px",
                                borderRadius: 6,
                                fontSize: 13,
                              }}
                            />
                          </div>
                          <div>
                            <label style={{ display: "block", fontSize: 10.5, color: "oklch(0.55 0.01 250)", marginBottom: 3 }}>
                              Reps
                            </label>
                            <input
                              type="text"
                              placeholder="e.g. 8-12"
                              value={ex.repRange}
                              onChange={(e) => updateExercise(idx, { repRange: e.target.value })}
                              style={{
                                width: "100%",
                                background: "oklch(0.14 0.005 250)",
                                border: "1px solid oklch(0.24 0.005 250)",
                                color: "white",
                                padding: "6px 8px",
                                borderRadius: 6,
                                fontSize: 13,
                              }}
                            />
                          </div>
                          <div>
                            <label style={{ display: "block", fontSize: 10.5, color: "oklch(0.55 0.01 250)", marginBottom: 3 }}>
                              Rest (s)
                            </label>
                            <input
                              type="number"
                              min="0"
                              step="15"
                              value={ex.restSeconds}
                              onChange={(e) => updateExercise(idx, { restSeconds: Number(e.target.value) })}
                              style={{
                                width: "100%",
                                background: "oklch(0.14 0.005 250)",
                                border: "1px solid oklch(0.24 0.005 250)",
                                color: "white",
                                padding: "6px 8px",
                                borderRadius: 6,
                                fontSize: 13,
                              }}
                            />
                          </div>
                        </>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}

        {/* VIEW 2: Exercise Library & Body Map */}
        {(mobileTab === "library" || typeof window !== "undefined" && window.innerWidth >= 900) && (
          <div
            style={{
              background: "oklch(0.12 0.005 250)",
              border: "1px solid oklch(0.24 0.005 250)",
              borderRadius: 14,
              padding: "16px 14px",
            }}
          >
            {/* Header & Body Map Toggle */}
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 12 }}>
              <div>
                <h3 style={{ margin: 0, fontSize: 14, fontWeight: 700, color: "white" }}>
                  Exercise Library
                </h3>
                <p style={{ margin: "2px 0 0", fontSize: 11, color: "oklch(0.55 0.01 250)" }}>
                  Adding to <strong>{DAY_SHORT[activeDayIdx]}</strong>
                </p>
              </div>
              <button
                onClick={() => setShowBodyMap((v) => !v)}
                style={{
                  fontSize: 11.5,
                  fontWeight: 600,
                  padding: "5px 10px",
                  borderRadius: 6,
                  border: "1px solid oklch(0.25 0.01 250)",
                  background: showBodyMap ? "oklch(0.92 0.25 110 / 15%)" : "oklch(0.16 0.005 250)",
                  color: showBodyMap ? "oklch(0.92 0.25 110)" : "oklch(0.75 0.01 250)",
                  cursor: "pointer",
                }}
              >
                {showBodyMap ? "Hide Body Model" : "🧍 Muscle Model"}
              </button>
            </div>

            {/* Interactive Anatomical Body Map */}
            {showBodyMap && (
              <div style={{ marginBottom: 14, overflowX: "auto", paddingBottom: 4 }}>
                <BodyMap
                  size="sm"
                  selectedMuscle={selectedBodySlug}
                  onSelectMuscle={(slug, name) => {
                    setSelectedBodySlug(slug);
                    const mapped = BODY_MAP_TO_SEARCH_TERMS[slug] || name;
                    setSelectedMuscle(mapped);
                  }}
                />
              </div>
            )}

            {/* Muscle Filter Chips (Horizontal Scrollable) */}
            <div
              style={{
                display: "flex",
                gap: 6,
                overflowX: "auto",
                paddingBottom: 8,
                marginBottom: 12,
                WebkitOverflowScrolling: "touch",
                scrollbarWidth: "none",
              }}
            >
              {MUSCLE_FILTER_CHIPS.map((m) => {
                const isCurrent = selectedMuscle === m;
                return (
                  <button
                    key={m}
                    onClick={() => {
                      setSelectedMuscle(m);
                      setSelectedBodySlug(null);
                    }}
                    style={{
                      flexShrink: 0,
                      padding: "4px 10px",
                      borderRadius: 999,
                      border: "none",
                      background: isCurrent ? "oklch(0.92 0.25 110)" : "oklch(0.18 0.01 250)",
                      color: isCurrent ? "oklch(0.07 0.01 110)" : "oklch(0.75 0.01 250)",
                      fontSize: 11,
                      fontWeight: 700,
                      cursor: "pointer",
                      transition: "all 0.15s",
                    }}
                  >
                    {m}
                  </button>
                );
              })}
            </div>

            {/* Search Input */}
            <input
              type="text"
              placeholder={`Search ${selectedMuscle === "All" ? "1,300+ exercises..." : `${selectedMuscle.toLowerCase()} movements...`}`}
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              style={{
                width: "100%",
                background: "oklch(0.08 0.004 250)",
                border: "1px solid oklch(0.22 0.005 250)",
                color: "white",
                padding: "9px 12px",
                borderRadius: 8,
                fontSize: 13,
                marginBottom: 12,
                outline: "none",
              }}
            />

            {/* Exercise Results List */}
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                gap: 8,
                maxHeight: "55vh",
                overflowY: "auto",
                paddingRight: 2,
              }}
            >
              {loadingSearch ? (
                <div style={{ textAlign: "center", padding: "24px 0", color: "oklch(0.5 0.01 250)", fontSize: 13 }}>
                  Loading exercises...
                </div>
              ) : results?.length === 0 ? (
                <div style={{ textAlign: "center", padding: "24px 0", color: "oklch(0.5 0.01 250)", fontSize: 13 }}>
                  No exercises found.
                </div>
              ) : (
                results?.map((ex) => {
                  const isAdded = !!activeDay.exercises.find((e) => e.exerciseId === ex.id);
                  return (
                    <div
                      key={ex.id}
                      onClick={() => toggleAddExercise(ex)}
                      style={{
                        padding: "10px 12px",
                        background: isAdded ? "oklch(0.18 0.01 250)" : "oklch(0.09 0.004 250)",
                        border: isAdded ? "1px solid oklch(0.92 0.25 110 / 40%)" : "1px solid oklch(0.2 0.005 250)",
                        borderRadius: 8,
                        display: "flex",
                        justifyContent: "space-between",
                        alignItems: "center",
                        gap: 10,
                        cursor: "pointer",
                        transition: "all 0.15s",
                      }}
                    >
                      <div style={{ minWidth: 0, flex: 1 }}>
                        <div
                          style={{
                            fontSize: 13,
                            fontWeight: 600,
                            color: "white",
                            whiteSpace: "nowrap",
                            overflow: "hidden",
                            textOverflow: "ellipsis",
                          }}
                        >
                          {ex.name}
                        </div>
                        <div style={{ display: "flex", gap: 4, marginTop: 3, flexWrap: "wrap" }}>
                          {ex.primary_muscle && (
                            <span
                              style={{
                                fontSize: 10,
                                background: "oklch(0.22 0.005 250)",
                                color: "oklch(0.75 0.01 250)",
                                padding: "1px 5px",
                                borderRadius: 4,
                              }}
                            >
                              {ex.primary_muscle}
                            </span>
                          )}
                          {ex.equipment && (
                            <span
                              style={{
                                fontSize: 10,
                                background: "oklch(0.16 0.005 250)",
                                color: "oklch(0.6 0.01 250)",
                                padding: "1px 5px",
                                borderRadius: 4,
                              }}
                            >
                              {ex.equipment}
                            </span>
                          )}
                        </div>
                      </div>

                      <button
                        style={{
                          background: isAdded ? "oklch(0.2 0.05 30)" : "oklch(0.92 0.25 110)",
                          color: isAdded ? "oklch(0.7 0.15 40)" : "oklch(0.07 0.01 110)",
                          border: "none",
                          borderRadius: 6,
                          padding: "5px 10px",
                          fontSize: 11.5,
                          fontWeight: 700,
                          cursor: "pointer",
                          whiteSpace: "nowrap",
                          flexShrink: 0,
                        }}
                      >
                        {isAdded ? "Remove" : "+ Add"}
                      </button>
                    </div>
                  );
                })
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
