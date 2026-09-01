import { GeneratorContext, ScoredExercise } from '../types';

/**
 * Stage 4: Allocation & Coverage
 * 
 * Selects the top N exercises to meet movement and muscle coverage
 * targets, keeping volume rules in mind.
 */
export function executeAllocation(ctx: GeneratorContext): void {
  ctx.logs.push('--- Stage 4: Allocation & Coverage ---');

  // We need to pick exercises from rankedPool to cover major movements
  // For v1, we will attempt to hit core movement patterns if required,
  // or simply pick top scored exercises that don't excessively overlap.
  
  const w = ctx.algorithm.weights;
  const coverageReq = ctx.algorithm.movement_coverage_requirements[ctx.profile.primaryGoalId];
  
  const selected: ScoredExercise[] = [];
  const coveredMovements = new Set<string>();
  const coveredMuscles = new Set<string>();

  // Helper to calculate redundancy penalty
  const getRedundancyPenalty = (ex: ScoredExercise) => {
    let penalty = 0;
    // Check overlapping movements
    for (const mov of ex.movements) {
      if (coveredMovements.has(mov)) {
        penalty += Math.abs(w.redundancy_penalty);
      }
    }
    // Check overlapping primary muscles
    for (const m of ex.muscles.filter(m => m.role === 'primary')) {
      if (coveredMuscles.has(m.muscleId)) {
        penalty += (Math.abs(w.redundancy_penalty) * 0.5); 
      }
    }
    return penalty;
  };

  // Target number of exercises per week (heuristic based on days available)
  const splitRuleKey = `${ctx.profile.daysAvailablePerWeek}_days_available` as const;
  const split = ctx.algorithm.split_rules[splitRuleKey];
  const targetExercisesPerWeek = split.resistance * 5; // e.g. 5 exercises per session

  for (let i = 0; i < ctx.rankedPool.length; i++) {
    const candidate = { ...ctx.rankedPool[i] };
    
    // Recalculate score dynamically based on what's already selected
    const penalty = getRedundancyPenalty(candidate);
    
    // For V1 MVP, if we haven't hit our target exercise count, 
    // we select it, UNLESS the penalty drops it below 0 and we have better options
    // Wait, since we re-score, we should technically re-sort. 
    // For simplicity in this functional pipeline: we just accept top candidates,
    // applying penalty, until we reach the target.
    
    candidate.score -= penalty;
    if (penalty > 0) {
      candidate.scoreBreakdown['Redundancy Penalty'] = -penalty;
    }

    // Only take it if it's positive or we desperately need exercises
    if (candidate.score > 0 || selected.length < targetExercisesPerWeek * 0.5) {
      selected.push(candidate);
      
      // Update coverage sets
      candidate.movements.forEach(m => coveredMovements.add(m));
      candidate.muscles.forEach(m => {
        if (m.role === 'primary') coveredMuscles.add(m.muscleId);
      });
    }

    if (selected.length >= targetExercisesPerWeek) {
      break; // We have enough for the week
    }
  }

  // Fallback: If library is too small, allow redundancies (just pick top again)
  if (selected.length < targetExercisesPerWeek && ctx.rankedPool.length > 0) {
    ctx.logs.push('Warning: Insufficient unique exercises. Padding with redundant top choices.');
    let idx = 0;
    while (selected.length < targetExercisesPerWeek) {
      selected.push(ctx.rankedPool[idx % ctx.rankedPool.length]);
      idx++;
    }
  }

  ctx.selectedExercises = selected;
  ctx.logs.push(`Allocated ${selected.length} exercises for ${split.resistance} resistance days.`);
}
