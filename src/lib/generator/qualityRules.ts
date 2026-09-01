import { GeneratorContext, ScoredExercise, AlgorithmVolumeDefault, GoalId } from './types';

export interface QualityIssue {
  ruleId: string;
  category: 'Volume' | 'Sequencing' | 'Fatigue' | 'Goal alignment' | 'Constraint safety' | 'Equipment';
  severity: 'info' | 'warning' | 'error';
  sessionIndex?: number;
  exerciseIds: string[];
  muscleIds?: string[];
  message: string;
  observedValue?: number;
  expectedRange?: [number, number];
}

export function evaluateProgramQuality(workouts: any[], ctx: GeneratorContext): QualityIssue[] {
  const issues: QualityIssue[] = [];

  const volumeDefault = ctx.algorithm.volume_defaults[ctx.profile.primaryGoalId];
  const [minSets, maxSets] = volumeDefault.sets_per_muscle_per_week;

  // Track weekly volume by muscle
  const weeklyVolume: Record<string, number> = {};

  // Rule: Equipment & Constraint Safety checks
  workouts.forEach((sess, sIdx) => {
    let hasCompound = false;
    let hasIsolation = false;
    let extremeFatigueCount = 0;
    const sessionHinges: string[] = [];

    sess.exercises.forEach((ex: any, eIdx: number) => {
      const dbEx = ctx.library.find(v => v.id === ex.exercise_id || v.slug === ex.slug);
      if (!dbEx) return;

      // 1. Equipment Check
      dbEx.equipmentIds.forEach(eq => {
        if (!ctx.profile.equipmentIds.includes(eq) && eq !== 'bodyweight') {
          issues.push({
            ruleId: 'EQUIP-001',
            category: 'Equipment',
            severity: 'error',
            sessionIndex: sIdx,
            exerciseIds: [ex.exercise_id],
            message: `Required equipment '${eq}' not available in profile.`,
          });
        }
      });

      // 2. Constraint Safety Check
      ctx.profile.constraints.forEach(c => {
        const compatibility = dbEx.constraints?.[c.constraintTypeId];
        if (compatibility === 'avoid') {
          issues.push({
            ruleId: 'SAFE-001',
            category: 'Constraint safety',
            severity: 'error',
            sessionIndex: sIdx,
            exerciseIds: [ex.exercise_id],
            message: `Violates 'avoid' constraint for ${c.constraintTypeId}.`,
          });
        }
      });

      // Track volume
      dbEx.muscles.forEach((m: any) => {
        const multiplier = m.role === 'primary' ? 1 : 0.5;
        weeklyVolume[m.muscleId] = (weeklyVolume[m.muscleId] || 0) + (ex.sets * multiplier);
      });

      // Sequencing and Fatigue
      const isIsolation = dbEx.movements.some((m: string) => m.includes('flexion') || m.includes('extension') || m.includes('abduction')) && dbEx.movements.length === 1;
      const isCompound = dbEx.movements.some((m: string) => m.includes('push') || m.includes('pull') || m.includes('squat') || m.includes('hinge'));
      const isHinge = dbEx.movements.some((m: string) => m.includes('hinge'));

      if (isIsolation) hasIsolation = true;
      if (isCompound) {
        hasCompound = true;
        if (hasIsolation) {
          issues.push({
            ruleId: 'SEQ-001',
            category: 'Sequencing',
            severity: 'warning',
            sessionIndex: sIdx,
            exerciseIds: [ex.exercise_id],
            message: `Compound movement '${dbEx.name}' placed after an isolation movement.`,
          });
        }
      }

      if (isHinge && dbEx.characteristics?.stimulus_to_fatigue <= 2) {
        sessionHinges.push(dbEx.name);
      }

      if (dbEx.characteristics?.stimulus_to_fatigue <= 2 && dbEx.characteristics?.difficulty_level === 'advanced') {
        extremeFatigueCount++;
      }
    });

    if (extremeFatigueCount > 2) {
      issues.push({
        ruleId: 'FATIGUE-001',
        category: 'Fatigue',
        severity: 'error',
        sessionIndex: sIdx,
        exerciseIds: sess.exercises.map((e: any) => e.exercise_id),
        message: `Too many extreme-fatigue generating movements stacked in one session.`,
        observedValue: extremeFatigueCount,
        expectedRange: [0, 2]
      });
    }

    if (sessionHinges.length > 1) {
      issues.push({
        ruleId: 'FATIGUE-003',
        category: 'Fatigue',
        severity: 'error',
        sessionIndex: sIdx,
        exerciseIds: sess.exercises.filter((e: any) => sessionHinges.includes(e.name)).map((e: any) => e.exercise_id),
        message: `Two high-systemic-fatigue hip-hinge movements are programmed consecutively.`,
        observedValue: sessionHinges.length,
        expectedRange: [0, 1]
      });
    }
  });

  // Goal-based Volume Checks
  const majorMuscles = ['pectoralis-major', 'latissimus-dorsi', 'quadriceps', 'hamstrings', 'gluteus-maximus', 'anterior-deltoid'];
  
  majorMuscles.forEach(m => {
    const vol = weeklyVolume[m] || 0;
    if (vol > 0 && vol < minSets) {
      issues.push({
        ruleId: 'VOL-001',
        category: 'Volume',
        severity: 'warning',
        exerciseIds: [],
        muscleIds: [m],
        message: `Weekly sets for ${m} is below the minimum threshold.`,
        observedValue: vol,
        expectedRange: [minSets, maxSets]
      });
    } else if (vol > maxSets) {
      issues.push({
        ruleId: 'VOL-002',
        category: 'Volume',
        severity: 'warning',
        exerciseIds: [],
        muscleIds: [m],
        message: `Weekly sets for ${m} is above the maximum threshold (MRV).`,
        observedValue: vol,
        expectedRange: [minSets, maxSets]
      });
    }
  });

  return issues;
}
