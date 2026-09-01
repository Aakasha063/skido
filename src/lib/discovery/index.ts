import { ExerciseCandidate, GoalId, ExperienceLevel } from '../generator/types';

export interface ExerciseFilters {
  muscles?: string[];
  equipment?: string[];
  difficulty?: ExperienceLevel[];
  movements?: string[];
  goals?: GoalId[];
}

// User-facing UI muscle names to backend anatomical muscles
export const MUSCLE_UI_MAP: Record<string, string[]> = {
  'Chest': ['pectoralis-major'],
  'Upper Chest': ['pectoralis-major'], // Realistically we'd map to regions, but sticking to muscles for MVP
  'Lower Chest': ['pectoralis-major'],
  'Back': ['latissimus-dorsi', 'rhomboids', 'trapezius', 'erector-spinae'],
  'Shoulders': ['anterior-deltoid', 'lateral-deltoid', 'posterior-deltoid'],
  'Biceps': ['biceps-brachii', 'brachialis'],
  'Triceps': ['triceps-brachii'],
  'Abs': ['rectus-abdominis', 'obliques'],
  'Glutes': ['gluteus-maximus', 'gluteus-medius'],
  'Quads': ['quadriceps'],
  'Hamstrings': ['hamstrings'],
  'Calves': ['calves'],
  'Forearms': ['forearms'],
  'Full Body': ['pectoralis-major', 'latissimus-dorsi', 'quadriceps', 'hamstrings'] // naive representation
};

/**
 * Maps a friendly UI muscle group name to the underlying database exercises.
 */
export function getExercisesByMuscle(friendlyName: string, library: ExerciseCandidate[]): ExerciseCandidate[] {
  const targetMuscles = MUSCLE_UI_MAP[friendlyName] || [];
  if (targetMuscles.length === 0) return [];

  return library.filter(ex => 
    ex.muscles.some(m => targetMuscles.includes(m.muscleId))
  );
}

/**
 * Searches and filters the exercise library based on user input.
 */
export function searchExercises(query: string, filters: ExerciseFilters, library: ExerciseCandidate[]): ExerciseCandidate[] {
  let results = library;

  // 1. Text Search
  if (query && query.trim().length > 0) {
    const q = query.toLowerCase();
    results = results.filter(ex => 
      ex.name.toLowerCase().includes(q) || 
      ex.slug.toLowerCase().includes(q)
      // aliases would go here if attached to ExerciseCandidate
    );
  }

  // 2. Muscle Filter
  if (filters.muscles && filters.muscles.length > 0) {
    results = results.filter(ex => 
      ex.muscles.some(m => filters.muscles!.includes(m.muscleId))
    );
  }

  // 3. Equipment Filter
  if (filters.equipment && filters.equipment.length > 0) {
    results = results.filter(ex => {
      // Check if the exercise requires ANY equipment in the filter, or if it's bodyweight
      if (filters.equipment!.includes('bodyweight') && ex.equipmentIds.length === 0) return true;
      return ex.equipmentIds.some(eq => filters.equipment!.includes(eq));
    });
  }

  // 4. Difficulty Filter
  if (filters.difficulty && filters.difficulty.length > 0) {
    results = results.filter(ex => 
      filters.difficulty!.includes(ex.characteristics.difficulty_level)
    );
  }

  // 5. Movement Filter
  if (filters.movements && filters.movements.length > 0) {
    results = results.filter(ex => 
      ex.movements.some(m => filters.movements!.includes(m))
    );
  }

  // 6. Goal Filter
  if (filters.goals && filters.goals.length > 0) {
    results = results.filter(ex => 
      filters.goals!.some(g => (ex.goalScores[g] || 0) > 5) // naive threshold
    );
  }

  return results;
}
