-- Indexes for the lookups the workout screen makes on every open/resume.
-- Each of these filters previously required a full table scan that grows with every logged set.
CREATE INDEX IF NOT EXISTS idx_sets_exercise_session ON public.sets (exercise_session_id, set_number);
CREATE INDEX IF NOT EXISTS idx_exercise_sessions_session ON public.exercise_sessions (session_id);
CREATE INDEX IF NOT EXISTS idx_workout_exercises_day ON public.workout_exercises (day_id, "position");
CREATE INDEX IF NOT EXISTS idx_workout_sessions_user_day ON public.workout_sessions (user_id, day_id, session_date DESC);
CREATE INDEX IF NOT EXISTS idx_workout_days_template ON public.workout_days (template_id, sort_order);
