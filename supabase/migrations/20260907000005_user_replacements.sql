DROP TABLE IF EXISTS public.program_exercise_replacements;

CREATE TABLE IF NOT EXISTS public.user_exercise_replacements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  workout_exercise_id UUID NOT NULL REFERENCES public.workout_exercises(id) ON DELETE CASCADE,
  original_exercise_id UUID NOT NULL REFERENCES public.exercises(id),
  replacement_exercise_id UUID NOT NULL REFERENCES public.exercises(id),
  reason TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, workout_exercise_id)
);

-- RLS
ALTER TABLE public.user_exercise_replacements ENABLE ROW LEVEL SECURITY;

CREATE POLICY "user_exercise_replacements readable" ON public.user_exercise_replacements
  FOR SELECT TO authenticated, anon
  USING (user_id = auth.uid());

CREATE POLICY "user_exercise_replacements insertable" ON public.user_exercise_replacements
  FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "user_exercise_replacements updatable" ON public.user_exercise_replacements
  FOR UPDATE TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "user_exercise_replacements deletable" ON public.user_exercise_replacements
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());
