import { GeneratorContext, ExerciseCandidate } from '../types';

/**
 * Stage 2: Hard Filtering
 * 
 * Excludes candidates that violate physical constraints (avoid)
 * or equipment constraints. Bodyweight exercises are assumed 
 * available if they don't require equipment.
 */
export function executeHardFilter(ctx: GeneratorContext): void {
  ctx.logs.push('--- Stage 2: Hard Filtering ---');
  
  const filtered = ctx.library.filter((exercise) => {
    // 1. Check User Constraints
    for (const userConstraint of ctx.profile.constraints) {
      const comp = exercise.constraints[userConstraint.constraintTypeId];
      if (comp === 'avoid') {
        ctx.logs.push(`Excluded ${exercise.slug}: Violates constraint '${userConstraint.constraintTypeId}' (avoid)`);
        return false; // Hard filter
      }
    }

    // 2. Check Equipment Availability
    // An exercise requires ALL of its mapped equipment IDs.
    // If the exercise has no equipment, it's bodyweight/free.
    if (exercise.equipmentIds.length > 0) {
      const missingEquipment = exercise.equipmentIds.find(
        eq => !ctx.profile.equipmentIds.includes(eq)
      );
      
      if (missingEquipment) {
        ctx.logs.push(`Excluded ${exercise.slug}: Missing equipment '${missingEquipment}'`);
        return false; // Hard filter
      }
    }

    return true; // Passed filters
  });

  ctx.logs.push(`Passed Hard Filter: ${filtered.length} / ${ctx.library.length} candidates.`);
  ctx.hardFiltered = filtered;
}
