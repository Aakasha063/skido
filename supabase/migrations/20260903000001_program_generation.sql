-- 5. Program-generation tables
-- 20260903_001 Create generated_programs, program_phases, program_workouts, program_exercises, program_exercise_sets

CREATE TABLE public.generated_programs (
  id                   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id           UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  algorithm_version_id TEXT NOT NULL REFERENCES public.programming_algorithm_versions(id),
  generation_snapshot  JSONB NOT NULL,
  name                 TEXT NOT NULL,
  primary_goal_id      TEXT NOT NULL REFERENCES public.goals(id),
  secondary_goal_id    TEXT REFERENCES public.goals(id),
  status               TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','completed','abandoned')),
  created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.generated_programs TO authenticated;
GRANT ALL ON public.generated_programs TO service_role;
ALTER TABLE public.generated_programs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own generated_programs" ON public.generated_programs
  FOR ALL TO authenticated USING (auth.uid() = profile_id) WITH CHECK (auth.uid() = profile_id);

CREATE TRIGGER trg_gen_prog_updated BEFORE UPDATE ON public.generated_programs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE TABLE public.program_phases (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  program_id          UUID NOT NULL REFERENCES public.generated_programs(id) ON DELETE CASCADE,
  phase_number        SMALLINT NOT NULL,
  name                TEXT NOT NULL,
  weeks_duration      SMALLINT NOT NULL,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (program_id, phase_number)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.program_phases TO authenticated;
GRANT ALL ON public.program_phases TO service_role;
ALTER TABLE public.program_phases ENABLE ROW LEVEL SECURITY;
-- RLS through generated_programs for simplicity, or define direct
CREATE POLICY "own program_phases" ON public.program_phases
  FOR ALL TO authenticated USING (
    EXISTS (SELECT 1 FROM public.generated_programs p WHERE p.id = program_phases.program_id AND p.profile_id = auth.uid())
  )
  WITH CHECK (
    EXISTS (SELECT 1 FROM public.generated_programs p WHERE p.id = program_phases.program_id AND p.profile_id = auth.uid())
  );

CREATE TABLE public.program_workouts (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  phase_id            UUID NOT NULL REFERENCES public.program_phases(id) ON DELETE CASCADE,
  day_number          SMALLINT NOT NULL,
  name                TEXT NOT NULL,
  focus_type          TEXT,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (phase_id, day_number)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.program_workouts TO authenticated;
GRANT ALL ON public.program_workouts TO service_role;
ALTER TABLE public.program_workouts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own program_workouts" ON public.program_workouts
  FOR ALL TO authenticated USING (
    EXISTS (SELECT 1 FROM public.program_phases ph JOIN public.generated_programs p ON ph.program_id = p.id WHERE ph.id = program_workouts.phase_id AND p.profile_id = auth.uid())
  );

CREATE TABLE public.program_exercises (
  id                        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  workout_id                UUID NOT NULL REFERENCES public.program_workouts(id) ON DELETE CASCADE,
  exercise_id               UUID NOT NULL REFERENCES public.exercises(id),
  order_in_workout          SMALLINT NOT NULL,
  sets                      SMALLINT,
  rep_min                   SMALLINT,
  rep_max                   SMALLINT,
  rpe_target                NUMERIC,
  rest_seconds              SMALLINT,
  progression_rule_id       UUID REFERENCES public.progression_rules(id),
  progression_rule_snapshot JSONB,
  notes                     TEXT,
  created_at                TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (workout_id, order_in_workout)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.program_exercises TO authenticated;
GRANT ALL ON public.program_exercises TO service_role;
ALTER TABLE public.program_exercises ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own program_exercises" ON public.program_exercises
  FOR ALL TO authenticated USING (
    EXISTS (SELECT 1 FROM public.program_workouts pw JOIN public.program_phases ph ON pw.phase_id = ph.id JOIN public.generated_programs p ON ph.program_id = p.id WHERE pw.id = program_exercises.workout_id AND p.profile_id = auth.uid())
  );

CREATE TABLE public.program_exercise_sets (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  program_exercise_id UUID NOT NULL REFERENCES public.program_exercises(id) ON DELETE CASCADE,
  set_number          SMALLINT NOT NULL,
  rep_min             SMALLINT,
  rep_max             SMALLINT,
  rpe_target          NUMERIC,
  load_target_kg      NUMERIC,
  load_target_pct_1rm NUMERIC,
  rest_seconds        SMALLINT,
  notes               TEXT,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (program_exercise_id, set_number)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.program_exercise_sets TO authenticated;
GRANT ALL ON public.program_exercise_sets TO service_role;
ALTER TABLE public.program_exercise_sets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own program_exercise_sets" ON public.program_exercise_sets
  FOR ALL TO authenticated USING (
    EXISTS (SELECT 1 FROM public.program_exercises pe JOIN public.program_workouts pw ON pe.workout_id = pw.id JOIN public.program_phases ph ON pw.phase_id = ph.id JOIN public.generated_programs p ON ph.program_id = p.id WHERE pe.id = program_exercise_sets.program_exercise_id AND p.profile_id = auth.uid())
  );
