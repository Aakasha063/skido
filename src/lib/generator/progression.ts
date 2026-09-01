export interface PerformanceSet {
  reps: number;
  rpe: number;
}

export interface ProgressionTarget {
  sets: number;
  repMin: number;
  repMax: number;
  rpeTarget: number;
  loadTargetKg: number;
}

/**
 * Stage 2: Feedback / Progression Loop
 * Simulates evaluating performance against target and determining next session load.
 */
export function evaluateDoubleProgression(
  target: ProgressionTarget,
  actualSets: PerformanceSet[],
  incrementKg: number
): { progressed: boolean; nextTarget: ProgressionTarget; logs: string[] } {
  const logs: string[] = [];
  logs.push(`Evaluating Progression: Target ${target.sets}x${target.repMin}-${target.repMax} @ RPE ${target.rpeTarget} (${target.loadTargetKg}kg)`);
  
  // Did they complete all sets?
  if (actualSets.length < target.sets) {
    logs.push(`Failed: Only completed ${actualSets.length} sets out of ${target.sets}.`);
    return { progressed: false, nextTarget: target, logs };
  }

  let allHitMax = true;
  let excessiveRpe = false;

  for (let i = 0; i < actualSets.length; i++) {
    const s = actualSets[i];
    logs.push(` Set ${i+1}: ${s.reps} reps @ RPE ${s.rpe}`);
    if (s.reps < target.repMax) {
      allHitMax = false;
    }
    // If RPE was massively higher than target, we don't count it as a clean max out
    if (s.rpe > target.rpeTarget + 1.5) {
      excessiveRpe = true;
    }
  }

  if (allHitMax && !excessiveRpe) {
    logs.push(`Success! All sets hit ${target.repMax} reps cleanly. Progressing load.`);
    return {
      progressed: true,
      nextTarget: {
        ...target,
        loadTargetKg: target.loadTargetKg + incrementKg
      },
      logs
    };
  } else {
    logs.push(allHitMax ? `Hit reps, but RPE was excessive. Holding load.` : `Did not hit ${target.repMax} reps on all sets. Holding load.`);
    return {
      progressed: false,
      nextTarget: target,
      logs
    };
  }
}
