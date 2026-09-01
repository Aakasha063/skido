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
  const [mobileModalOpen, setMobileModalOpen] = useState(false);
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
        .select("id, name, category, primary_muscle, equipment, default_rep_range, default_rest_seconds")
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
    if (!user) {
      toast.error("Please sign in to save your custom workout plan");
      return;
    }

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
      toast.success("Custom plan saved successfully!");
      await refetch();
      navigate({ to: "/plan" });
    } catch (e: any) {
      toast.error(e.message || "Failed to save custom plan");
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

  // Render the Exercise Library UI component
  function renderExerciseLibrary(isModal = false) {
    return (
      <div
        style={{
          display: "flex",
          flexDirection: "column",
          gap: 10,
          width: "100%",
        }}
      >
        {/* Header */}
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", gap: 8 }}>
          <div>
            <h3 style={{ margin: 0, fontSize: 14, fontWeight: 700, color: "white" }}>
              Add to {DAY_LABELS[activeDayIdx]}
            </h3>
            <p style={{ margin: "2px 0 0", fontSize: 11.5, color: "oklch(0.6 0.01 250)" }}>
              {activeDay.exercises.length} exercise{activeDay.exercises.length === 1 ? "" : "s"} in workout
            </p>
          </div>

          <div style={{ display: "flex", gap: 6, alignItems: "center" }}>
            <button
              onClick={() => setShowBodyMap((v) => !v)}
              style={{
                fontSize: 11,
                fontWeight: 600,
                padding: "5px 9px",
                borderRadius: 6,
                border: "1px solid oklch(0.25 0.01 250)",
                background: showBodyMap ? "oklch(0.92 0.25 110 / 15%)" : "oklch(0.16 0.005 250)",
                color: showBodyMap ? "oklch(0.92 0.25 110)" : "oklch(0.75 0.01 250)",
                cursor: "pointer",
              }}
            >
              {showBodyMap ? "Hide Model" : "🧍 Muscle Model"}
            </button>

            {isModal && (
              <button
                onClick={() => setMobileModalOpen(false)}
                style={{
                  fontSize: 11.5,
                  fontWeight: 700,
                  padding: "5px 12px",
                  borderRadius: 6,
                  border: "none",
                  background: "oklch(0.92 0.25 110)",
                  color: "oklch(0.07 0.01 110)",
                  cursor: "pointer",
                }}
              >
                Done ✓
              </button>
            )}
          </div>
        </div>

        {/* Current Workout Quick Summary Pills inside modal so user always sees what's added */}
        {activeDay.exercises.length > 0 && (
          <div
            style={{
              display: "flex",
              gap: 4,
              overflowX: "auto",
              padding: "6px 8px",
              background: "oklch(0.09 0.004 250)",
              borderRadius: 8,
              border: "1px solid oklch(0.2 0.005 250)",
              scrollbarWidth: "none",
            }}
          >
            {activeDay.exercises.map((ex, i) => (
              <span
                key={`${ex.exerciseId}-${i}`}
                style={{
                  fontSize: 10.5,
                  fontWeight: 600,
                  color: "oklch(0.92 0.25 110)",
                  background: "oklch(0.18 0.01 250)",
                  padding: "2px 7px",
                  borderRadius: 4,
                  whiteSpace: "nowrap",
                  flexShrink: 0,
                }}
              >
                {i + 1}. {ex.name}
              </span>
            ))}
          </div>
        )}

        {/* Interactive Anatomical Body Map */}
        {showBodyMap && (
          <div style={{ marginBottom: 6, width: "100%" }}>
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

        {/* Muscle Filter Chips */}
        <div
          style={{
            display: "flex",
            gap: 5,
            overflowX: "auto",
            paddingBottom: 4,
            WebkitOverflowScrolling: "touch",
            scrollbarWidth: "none",
            width: "100%",
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
                  padding: "4px 9px",
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
            borderRadius: 7,
            fontSize: 13,
            outline: "none",
            boxSizing: "border-box",
          }}
        />

        {/* Exercise Results List */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            gap: 6,
            maxHeight: isModal ? "50vh" : "55vh",
            overflowY: "auto",
            width: "100%",
          }}
        >
          {loadingSearch ? (
            <div style={{ textAlign: "center", padding: "24px 0", color: "oklch(0.5 0.01 250)", fontSize: 12.5 }}>
              Loading exercises...
            </div>
          ) : results?.length === 0 ? (
            <div style={{ textAlign: "center", padding: "24px 0", color: "oklch(0.5 0.01 250)", fontSize: 12.5 }}>
              No exercises found matching your search.
            </div>
          ) : (
            results?.map((ex) => {
              const isAdded = !!activeDay.exercises.find((e) => e.exerciseId === ex.id);
              return (
                <div
                  key={ex.id}
                  onClick={() => toggleAddExercise(ex)}
                  style={{
                    padding: "9px 11px",
                    background: isAdded ? "oklch(0.18 0.01 250)" : "oklch(0.09 0.004 250)",
                    border: isAdded ? "1.5px solid oklch(0.92 0.25 110 / 50%)" : "1px solid oklch(0.2 0.005 250)",
                    borderRadius: 7,
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center",
                    gap: 8,
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
                    <div style={{ display: "flex", gap: 4, marginTop: 2, flexWrap: "wrap" }}>
                      {ex.primary_muscle && (
                        <span
                          style={{
                            fontSize: 9.5,
                            background: "oklch(0.22 0.005 250)",
                            color: "oklch(0.75 0.01 250)",
                            padding: "1px 5px",
                            borderRadius: 3,
                          }}
                        >
                          {ex.primary_muscle}
                        </span>
                      )}
                      {ex.equipment && (
                        <span
                          style={{
                            fontSize: 9.5,
                            background: "oklch(0.16 0.005 250)",
                            color: "oklch(0.6 0.01 250)",
                            padding: "1px 5px",
                            borderRadius: 3,
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
                      borderRadius: 5,
                      padding: "5px 10px",
                      fontSize: 11,
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
    );
  }

  return (
    <div style={{ maxWidth: 1100, margin: "0 auto", padding: "8px 0 60px", width: "100%" }}>
      {/* Top Header */}
      <div style={{ marginBottom: 14, padding: "0 4px" }}>
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
              padding: "7px 16px",
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

        <h1 style={{ fontSize: 22, fontWeight: 800, letterSpacing: "-0.03em", margin: "8px 0 2px" }}>
          Custom Plan Builder
        </h1>
        {existingCustom && (
          <div style={{ fontSize: 11.5, color: "oklch(0.7 0.15 40)", fontWeight: 500 }}>
            Saving will overwrite your current custom schedule.
          </div>
        )}
      </div>

      {/* Horizontal Day Selector */}
      <div
        style={{
          display: "flex",
          gap: 6,
          overflowX: "auto",
          paddingBottom: 6,
          marginBottom: 14,
          WebkitOverflowScrolling: "touch",
          scrollbarWidth: "none",
          width: "100%",
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
                minWidth: 64,
                padding: "8px 10px",
                borderRadius: 8,
                border: isActive ? "1.5px solid oklch(0.92 0.25 110)" : "1px solid oklch(0.22 0.005 250)",
                background: isActive ? "oklch(0.18 0.01 250)" : "oklch(0.11 0.005 250)",
                cursor: "pointer",
                textAlign: "center",
                color: isActive ? "white" : "oklch(0.65 0.01 250)",
                transition: "all 0.15s",
              }}
            >
              <div style={{ fontSize: 12.5, fontWeight: 700 }}>{DAY_SHORT[idx]}</div>
              <div
                style={{
                  fontSize: 10,
                  marginTop: 2,
                  color: count > 0 ? "oklch(0.92 0.25 110)" : "oklch(0.45 0.01 250)",
                  fontWeight: count > 0 ? 700 : 400,
                }}
              >
                {count > 0 ? `${count} ex` : "Rest"}
              </div>
            </button>
          );
        })}
      </div>

      {/* Main Builder Grid: Always shows Day Workout, with Side Library on Desktop */}
      <div className="builder-grid">
        {/* PANEL 1: Active Day Configuration (ALWAYS VISIBLE) */}
        <div
          className="builder-day-panel"
          style={{
            background: "oklch(0.12 0.005 250)",
            border: "1px solid oklch(0.24 0.005 250)",
            borderRadius: 12,
            padding: "16px 14px",
          }}
        >
          {/* Day Title Input */}
          <div style={{ marginBottom: 12 }}>
            <label style={{ display: "block", fontSize: 11.5, fontWeight: 600, color: "oklch(0.65 0.01 250)", marginBottom: 4 }}>
              Workout Name
            </label>
            <input
              type="text"
              placeholder="e.g. Chest & Triceps (leave empty for Rest)"
              value={activeDay.name}
              onChange={(e) => updateActiveDay((d) => ({ ...d, name: e.target.value }))}
              style={{
                width: "100%",
                background: "oklch(0.08 0.004 250)",
                border: "1px solid oklch(0.22 0.005 250)",
                color: "white",
                padding: "9px 12px",
                borderRadius: 7,
                fontSize: 13.5,
                outline: "none",
                boxSizing: "border-box",
              }}
            />
          </div>

          {/* Optional Checkbox */}
          <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 16 }}>
            <input
              type="checkbox"
              id="isOptional"
              checked={activeDay.isOptional}
              onChange={(e) => updateActiveDay((d) => ({ ...d, isOptional: e.target.checked }))}
              style={{ width: 15, height: 15, accentColor: "oklch(0.92 0.25 110)", cursor: "pointer" }}
            />
            <label htmlFor="isOptional" style={{ fontSize: 12, color: "oklch(0.7 0.01 250)", cursor: "pointer" }}>
              Optional workout (no penalty if skipped)
            </label>
          </div>

          {/* Exercises Header with + Add Exercises button */}
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 12 }}>
            <h3 style={{ margin: 0, fontSize: 14, fontWeight: 700, color: "white" }}>
              {DAY_LABELS[activeDayIdx]} Exercises ({activeDay.exercises.length})
            </h3>
            <button
              onClick={() => setMobileModalOpen(true)}
              style={{
                background: "oklch(0.92 0.25 110)",
                color: "oklch(0.07 0.01 110)",
                border: "none",
                borderRadius: 6,
                padding: "5px 12px",
                fontSize: 12,
                fontWeight: 700,
                cursor: "pointer",
                display: "inline-flex",
                alignItems: "center",
                gap: 4,
              }}
            >
              + Add Exercise
            </button>
          </div>

          {activeDay.exercises.length === 0 ? (
            <div
              style={{
                padding: "32px 14px",
                textAlign: "center",
                border: "1px dashed oklch(0.24 0.01 250)",
                borderRadius: 10,
                background: "oklch(0.09 0.004 250)",
              }}
            >
              <div style={{ fontSize: 24, marginBottom: 4 }}>💤</div>
              <div style={{ fontSize: 13.5, fontWeight: 600, color: "white" }}>Rest Day</div>
              <p style={{ fontSize: 12, color: "oklch(0.55 0.01 250)", margin: "4px 0 14px" }}>
                No exercises added for {DAY_LABELS[activeDayIdx]}.
              </p>
              <button
                onClick={() => setMobileModalOpen(true)}
                style={{
                  background: "oklch(0.92 0.25 110)",
                  color: "oklch(0.07 0.01 110)",
                  border: "none",
                  borderRadius: 6,
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
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              {activeDay.exercises.map((ex, idx) => (
                <div
                  key={`${ex.exerciseId}-${idx}`}
                  style={{
                    background: "oklch(0.09 0.004 250)",
                    border: "1px solid oklch(0.22 0.005 250)",
                    borderRadius: 8,
                    padding: "10px 12px",
                  }}
                >
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 8 }}>
                    <div style={{ display: "flex", alignItems: "center", gap: 6, minWidth: 0, flex: 1 }}>
                      <span
                        style={{
                          fontSize: 10.5,
                          fontWeight: 700,
                          color: "oklch(0.92 0.25 110)",
                          background: "oklch(0.18 0.01 250)",
                          width: 20,
                          height: 20,
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
                          fontSize: 13,
                          fontWeight: 700,
                          whiteSpace: "nowrap",
                          overflow: "hidden",
                          textOverflow: "ellipsis",
                        }}
                      >
                        {ex.name}
                      </h4>
                    </div>

                    <div style={{ display: "flex", alignItems: "center", gap: 3, flexShrink: 0 }}>
                      <button
                        onClick={() => moveExercise(idx, "up")}
                        disabled={idx === 0}
                        style={{
                          background: "oklch(0.16 0.005 250)",
                          border: "none",
                          borderRadius: 4,
                          color: idx === 0 ? "oklch(0.3 0.01 250)" : "white",
                          width: 24,
                          height: 24,
                          fontSize: 11,
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
                          width: 24,
                          height: 24,
                          fontSize: 11,
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
                          width: 24,
                          height: 24,
                          fontSize: 11,
                          fontWeight: 700,
                          cursor: "pointer",
                          marginLeft: 2,
                        }}
                      >
                        ✕
                      </button>
                    </div>
                  </div>

                  {/* Compact input grid */}
                  <div style={{ display: "grid", gridTemplateColumns: "1fr 1.4fr 1fr", gap: 6 }}>
                    {ex.category === "cardio" ? (
                      <div style={{ gridColumn: "1 / -1" }}>
                        <label style={{ display: "block", fontSize: 10, color: "oklch(0.55 0.01 250)", marginBottom: 2 }}>
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
                            padding: "5px 8px",
                            borderRadius: 4,
                            fontSize: 12.5,
                            boxSizing: "border-box",
                          }}
                        />
                      </div>
                    ) : (
                      <>
                        <div>
                          <label style={{ display: "block", fontSize: 10, color: "oklch(0.55 0.01 250)", marginBottom: 2 }}>
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
                              padding: "5px 8px",
                              borderRadius: 4,
                              fontSize: 12.5,
                              boxSizing: "border-box",
                            }}
                          />
                        </div>
                        <div>
                          <label style={{ display: "block", fontSize: 10, color: "oklch(0.55 0.01 250)", marginBottom: 2 }}>
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
                              padding: "5px 8px",
                              borderRadius: 4,
                              fontSize: 12.5,
                              boxSizing: "border-box",
                            }}
                          />
                        </div>
                        <div>
                          <label style={{ display: "block", fontSize: 10, color: "oklch(0.55 0.01 250)", marginBottom: 2 }}>
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
                              padding: "5px 8px",
                              borderRadius: 4,
                              fontSize: 12.5,
                              boxSizing: "border-box",
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

        {/* PANEL 2: Desktop Side-by-Side Exercise Library (Hidden on mobile, uses Modal on mobile) */}
        <div
          className="hidden md:block builder-lib-panel"
          style={{
            background: "oklch(0.12 0.005 250)",
            border: "1px solid oklch(0.24 0.005 250)",
            borderRadius: 12,
            padding: "16px 14px",
          }}
        >
          {renderExerciseLibrary(false)}
        </div>
      </div>

      {/* Mobile Modal Drawer: Opened when clicking + Add Exercise on Mobile */}
      {mobileModalOpen && (
        <div
          style={{
            position: "fixed",
            inset: 0,
            zIndex: 999,
            background: "rgba(0,0,0,0.75)",
            backdropFilter: "blur(6px)",
            display: "flex",
            alignItems: "flex-end",
            justifyContent: "center",
          }}
          onClick={() => setMobileModalOpen(false)}
        >
          <div
            style={{
              background: "oklch(0.12 0.005 250)",
              borderTop: "1px solid oklch(0.28 0.005 250)",
              borderRadius: "16px 16px 0 0",
              padding: "16px 14px 28px",
              width: "100%",
              maxWidth: 520,
              maxHeight: "85vh",
              boxShadow: "0 -8px 32px rgba(0,0,0,0.6)",
              display: "flex",
              flexDirection: "column",
            }}
            onClick={(e) => e.stopPropagation()}
          >
            {renderExerciseLibrary(true)}
          </div>
        </div>
      )}
    </div>
  );
}
