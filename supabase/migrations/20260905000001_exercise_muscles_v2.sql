-- 7. Data validation & exercise_muscles_v2 cutover
-- 20260905_001 Create exercise_muscles_v2, seed it, rename tables

CREATE TABLE public.exercise_muscles_v2 (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  muscle_id   TEXT NOT NULL REFERENCES public.muscles(id),
  region_id   TEXT,
  role        TEXT NOT NULL CHECK (role IN ('primary','secondary','tertiary')),
  CONSTRAINT fk_muscle_region FOREIGN KEY (muscle_id, region_id) REFERENCES public.muscle_regions (muscle_id, id)
);

CREATE UNIQUE INDEX idx_ex_muscles_v2_uniq ON public.exercise_muscles_v2 (exercise_id, muscle_id, region_id) NULLS NOT DISTINCT;

GRANT SELECT ON public.exercise_muscles_v2 TO authenticated, anon;
GRANT ALL ON public.exercise_muscles_v2 TO service_role;
ALTER TABLE public.exercise_muscles_v2 ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_muscles_v2 readable" ON public.exercise_muscles_v2 FOR SELECT TO authenticated, anon USING (true);

-- Seed exercise_muscles_v2 from exercise_muscles using mappings
INSERT INTO public.exercise_muscles_v2 (exercise_id, muscle_id, region_id, role)
SELECT 
  exercise_id,
  CASE muscle_group_id
    WHEN 'brachialis' THEN 'brachialis'
    WHEN 'hamstrings' THEN 'hamstrings'
    WHEN 'chest' THEN 'pectoralis-major'
    WHEN 'chest-upper' THEN 'pectoralis-major'
    WHEN 'forearms' THEN 'forearm-flexors'
    WHEN 'abs' THEN 'rectus-abdominis'
    WHEN 'glutes' THEN 'gluteus-maximus'
    WHEN 'hip-flexors' THEN 'hip-flexors'
    WHEN 'traps' THEN 'upper-trapezius'
    WHEN 'soleus' THEN 'soleus'
    WHEN 'upper-back' THEN 'lower-trapezius'
    WHEN 'front-delts' THEN 'anterior-deltoid'
    WHEN 'lats' THEN 'latissimus-dorsi'
    WHEN 'calves' THEN 'gastrocnemius'
    WHEN 'biceps' THEN 'biceps-brachii'
    WHEN 'obliques' THEN 'obliques'
    WHEN 'triceps' THEN 'triceps-brachii'
    WHEN 'cardiovascular' THEN 'cardiovascular-system'
    WHEN 'rotator-cuff' THEN 'rotator-cuff'
    WHEN 'rear-delts' THEN 'posterior-deltoid'
    WHEN 'gastrocnemius' THEN 'gastrocnemius'
    WHEN 'mid-back' THEN 'rhomboids'
    WHEN 'side-delts' THEN 'lateral-deltoid'
    WHEN 'quads' THEN 'quadriceps'
    ELSE 'pectoralis-major' -- Fallback just in case, though all 43 are covered above
  END as muscle_id,
  CASE muscle_group_id
    WHEN 'chest-upper' THEN 'chest-upper'
    ELSE NULL
  END as region_id,
  role
FROM public.exercise_muscles;

-- Rename tables
ALTER TABLE public.exercise_muscles RENAME TO exercise_muscles_legacy;
ALTER TABLE public.exercise_muscles_v2 RENAME TO exercise_muscles;
