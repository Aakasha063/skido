import { ExerciseCandidate, UserProfile } from '../generator/types';

export interface SubstitutionResult {
  exercise: ExerciseCandidate;
  score: number;
  reasons: string[];
}

/**
 * Returns a ranked list of viable alternatives for a given exercise,
 * respecting the user's equipment and safety constraints.
 */
export function getExerciseAlternatives(
  originalId: string,
  profile: UserProfile,
  library: ExerciseCandidate[]
): SubstitutionResult[] {
  const original = library.find(ex => ex.id === originalId || ex.slug === originalId);
  if (!original) return [];

  const candidates: SubstitutionResult[] = [];

  for (const candidate of library) {
    if (candidate.id === original.id) continue;

    const reasons: string[] = [];
    let score = 0;

    // --- Hard Filters ---
    
    // 1. Equipment check
    const hasEquipment = candidate.equipmentIds.every(eq => profile.equipmentIds.includes(eq));
    if (!hasEquipment && candidate.equipmentIds.length > 0) continue; // Skip if user lacks required equipment

    // 2. Constraint Safety check
    let unsafe = false;
    for (const c of profile.constraints) {
      if (candidate.constraints && candidate.constraints[c.constraintTypeId] === 'avoid') {
        unsafe = true;
        break;
      }
    }
    if (unsafe) continue;

    // --- Scoring / Ranking ---

    // Movement Pattern Match (Highest Weight)
    const sharedMovements = candidate.movements.filter(m => original.movements.includes(m));
    if (sharedMovements.length > 0) {
      score += 50 * sharedMovements.length;
      reasons.push(`Shares movement pattern (${sharedMovements.join(', ')})`);
    }

    // Primary Muscle Match
    const originalPrimaryMuscles = original.muscles.filter(m => m.role === 'primary').map(m => m.muscleId);
    const candidatePrimaryMuscles = candidate.muscles.filter(m => m.role === 'primary').map(m => m.muscleId);
    const sharedPrimaryMuscles = candidatePrimaryMuscles.filter(m => originalPrimaryMuscles.includes(m));
    
    if (sharedPrimaryMuscles.length > 0) {
      score += 30 * sharedPrimaryMuscles.length;
      reasons.push(`Targets same primary muscle (${sharedPrimaryMuscles.join(', ')})`);
    } else {
      // Significant penalty if it doesn't train the same primary muscle at all
      score -= 50; 
    }

    // Goal Suitability Match
    const candidateGoalScore = candidate.goalScores[profile.primaryGoalId] || 0;
    score += candidateGoalScore * 2;
    if (candidateGoalScore >= 8) {
      reasons.push(`Highly suitable for your goal`);
    }

    // Difficulty Penalty
    const diffMap: Record<string, number> = { 'beginner': 1, 'intermediate': 2, 'advanced': 3 };
    const userDiff = diffMap[profile.experienceLevel] || 1;
    const exDiff = diffMap[candidate.characteristics.difficulty_level] || 1;
    const diffDelta = Math.abs(userDiff - exDiff);
    
    if (diffDelta === 1) score -= 5;
    if (diffDelta === 2) {
      score -= 20;
      reasons.push(`Significant difficulty mismatch`);
    }

    if (score > 0) {
      candidates.push({ exercise: candidate, score, reasons });
    }
  }

  // Sort descending
  candidates.sort((a, b) => b.score - a.score);

  return candidates.slice(0, 10); // Return top 10
}

/**
 * Auto-substitution for when a specific equipment piece becomes unavailable mid-workout.
 */
export function getCompatibleSubstitutions(
  originalId: string,
  unavailableEquipmentId: string,
  profile: UserProfile,
  library: ExerciseCandidate[]
): SubstitutionResult[] {
  // Strip the unavailable equipment from the profile temporarily
  const modifiedProfile: UserProfile = {
    ...profile,
    equipmentIds: profile.equipmentIds.filter(eq => eq !== unavailableEquipmentId)
  };

  return getExerciseAlternatives(originalId, modifiedProfile, library);
}
