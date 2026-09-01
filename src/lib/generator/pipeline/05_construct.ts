import { GeneratorContext, ScoredExercise } from '../types';

/**
 * Stage 5: Construction & Progression
 * 
 * Constructs the actual workout days and distributes the selected
 * exercises into these workouts according to the split rule and volume defaults.
 */
export function executeConstruction(ctx: GeneratorContext): void {
  ctx.logs.push('--- Stage 5: Construction & Progression ---');

  const splitRuleKey = `${ctx.profile.daysAvailablePerWeek}_days_available` as const;
  const split = ctx.algorithm.split_rules[splitRuleKey];
  const volumeDefault = ctx.algorithm.volume_defaults[ctx.profile.primaryGoalId];
  
  if (ctx.selectedExercises.length === 0) {
    ctx.logs.push('WARNING: No exercises selected for construction.');
    return;
  }

  const workouts = Array.from({ length: split.resistance }, (_, i) => ({
    day: i + 1,
    exercises: [] as any[]
  }));

  const fatigueConfig = ctx.algorithm.fatigue_management;
  const seqConfig = ctx.algorithm.sequencing;

  // Pre-calculate how many exercises exist for each primary muscle
  const exCountByMuscle: Record<string, number> = {};
  ctx.selectedExercises.forEach(ex => {
    ex.muscles.filter(m => m.role === 'primary').forEach(m => {
      exCountByMuscle[m.muscleId] = (exCountByMuscle[m.muscleId] || 0) + 1;
    });
  });

  const [minSets] = volumeDefault.sets_per_muscle_per_week;

  ctx.selectedExercises.forEach((ex, index) => {
    // 1. Calculate dynamic volume cap (max 5 sets per session per exercise)
    // Find the primary muscle that requires the most sets per exercise
    let setsToAssign = 3; // fallback
    let maxSetsNeeded = 0;
    
    const primaryMuscles = ex.muscles.filter(m => m.role === 'primary');
    if (primaryMuscles.length > 0) {
      primaryMuscles.forEach(m => {
        const count = exCountByMuscle[m.muscleId] || 1;
        const requiredPerEx = Math.ceil(minSets / count);
        if (requiredPerEx > maxSetsNeeded) maxSetsNeeded = requiredPerEx;
      });
      // Cap at 5 to prevent absurd volume per session, triggering a quality warning instead
      setsToAssign = Math.min(5, maxSetsNeeded);
    }

    // 2. Assign to a day with Fatigue Limits
    let targetDay = index % workouts.length;
    let placed = false;
    
    // Check if it's a high-fatigue movement
    const isHighFatigue = ex.characteristics.stimulus_to_fatigue <= 2 && ex.characteristics.difficulty_level === 'advanced';
    const isHinge = ex.movements.some(m => m.includes('hinge'));
    const isHeavyHinge = isHinge && ex.characteristics.stimulus_to_fatigue <= 2;

    for (let attempt = 0; attempt < workouts.length; attempt++) {
      const dayIdx = (targetDay + attempt) % workouts.length;
      const currentDay = workouts[dayIdx];
      
      let canPlace = true;

      if (fatigueConfig?.enabled) {
        let dayHighFatigueCount = 0;
        let dayHasHeavyHinge = false;

        currentDay.exercises.forEach(dayEx => {
          const dbEx = ctx.library.find(v => v.id === dayEx.exercise_id || v.slug === dayEx.slug);
          if (dbEx) {
            if (dbEx.characteristics.stimulus_to_fatigue <= 2 && dbEx.characteristics.difficulty_level === 'advanced') {
              dayHighFatigueCount++;
            }
            if (dbEx.movements.some(m => m.includes('hinge')) && dbEx.characteristics.stimulus_to_fatigue <= 2) {
              dayHasHeavyHinge = true;
            }
          }
        });

        if (isHighFatigue && dayHighFatigueCount >= fatigueConfig.max_high_fatigue_compounds_per_session) {
          canPlace = false;
        }
        if (isHeavyHinge && dayHasHeavyHinge && fatigueConfig.avoid_high_fatigue_hinge_after_heavy_hinge) {
          canPlace = false;
        }
      }

      if (canPlace || attempt === workouts.length - 1) { // Force place if no day is optimal
        let repMin = 8, repMax = 12;
        if (ctx.profile.primaryGoalId === 'strength') { repMin = 4; repMax = 6; }
        else if (ctx.profile.primaryGoalId === 'muscular-endurance') { repMin = 15; repMax = 20; }
        else if (ctx.profile.primaryGoalId === 'cardiovascular-endurance') { repMin = 1; repMax = 1; }

        let exClass = 'isolation';
        if (ex.movements.some(m => m.includes('push') || m.includes('pull') || m.includes('squat') || m.includes('hinge'))) {
          exClass = 'primary_compound';
        }

        currentDay.exercises.push({
          exercise_id: ex.id,
          slug: ex.slug,
          name: ex.name,
          sets: setsToAssign,
          rep_min: repMin,
          rep_max: repMax,
          rpe_target: volumeDefault.rpe_range[1],
          rest_seconds: ctx.profile.primaryGoalId === 'strength' ? 180 : 90,
          notes: ex.selectedBecause.join('; '),
          score: ex.score,
          scoreBreakdown: ex.scoreBreakdown,
          _exClass: exClass // temporary tag for sorting
        });
        placed = true;
        break;
      }
    }
  });

  // 3. Sequencing Sort
  if (seqConfig?.enabled && seqConfig.priority_order) {
    workouts.forEach(sess => {
      sess.exercises.sort((a, b) => {
        const idxA = seqConfig.priority_order.indexOf(a._exClass);
        const idxB = seqConfig.priority_order.indexOf(b._exClass);
        return (idxA === -1 ? 99 : idxA) - (idxB === -1 ? 99 : idxB);
      });
      // Remove temporary tags
      sess.exercises.forEach(e => delete e._exClass);
    });
  } else {
    workouts.forEach(sess => {
      sess.exercises.forEach(e => delete e._exClass);
    });
  }

  ctx.logs.push(`Constructed ${workouts.length} resistance workouts with Fatigue and Sequence rules.`);
  (ctx as any).generatedWorkouts = workouts;
}
