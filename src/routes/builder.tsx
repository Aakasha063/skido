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
    if (!user) return;
    
    // Convert state to API format
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

    // Filter out completely empty days unless they were explicitly named
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
        return { ...day, exercises: day.exercises.filter((e) => e.exerciseId !== ex.id) };
      }
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
    <div style={{ maxWidth: 1000, margin: "0 auto", padding: "40px 20px" }}>
      <div style={{ marginBottom: 32, display: "flex", justifyContent: "space-between", alignItems: "flex-end" }}>
        <div>
          <Link to="/plan" style={{ color: "oklch(0.6 0.02 250)", textDecoration: "none", fontSize: 14 }}>
            ← Back to Plan
          </Link>
          <h1 style={{ fontSize: 32, fontWeight: 700, letterSpacing: "-0.03em", margin: "8px 0 0" }}>
            Weekly Builder
          </h1>
          {existingCustom && (
            <div style={{ fontSize: 13, color: "oklch(0.7 0.15 40)", marginTop: 6, fontWeight: 500 }}>
              Saving this plan will overwrite your existing custom schedule.
            </div>
          )}
        </div>
        <button
          onClick={handleSave}
          disabled={isSaving}
          style={{
            background: "oklch(0.92 0.25 110)",
            color: "oklch(0.07 0.01 110)",
            border: "none",
            borderRadius: 8,
            padding: "10px 20px",
            fontSize: 14,
            fontWeight: 600,
            cursor: isSaving ? "wait" : "pointer",
            opacity: isSaving ? 0.7 : 1,
            transition: "opacity 0.2s",
          }}
        >
          {isSaving ? "Saving..." : "Save Weekly Plan"}
        </button>
      </div>

      <div style={{ display: "flex", gap: 32, alignItems: "flex-start" }}>
        {/* LEFT: Weekly Roster */}
        <div style={{ width: 200, flexShrink: 0, display: "flex", flexDirection: "column", gap: 8 }}>
          <h3 style={{ fontSize: 13, fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em", color: "oklch(0.5 0.01 250)", marginBottom: 4 }}>
            Schedule
          </h3>
          {daysState.map((day, idx) => {
            const isActive = idx === activeDayIdx;
            const isEmpty = day.exercises.length === 0 && !day.name;
            return (
              <button
                key={day.dayOfWeek}
                onClick={() => setActiveDayIdx(idx)}
                style={{
                  textAlign: "left",
                  padding: "12px 16px",
                  borderRadius: 12,
                  border: isActive ? "1px solid oklch(0.4 0.02 250)" : "1px solid transparent",
                  background: isActive ? "oklch(0.15 0.01 250)" : "oklch(0.1 0.01 250)",
                  cursor: "pointer",
                  transition: "all 0.2s",
                  color: isActive ? "white" : "oklch(0.7 0.01 250)",
                }}
              >
                <div style={{ fontSize: 14, fontWeight: isActive ? 600 : 500 }}>{DAY_LABELS[idx]}</div>
                <div style={{ fontSize: 12, marginTop: 4, color: isActive ? "oklch(0.8 0.01 250)" : "oklch(0.5 0.01 250)" }}>
                  {isEmpty ? "Rest Day" : day.name || "Unnamed Workout"}
                </div>
              </button>
            );
          })}
        </div>

        {/* CENTER: Active Day Editor */}
        <div style={{ flex: 1, minWidth: 0, background: "oklch(0.08 0.005 250)", border: "1px solid oklch(0.2 0.01 250)", borderRadius: 16, padding: 24 }}>
          <div style={{ display: "flex", gap: 16, marginBottom: 24 }}>
            <div style={{ flex: 1 }}>
              <label style={{ display: "block", fontSize: 13, fontWeight: 500, color: "oklch(0.6 0.01 250)", marginBottom: 8 }}>
                Day Name (e.g. Chest & Triceps)
              </label>
              <input
                type="text"
                placeholder="Leave blank for Rest Day"
                value={activeDay.name}
                onChange={(e) => updateActiveDay((d) => ({ ...d, name: e.target.value }))}
                style={{
                  width: "100%",
                  background: "oklch(0.12 0.01 250)",
                  border: "1px solid oklch(0.25 0.01 250)",
                  color: "white",
                  padding: "10px 14px",
                  borderRadius: 8,
                  fontSize: 15,
                  outline: "none",
                }}
              />
            </div>
          </div>

          <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 32 }}>
            <input
              type="checkbox"
              id="isOptional"
              checked={activeDay.isOptional}
              onChange={(e) => updateActiveDay((d) => ({ ...d, isOptional: e.target.checked }))}
              style={{ width: 16, height: 16, accentColor: "oklch(0.92 0.25 110)" }}
            />
            <label htmlFor="isOptional" style={{ fontSize: 14, color: "oklch(0.8 0.01 250)", cursor: "pointer" }}>
              Mark as optional workout (won't count towards weekly goal if skipped)
            </label>
          </div>

          <h3 style={{ fontSize: 15, fontWeight: 600, marginBottom: 16, color: "oklch(0.9 0.01 250)" }}>
            Exercises ({activeDay.exercises.length})
          </h3>
          
          {activeDay.exercises.length === 0 ? (
            <div style={{ padding: 32, textAlign: "center", border: "1px dashed oklch(0.25 0.01 250)", borderRadius: 12, color: "oklch(0.5 0.01 250)", fontSize: 14 }}>
              No exercises added. Use the library on the right to add some, or leave empty for a rest day.
            </div>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
              {activeDay.exercises.map((ex, idx) => (
                <div key={`${ex.exerciseId}-${idx}`} style={{ background: "oklch(0.12 0.01 250)", border: "1px solid oklch(0.2 0.01 250)", borderRadius: 12, padding: 16 }}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 12 }}>
                    <h4 style={{ margin: 0, fontSize: 15, fontWeight: 600 }}>{ex.name}</h4>
                    <div style={{ display: "flex", gap: 4 }}>
                      <button onClick={() => moveExercise(idx, "up")} disabled={idx === 0} style={{ background: "transparent", border: "none", color: idx === 0 ? "oklch(0.3 0.01 250)" : "oklch(0.6 0.01 250)", cursor: idx === 0 ? "default" : "pointer" }}>↑</button>
                      <button onClick={() => moveExercise(idx, "down")} disabled={idx === activeDay.exercises.length - 1} style={{ background: "transparent", border: "none", color: idx === activeDay.exercises.length - 1 ? "oklch(0.3 0.01 250)" : "oklch(0.6 0.01 250)", cursor: idx === activeDay.exercises.length - 1 ? "default" : "pointer" }}>↓</button>
                      <button onClick={() => toggleAddExercise({ id: ex.exerciseId })} style={{ background: "transparent", border: "none", color: "oklch(0.6 0.15 40)", cursor: "pointer", marginLeft: 8 }}>✕</button>
                    </div>
                  </div>
                  <div style={{ display: "flex", gap: 16 }}>
                    {ex.category === "cardio" ? (
                      <div style={{ flex: 1 }}>
                        <label style={{ display: "block", fontSize: 12, color: "oklch(0.5 0.01 250)", marginBottom: 4 }}>Duration (mins)</label>
                        <input type="text" placeholder="e.g. 15" value={ex.repRange} onChange={(e) => updateExercise(idx, { repRange: e.target.value })} style={{ width: "100%", background: "oklch(0.08 0.01 250)", border: "1px solid oklch(0.25 0.01 250)", color: "white", padding: "6px 10px", borderRadius: 6, fontSize: 14 }} />
                      </div>
                    ) : (
                      <>
                        <div style={{ flex: 1 }}>
                          <label style={{ display: "block", fontSize: 12, color: "oklch(0.5 0.01 250)", marginBottom: 4 }}>Sets</label>
                          <input type="number" min="1" value={ex.sets} onChange={(e) => updateExercise(idx, { sets: Number(e.target.value) })} style={{ width: "100%", background: "oklch(0.08 0.01 250)", border: "1px solid oklch(0.25 0.01 250)", color: "white", padding: "6px 10px", borderRadius: 6, fontSize: 14 }} />
                        </div>
                        <div style={{ flex: 2 }}>
                          <label style={{ display: "block", fontSize: 12, color: "oklch(0.5 0.01 250)", marginBottom: 4 }}>Reps</label>
                          <input type="text" placeholder="e.g. 8-12" value={ex.repRange} onChange={(e) => updateExercise(idx, { repRange: e.target.value })} style={{ width: "100%", background: "oklch(0.08 0.01 250)", border: "1px solid oklch(0.25 0.01 250)", color: "white", padding: "6px 10px", borderRadius: 6, fontSize: 14 }} />
                        </div>
                        <div style={{ flex: 1 }}>
                          <label style={{ display: "block", fontSize: 12, color: "oklch(0.5 0.01 250)", marginBottom: 4 }}>Rest (sec)</label>
                          <input type="number" min="0" step="30" value={ex.restSeconds} onChange={(e) => updateExercise(idx, { restSeconds: Number(e.target.value) })} style={{ width: "100%", background: "oklch(0.08 0.01 250)", border: "1px solid oklch(0.25 0.01 250)", color: "white", padding: "6px 10px", borderRadius: 6, fontSize: 14 }} />
                        </div>
                      </>
                    )}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        {/* RIGHT: Library Search */}
        <div style={{ width: 320, flexShrink: 0 }}>
          <div style={{ position: "sticky", top: 24 }}>
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 12 }}>
              <h3 style={{ margin: 0, fontSize: 13, fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em", color: "oklch(0.5 0.01 250)" }}>
                Library
              </h3>
              <button
                onClick={() => setShowBodyMap((v) => !v)}
                style={{
                  fontSize: 11,
                  fontWeight: 600,
                  padding: "3px 8px",
                  borderRadius: 6,
                  border: "1px solid oklch(0.25 0.01 250)",
                  background: showBodyMap ? "oklch(0.92 0.25 110 / 15%)" : "oklch(0.14 0.005 250)",
                  color: showBodyMap ? "oklch(0.92 0.25 110)" : "oklch(0.7 0.01 250)",
                  cursor: "pointer",
                }}
              >
                {showBodyMap ? "Hide Body Model" : "🧍 Muscle Model"}
              </button>
            </div>

            {/* Interactive Anatomical Body Map */}
            {showBodyMap && (
              <div style={{ marginBottom: 14 }}>
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
            <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginBottom: 12 }}>
              {["All", "Lower Back", "Upper Back", "Chest", "Shoulders", "Arms", "Legs", "Core", "Cardio"].map((m) => {
                const isCurrent = selectedMuscle === m;
                return (
                  <button
                    key={m}
                    onClick={() => {
                      setSelectedMuscle(m);
                      setSelectedBodySlug(null);
                    }}
                    style={{
                      padding: "4px 10px",
                      borderRadius: 999,
                      border: "none",
                      background: isCurrent ? "oklch(0.92 0.25 110)" : "oklch(0.18 0.01 250)",
                      color: isCurrent ? "oklch(0.07 0.01 110)" : "oklch(0.7 0.01 250)",
                      fontSize: 11,
                      fontWeight: 600,
                      cursor: "pointer",
                      transition: "all 0.15s",
                    }}
                  >
                    {m}
                  </button>
                );
              })}
            </div>

            <input
              type="text"
              placeholder={`Search ${selectedMuscle === "All" ? "exercises, muscles, equipment..." : `${selectedMuscle.toLowerCase()} exercises...`}`}
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              style={{
                width: "100%",
                background: "oklch(0.1 0.01 250)",
                border: "1px solid oklch(0.2 0.01 250)",
                color: "white",
                padding: "10px 14px",
                borderRadius: 8,
                fontSize: 13,
                marginBottom: 12,
                outline: "none",
              }}
            />

            <div style={{ maxHeight: "calc(100vh - 270px)", overflowY: "auto", display: "flex", flexDirection: "column", gap: 8, paddingRight: 4 }}>
              {loadingSearch ? (
                <div style={{ fontSize: 13, color: "oklch(0.5 0.01 250)", padding: 12 }}>Searching...</div>
              ) : results?.length === 0 ? (
                <div style={{ fontSize: 13, color: "oklch(0.5 0.01 250)", padding: 12 }}>No exercises found.</div>
              ) : (
                results?.map((ex: any) => {
                  const isSelected = activeDay.exercises.some((s) => s.exerciseId === ex.id);
                  return (
                    <button
                      key={ex.id}
                      onClick={() => toggleAddExercise(ex)}
                      style={{
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "space-between",
                        background: isSelected ? "oklch(0.18 0.01 250)" : "oklch(0.08 0.01 250)",
                        border: isSelected ? "1px solid oklch(0.4 0.01 250)" : "1px solid oklch(0.2 0.01 250)",
                        padding: "10px 12px",
                        borderRadius: 8,
                        cursor: "pointer",
                        textAlign: "left",
                        transition: "all 0.15s",
                      }}
                    >
                      <div style={{ flex: 1, marginRight: 8 }}>
                        <div style={{ fontSize: 13, fontWeight: 500, color: isSelected ? "white" : "oklch(0.85 0.01 250)" }}>
                          {ex.name}
                        </div>
                        <div style={{ display: "flex", gap: 6, marginTop: 4, flexWrap: "wrap" }}>
                          {ex.primary_muscle && (
                            <span style={{ fontSize: 10, background: "oklch(0.22 0.01 250)", color: "oklch(0.75 0.01 250)", padding: "1px 6px", borderRadius: 4 }}>
                              {ex.primary_muscle}
                            </span>
                          )}
                          {ex.equipment && (
                            <span style={{ fontSize: 10, background: "oklch(0.15 0.01 250)", color: "oklch(0.6 0.01 250)", padding: "1px 6px", borderRadius: 4 }}>
                              {ex.equipment}
                            </span>
                          )}
                        </div>
                      </div>
                      <div
                        style={{
                          width: 20,
                          height: 20,
                          flexShrink: 0,
                          borderRadius: 4,
                          border: isSelected ? "none" : "1px solid oklch(0.4 0.01 250)",
                          background: isSelected ? "oklch(0.92 0.25 110)" : "transparent",
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          color: "oklch(0.07 0.01 110)",
                        }}
                      >
                        {isSelected && (
                          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3" strokeLinecap="round">
                            <polyline points="20 6 9 17 4 12" />
                          </svg>
                        )}
                      </div>
                    </button>
                  );
                })
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
