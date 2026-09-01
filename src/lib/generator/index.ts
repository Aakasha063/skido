import { GeneratorContext } from './types';
import { executeHardFilter } from './pipeline/02_filter';
import { executeScoring } from './pipeline/03_score';
import { executeAllocation } from './pipeline/04_allocate';
import { executeConstruction } from './pipeline/05_construct';

/**
 * Deterministic Generator Orchestrator
 */
export function generateProgram(ctx: GeneratorContext): any {
  // Stage 1: Context is passed in from DB fetch (simulated in our tests)
  ctx.logs.push('--- Stage 1: Context Loaded ---');
  ctx.logs.push(`Profile: ${ctx.profile.primaryGoalId} | Exp: ${ctx.profile.experienceLevel} | Days: ${ctx.profile.daysAvailablePerWeek}`);

  // Stage 2: Hard Constraint Filter
  executeHardFilter(ctx);

  if (ctx.hardFiltered.length === 0) {
    ctx.logs.push('FAILED: No suitable exercises exist after hard filtering.');
    return {
      status: 'failed',
      reason: 'Insufficient exercise library to satisfy constraints.',
      logs: ctx.logs
    };
  }

  // Stage 3: Soft Scoring
  executeScoring(ctx);

  // Stage 4: Allocation & Movement Coverage
  executeAllocation(ctx);

  // Stage 5: Session Construction
  executeConstruction(ctx);

  // Validation Check
  // E.g., user wants hypertrophy but session duration is 20 min and we need 5 exercises.
  if (ctx.profile.sessionDurationTarget && ctx.profile.sessionDurationTarget < 30) {
    if (ctx.profile.primaryGoalId === 'hypertrophy' || ctx.profile.primaryGoalId === 'strength') {
      ctx.logs.push('WARNING: Session duration constraint too short for optimal volume.');
      // We could fail here if strictly enforcing, but we'll degrade gracefully.
    }
  }

  return {
    status: 'success',
    workouts: (ctx as any).generatedWorkouts,
    logs: ctx.logs
  };
}
