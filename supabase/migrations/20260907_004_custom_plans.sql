-- Migration to add support for Custom Plans

ALTER TABLE public.workout_days 
  ADD COLUMN IF NOT EXISTS is_custom BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id);

-- Update RLS for workout_days
-- Previously it might have been readable by all authenticated. We need to allow users to insert their own.

DROP POLICY IF EXISTS "workout_days readable" ON public.workout_days;
CREATE POLICY "workout_days readable" ON public.workout_days
  FOR SELECT TO authenticated, anon
  USING (
    user_id IS NULL OR user_id = auth.uid()
  );

CREATE POLICY "workout_days insertable" ON public.workout_days
  FOR INSERT TO authenticated
  WITH CHECK (
    user_id = auth.uid() AND is_custom = true
  );

CREATE POLICY "workout_days updatable" ON public.workout_days
  FOR UPDATE TO authenticated
  USING (user_id = auth.uid());

CREATE POLICY "workout_days deletable" ON public.workout_days
  FOR DELETE TO authenticated
  USING (user_id = auth.uid());

-- Update RLS for workout_exercises
-- We need to ensure users can add exercises to their custom plans.

DROP POLICY IF EXISTS "workout_exercises readable" ON public.workout_exercises;
CREATE POLICY "workout_exercises readable" ON public.workout_exercises
  FOR SELECT TO authenticated, anon
  USING (
    EXISTS (
      SELECT 1 FROM public.workout_days d
      WHERE d.id = workout_exercises.day_id
        AND (d.user_id IS NULL OR d.user_id = auth.uid())
    )
  );

CREATE POLICY "workout_exercises insertable" ON public.workout_exercises
  FOR INSERT TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.workout_days d
      WHERE d.id = workout_exercises.day_id
        AND d.user_id = auth.uid()
    )
  );

CREATE POLICY "workout_exercises updatable" ON public.workout_exercises
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.workout_days d
      WHERE d.id = workout_exercises.day_id
        AND d.user_id = auth.uid()
    )
  );

CREATE POLICY "workout_exercises deletable" ON public.workout_exercises
  FOR DELETE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.workout_days d
      WHERE d.id = workout_exercises.day_id
        AND d.user_id = auth.uid()
    )
  );
