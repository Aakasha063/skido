import { AlgorithmConfig, ExerciseCandidate } from './types';
import libraryRaw from './library.json';

// Cast the JSON dump to our types
export const testLibrary: ExerciseCandidate[] = libraryRaw as any;

export const algorithmV1: AlgorithmConfig = {
  weights: {
    primary_goal_suitability: 3.0,
    secondary_goal_suitability: 1.5,
    movement_coverage: 2.0,
    muscle_coverage: 1.5,
    experience_match: 1.0,
    training_history: 0.5,
    caution_penalty: -2.0,
    redundancy_penalty: -3.0
  },
  movement_coverage_requirements: {
    "hypertrophy": "flexible_by_muscle_priority",
    "strength": "core_lifts_mandatory",
    "fat-loss": "full_pattern_spectrum",
    "recomposition": "full_pattern_spectrum",
    "general-fitness": "full_pattern_spectrum",
    "cardiovascular-endurance": "minimal_resistance_requirements",
    "muscular-endurance": "full_pattern_spectrum",
    "athletic-performance": "power_and_core_mandatory",
    "mobility": "full_ROM_requirements"
  },
  volume_defaults: {
    "hypertrophy":             {sets_per_muscle_per_week: [12, 20], rpe_range: [7.0, 9.0]},
    "strength":                {sets_per_muscle_per_week: [6,  12], rpe_range: [8.0, 9.5]},
    "fat-loss":                {sets_per_muscle_per_week: [10, 16], rpe_range: [7.0, 8.5]},
    "recomposition":           {sets_per_muscle_per_week: [10, 18], rpe_range: [7.0, 9.0]},
    "general-fitness":         {sets_per_muscle_per_week: [8,  15], rpe_range: [6.0, 8.0]},
    "muscular-endurance":      {sets_per_muscle_per_week: [12, 20], rpe_range: [6.0, 8.0]},
    "cardiovascular-endurance":{sets_per_muscle_per_week: [6,  12], rpe_range: [5.0, 7.0]},
    "athletic-performance":    {sets_per_muscle_per_week: [8,  16], rpe_range: [7.0, 9.0]},
    "mobility":                {sets_per_muscle_per_week: [6,  10], rpe_range: [5.0, 7.0]}
  },
  split_rules: {
    "1_days_available": { resistance: 1, cardio: 0, recovery: 6, split: "full-body" },
    "2_days_available": { resistance: 2, cardio: 0, recovery: 5, split: "full-body" },
    "3_days_available": { resistance: 3, cardio: 0, recovery: 4, split: "full-body" },
    "4_days_available": { resistance: 4, cardio: 0, recovery: 3, split: "upper-lower" },
    "5_days_available": { resistance: 4, cardio: 1, recovery: 2, split: "upper-lower-plus-cardio" },
    "6_days_available": { resistance: 5, cardio: 1, recovery: 1, split: "ppl-upper-lower" },
    "7_days_available": { resistance: 5, cardio: 1, recovery: 1, split: "ppl-upper-lower-active-recovery" }
  },
  sequencing: {
    enabled: false,
    priority_order: []
  },
  fatigue_management: {
    enabled: false,
    max_high_fatigue_compounds_per_session: 99,
    avoid_high_fatigue_hinge_after_heavy_hinge: false,
    systemic_fatigue_penalty: 0
  }
};

export const algorithmV1_1: AlgorithmConfig = {
  ...algorithmV1,
  sequencing: {
    enabled: true,
    priority_order: [
      "power",
      "primary_compound",
      "secondary_compound",
      "isolation",
      "core",
      "conditioning"
    ]
  },
  fatigue_management: {
    enabled: true,
    max_high_fatigue_compounds_per_session: 2,
    avoid_high_fatigue_hinge_after_heavy_hinge: true,
    systemic_fatigue_penalty: 2.0
  }
};
