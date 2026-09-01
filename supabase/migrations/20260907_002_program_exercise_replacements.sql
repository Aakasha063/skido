-- phase 6 migration for substitution tracking
CREATE TABLE IF NOT EXISTS public.program_exercise_replacements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  program_exercise_id UUID REFERENCES public.program_exercises(id) ON DELETE CASCADE,
  original_exercise_id UUID REFERENCES public.exercises(id),
  replacement_exercise_id UUID REFERENCES public.exercises(id),
  reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
