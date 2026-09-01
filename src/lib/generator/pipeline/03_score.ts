import { GeneratorContext, ScoredExercise } from '../types';

/**
 * Stage 3: Scoring & Ranking
 * 
 * Applies soft penalties/bonuses based on goal suitability,
 * experience level match, and active constraints ('caution').
 */
export function executeScoring(ctx: GeneratorContext): void {
  ctx.logs.push('--- Stage 3: Scoring & Ranking ---');
  
  const w = ctx.algorithm.weights;
  
  const scored: ScoredExercise[] = ctx.hardFiltered.map(ex => {
    let score = 0;
    const scoreBreakdown: Record<string, number> = {};
    const selectedBecause: string[] = [];

    // 1. Primary Goal Suitability
    const primarySuitability = ex.goalScores[ctx.profile.primaryGoalId] || 5;
    const primaryPoints = primarySuitability * w.primary_goal_suitability;
    score += primaryPoints;
    scoreBreakdown['Primary Goal Suitability'] = primaryPoints;
    if (primarySuitability >= 7) {
      selectedBecause.push(`High suitability (${primarySuitability}/10) for ${ctx.profile.primaryGoalId}`);
    }

    // 2. Secondary Goal Suitability
    if (ctx.profile.secondaryGoalId) {
      const secSuitability = ex.goalScores[ctx.profile.secondaryGoalId] || 5;
      const secPoints = secSuitability * w.secondary_goal_suitability;
      score += secPoints;
      scoreBreakdown['Secondary Goal Suitability'] = secPoints;
    }

    // 3. Experience Match
    if (ex.characteristics.difficulty_level === ctx.profile.experienceLevel) {
      score += w.experience_match;
      scoreBreakdown['Experience Match'] = w.experience_match;
      selectedBecause.push('Matches your experience level');
    } else if (
        ctx.profile.experienceLevel === 'beginner' && 
        ex.characteristics.difficulty_level === 'advanced'
    ) {
      // Beginners shouldn't get advanced exercises, apply severe penalty
      score -= (w.experience_match * 5);
      scoreBreakdown['Experience Penalty (Too Advanced)'] = -(w.experience_match * 5);
    }

    // 4. Caution Constraints (Soft Penalty)
    for (const userConstraint of ctx.profile.constraints) {
      const comp = ex.constraints[userConstraint.constraintTypeId];
      if (comp === 'caution') {
        score += w.caution_penalty;
        scoreBreakdown[`Caution: ${userConstraint.constraintTypeId}`] = w.caution_penalty;
        selectedBecause.push(`Caution advised due to ${userConstraint.constraintTypeId}`);
      }
    }

    // Default formatting for output precision
    score = Math.round(score * 100) / 100;

    return {
      ...ex,
      score,
      scoreBreakdown,
      selectedBecause
    };
  });

  // Sort descending by score
  scored.sort((a, b) => b.score - a.score);

  ctx.rankedPool = scored;
  ctx.logs.push(`Scored ${scored.length} exercises. Top score: ${scored[0]?.score ?? 0}`);
}
