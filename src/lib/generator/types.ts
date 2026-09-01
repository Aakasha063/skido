export type GoalId =
  | 'hypertrophy'
  | 'strength'
  | 'fat-loss'
  | 'recomposition'
  | 'general-fitness'
  | 'cardiovascular-endurance'
  | 'muscular-endurance'
  | 'athletic-performance'
  | 'mobility';

export type ExperienceLevel = 'beginner' | 'intermediate' | 'advanced';

export type ConstraintSeverity = 'mild' | 'moderate' | 'severe';
export type ConstraintCompatibility = 'preferred' | 'compatible' | 'caution' | 'avoid';

export interface UserConstraint {
  constraintTypeId: string; // e.g. 'knee', 'shoulder'
  severity: ConstraintSeverity;
}

export interface UserProfile {
  id: string;
  primaryGoalId: GoalId;
  secondaryGoalId?: GoalId;
  experienceLevel: ExperienceLevel;
  daysAvailablePerWeek: number;
  equipmentIds: string[]; // e.g. ['dumbbell', 'barbell', 'cable']
  constraints: UserConstraint[];
}

export interface AlgorithmWeights {
  primary_goal_suitability: number;
  secondary_goal_suitability: number;
  movement_coverage: number;
  muscle_coverage: number;
  experience_match: number;
  training_history: number;
  caution_penalty: number;
  redundancy_penalty: number;
}

export interface AlgorithmVolumeDefault {
  sets_per_muscle_per_week: [number, number];
  rpe_range: [number, number];
}

export interface AlgorithmSplitRule {
  resistance: number;
  cardio: number;
  recovery: number;
  split: string;
}

export interface SequencingConfig {
  enabled: boolean;
  priority_order: string[]; // e.g. ["power", "primary_compound", "secondary_compound", "isolation", "core"]
}

export interface FatigueConfig {
  enabled: boolean;
  max_high_fatigue_compounds_per_session: number;
  avoid_high_fatigue_hinge_after_heavy_hinge: boolean;
  systemic_fatigue_penalty: number;
}

export interface AlgorithmConfig {
  weights: AlgorithmWeights;
  movement_coverage_requirements: Record<GoalId, string>;
  volume_defaults: Record<GoalId, AlgorithmVolumeDefault>;
  split_rules: Record<string, AlgorithmSplitRule>;
  sequencing: SequencingConfig;
  fatigue_management: FatigueConfig;
}

export interface ExerciseCharacteristics {
  difficulty_level: ExperienceLevel;
  stimulus_to_fatigue: number;
  technical_demand: number;
  loadability: number;
  unilateral: boolean;
  resistance_profile: string;
}

export interface ExerciseCandidate {
  id: string;
  slug: string;
  name: string;
  equipmentIds: string[];
  muscles: {
    muscleId: string;
    regionId: string | null;
    role: 'primary' | 'secondary' | 'tertiary';
  }[];
  movements: string[]; // Movement pattern IDs
  characteristics: ExerciseCharacteristics;
  goalScores: Record<GoalId, number>; // From exercise_goal_suitability
  constraints: Record<string, ConstraintCompatibility>; // constraint_type_id -> compatibility
}

export interface ScoredExercise extends ExerciseCandidate {
  score: number;
  scoreBreakdown: Record<string, number>;
  selectedBecause: string[];
}

export interface GeneratorContext {
  profile: UserProfile;
  algorithm: AlgorithmConfig;
  library: ExerciseCandidate[];
  hardFiltered: ExerciseCandidate[];
  rankedPool: ScoredExercise[];
  selectedExercises: ScoredExercise[];
  logs: string[];
}
