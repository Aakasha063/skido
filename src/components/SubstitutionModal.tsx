import React, { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

interface SubstitutionModalProps {
  originalExerciseId: string;
  originalExerciseName: string;
  onSelect: (newExerciseId: string) => void;
  onClose: () => void;
}

const EQUIPMENT_OPTIONS = ["All", "Dumbbell", "Barbell", "Cable", "Machine", "Bodyweight"];

export function SubstitutionModal({
  originalExerciseId,
  originalExerciseName,
  onSelect,
  onClose,
}: SubstitutionModalProps) {
  const [search, setSearch] = useState("");
  const [selectedEquip, setSelectedEquip] = useState("All");

  // 1. Fetch original exercise details to determine muscle group
  const { data: originalExercise } = useQuery({
    queryKey: ["exercise-detail", originalExerciseId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("exercises")
        .select("id, name, primary_muscle, category, equipment")
        .eq("id", originalExerciseId)
        .single();
      if (error) throw error;
      return data;
    },
  });

  // 2. Fetch all matching exercises for this specific muscle group
  const { data: muscleExercises, isLoading: loadingMuscle } = useQuery({
    queryKey: ["substitutions-full", originalExerciseId, originalExercise?.primary_muscle, originalExercise?.category],
    queryFn: async () => {
      if (!originalExercise) return [];

      const m = (originalExercise.primary_muscle || "").toLowerCase();
      const cat = (originalExercise.category || "").toLowerCase();

      let q = supabase
        .from("exercises")
        .select("id, name, primary_muscle, equipment, category, gif_url")
        .eq("status", "active")
        .neq("id", originalExerciseId)
        .order("name")
        .limit(120);

      // Expand to related muscle taxonomy
      if (m.includes("chest")) {
        q = q.or("primary_muscle.ilike.%chest%,category.eq.chest");
      } else if (m.includes("delt") || m.includes("shoulder")) {
        q = q.or("primary_muscle.ilike.%delt%,primary_muscle.ilike.%shoulder%,category.eq.shoulders");
      } else if (m.includes("lat") || m.includes("back") || m.includes("trap")) {
        q = q.or("primary_muscle.ilike.%lat%,primary_muscle.ilike.%back%,primary_muscle.ilike.%trap%,category.eq.back");
      } else if (m.includes("bicep")) {
        q = q.or("primary_muscle.ilike.%bicep%,primary_muscle.ilike.%brachialis%");
      } else if (m.includes("tricep")) {
        q = q.or("primary_muscle.ilike.%tricep%");
      } else if (m.includes("forearm")) {
        q = q.or("primary_muscle.ilike.%forearm%,primary_muscle.ilike.%wrist%");
      } else if (m.includes("quad") || m.includes("hamstring") || m.includes("glute") || m.includes("calf") || m.includes("leg")) {
        q = q.or("primary_muscle.ilike.%quad%,primary_muscle.ilike.%hamstring%,primary_muscle.ilike.%glute%,primary_muscle.ilike.%calf%,primary_muscle.ilike.%calves%,category.eq.legs");
      } else if (m.includes("abs") || m.includes("core") || cat === "core") {
        q = q.or("primary_muscle.ilike.%abs%,primary_muscle.ilike.%core%,category.eq.core");
      } else if (cat === "cardio") {
        q = q.or("category.eq.cardio,primary_muscle.ilike.%cardio%");
      } else if (originalExercise.primary_muscle) {
        q = q.ilike("primary_muscle", `%${originalExercise.primary_muscle}%`);
      }

      const { data, error } = await q;
      if (error) throw error;
      return data || [];
    },
    enabled: !!originalExercise,
  });

  // 3. Fallback search across the entire library if search text is provided
  const { data: globalSearchResults, isLoading: loadingSearch } = useQuery({
    queryKey: ["exercise-global-search", search],
    queryFn: async () => {
      let q = supabase
        .from("exercises")
        .select("id, name, primary_muscle, equipment, category, gif_url")
        .eq("status", "active")
        .neq("id", originalExerciseId)
        .order("name")
        .limit(60);

      if (search.trim()) {
        q = q.or(`name.ilike.%${search}%,primary_muscle.ilike.%${search}%,equipment.ilike.%${search}%,category.ilike.%${search}%`);
      }

      const { data, error } = await q;
      if (error) throw error;
      return data || [];
    },
    enabled: search.trim().length > 0,
  });

  // Combine and filter list
  const baseList = search.trim().length > 0 ? (globalSearchResults || []) : (muscleExercises || []);
  const filteredList = baseList.filter((ex: any) => {
    if (selectedEquip === "All") return true;
    const eq = (ex.equipment || "").toLowerCase();
    if (selectedEquip === "Dumbbell") return eq.includes("dumbbell");
    if (selectedEquip === "Barbell") return eq.includes("barbell") || eq.includes("olympic");
    if (selectedEquip === "Cable") return eq.includes("cable");
    if (selectedEquip === "Machine") return eq.includes("machine") || eq.includes("leverage") || eq.includes("smith");
    if (selectedEquip === "Bodyweight") return eq.includes("bodyweight") || eq.includes("assisted");
    return true;
  });

  const isLoading = search.trim().length > 0 ? loadingSearch : loadingMuscle;
  const muscleGroupLabel = originalExercise?.primary_muscle || "Target Muscle";

  return (
    <div
      style={{
        position: "fixed",
        inset: 0,
        background: "rgba(0,0,0,0.8)",
        backdropFilter: "blur(6px)",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        zIndex: 9999,
        padding: "12px 10px",
        boxSizing: "border-box",
      }}
      onClick={onClose}
    >
      <div
        style={{
          background: "oklch(0.12 0.005 250)",
          border: "1px solid oklch(0.27 0.005 250)",
          borderRadius: 14,
          width: "100%",
          maxWidth: 500,
          maxHeight: "88vh",
          display: "flex",
          flexDirection: "column",
          boxShadow: "0 16px 40px rgba(0,0,0,0.6)",
          boxSizing: "border-box",
        }}
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div style={{ padding: "16px 14px 12px", borderBottom: "1px solid oklch(0.22 0.005 250)" }}>
          <div style={{ display: "flex", alignItems: "flex-start", justifyContent: "space-between" }}>
            <div>
              <h2 style={{ margin: 0, fontSize: 17, fontWeight: 700 }}>Replace Exercise</h2>
              <p style={{ margin: "3px 0 0", fontSize: 12, color: "oklch(0.63 0.006 250)" }}>
                Replacing <strong>{originalExerciseName}</strong> ({muscleGroupLabel})
              </p>
            </div>
            <button
              onClick={onClose}
              style={{
                background: "transparent",
                border: "none",
                color: "oklch(0.63 0.006 250)",
                cursor: "pointer",
                padding: 4,
                fontSize: 16,
              }}
            >
              ✕
            </button>
          </div>

          {/* Search Input */}
          <input
            type="text"
            placeholder={`Search ${muscleGroupLabel.toLowerCase()} movements or all exercises...`}
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            style={{
              width: "100%",
              marginTop: 14,
              background: "oklch(0.08 0.004 250)",
              border: "1px solid oklch(0.25 0.01 250)",
              color: "white",
              padding: "10px 14px",
              borderRadius: 8,
              fontSize: 13,
              outline: "none",
            }}
          />

          {/* Equipment Filter Chips */}
          <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginTop: 10 }}>
            {EQUIPMENT_OPTIONS.map((equip) => {
              const active = selectedEquip === equip;
              return (
                <button
                  key={equip}
                  onClick={() => setSelectedEquip(equip)}
                  style={{
                    padding: "3px 9px",
                    borderRadius: 999,
                    border: "none",
                    background: active ? "oklch(0.92 0.25 110)" : "oklch(0.18 0.005 250)",
                    color: active ? "oklch(0.07 0.01 110)" : "oklch(0.7 0.01 250)",
                    fontSize: 11,
                    fontWeight: 600,
                    cursor: "pointer",
                    transition: "all 0.15s",
                  }}
                >
                  {equip}
                </button>
              );
            })}
          </div>
        </div>

        {/* Results List */}
        <div style={{ flex: 1, overflowY: "auto", padding: "16px 20px" }}>
          {isLoading ? (
            <div style={{ fontSize: 13, color: "oklch(0.5 0.01 250)", textAlign: "center", padding: "24px 0" }}>
              Loading related exercises...
            </div>
          ) : filteredList.length === 0 ? (
            <div style={{ fontSize: 13, color: "oklch(0.5 0.01 250)", textAlign: "center", padding: "24px 0" }}>
              No exercises found matching your filter.
            </div>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 4 }}>
                <span style={{ fontSize: 11, fontWeight: 700, color: "oklch(0.5 0.01 250)", textTransform: "uppercase", letterSpacing: "0.05em" }}>
                  {search ? "Search Results" : `All ${muscleGroupLabel} Exercises (${filteredList.length})`}
                </span>
              </div>

              {filteredList.map((ex: any) => (
                <div
                  key={ex.id}
                  onClick={() => onSelect(ex.id)}
                  style={{
                    padding: "10px 14px",
                    background: "oklch(0.16 0.005 250)",
                    border: "1px solid oklch(0.24 0.005 250)",
                    borderRadius: 10,
                    cursor: "pointer",
                    display: "flex",
                    justifyContent: "space-between",
                    alignItems: "center",
                    gap: 12,
                    transition: "all 0.15s",
                  }}
                >
                  {/* Left: Thumbnail Preview & Info */}
                  <div style={{ display: "flex", alignItems: "center", gap: 12, minWidth: 0, flex: 1 }}>
                    {ex.gif_url ? (
                      <div
                        style={{
                          width: 40,
                          height: 40,
                          borderRadius: 6,
                          background: "#ffffff",
                          overflow: "hidden",
                          flexShrink: 0,
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                        }}
                      >
                        <img
                          src={ex.gif_url}
                          alt={ex.name}
                          style={{ width: "100%", height: "100%", objectFit: "contain" }}
                          onError={(e) => {
                            (e.target as HTMLElement).style.display = "none";
                          }}
                        />
                      </div>
                    ) : (
                      <div
                        style={{
                          width: 40,
                          height: 40,
                          borderRadius: 6,
                          background: "oklch(0.22 0.005 250)",
                          flexShrink: 0,
                          display: "flex",
                          alignItems: "center",
                          justifyContent: "center",
                          fontSize: 16,
                        }}
                      >
                        🏋️
                      </div>
                    )}

                    <div style={{ minWidth: 0, flex: 1 }}>
                      <div
                        style={{
                          fontSize: 13.5,
                          fontWeight: 600,
                          color: "white",
                          whiteSpace: "nowrap",
                          overflow: "hidden",
                          textOverflow: "ellipsis",
                        }}
                      >
                        {ex.name}
                      </div>
                      <div style={{ display: "flex", gap: 6, marginTop: 3, flexWrap: "wrap" }}>
                        {ex.primary_muscle && (
                          <span
                            style={{
                              fontSize: 10,
                              background: "oklch(0.22 0.01 250)",
                              color: "oklch(0.8 0.01 250)",
                              padding: "1px 6px",
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
                              background: "oklch(0.2 0.01 250)",
                              color: "oklch(0.65 0.01 250)",
                              padding: "1px 6px",
                              borderRadius: 4,
                            }}
                          >
                            {ex.equipment}
                          </span>
                        )}
                      </div>
                    </div>
                  </div>

                  {/* Right: Select Action */}
                  <button
                    style={{
                      background: "oklch(0.92 0.25 110)",
                      color: "oklch(0.07 0.01 110)",
                      border: "none",
                      borderRadius: 6,
                      padding: "6px 12px",
                      fontSize: 12,
                      fontWeight: 700,
                      cursor: "pointer",
                      whiteSpace: "nowrap",
                      flexShrink: 0,
                    }}
                  >
                    Select
                  </button>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
