// Anatomical muscle definitions and mappings for the BodyMap component

export const MUSCLES = [
  'trapezius',
  'deltoids',
  'chest',
  'upper-back',
  'serratus',
  'biceps',
  'triceps',
  'forearm',
  'abs',
  'obliques',
  'lower-back',
  'gluteal',
  'quadriceps',
  'hamstring',
  'adductors',
  'hip-flexors',
  'calves',
  'tibialis',
] as const;

export type MuscleSlug = typeof MUSCLES[number];

export const INERT = ['head', 'hair', 'neck', 'hands', 'feet', 'knees', 'ankles'];

export const MUSCLE_DISPLAY_NAMES: Record<MuscleSlug, string> = {
  trapezius: 'Traps',
  deltoids: 'Shoulders',
  chest: 'Chest',
  'upper-back': 'Upper back',
  serratus: 'Serratus',
  biceps: 'Biceps',
  triceps: 'Triceps',
  forearm: 'Forearms',
  abs: 'Abs & Core',
  obliques: 'Obliques',
  'lower-back': 'Lower back',
  gluteal: 'Glutes',
  quadriceps: 'Quads',
  hamstring: 'Hamstrings',
  adductors: 'Adductors',
  'hip-flexors': 'Hip flexors',
  calves: 'Calves',
  tibialis: 'Shins',
};

// Map BodyMap SVG slugs to database exercise search terms
export const BODY_MAP_TO_SEARCH_TERMS: Record<MuscleSlug, string> = {
  'lower-back': 'Lower back',
  'upper-back': 'Upper back',
  chest: 'Chest',
  deltoids: 'Delts',
  trapezius: 'Traps',
  biceps: 'Biceps',
  triceps: 'Triceps',
  forearm: 'Forearms',
  abs: 'Abs',
  obliques: 'Abs',
  quadriceps: 'Quads',
  hamstring: 'Hamstrings',
  gluteal: 'Glutes',
  calves: 'Calves',
  adductors: 'Glutes',
  'hip-flexors': 'Abs',
  serratus: 'Chest',
  tibialis: 'Calves',
};
