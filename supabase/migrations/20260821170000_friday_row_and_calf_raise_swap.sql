BEGIN;

-- 1. Create the two new exercises.
INSERT INTO public.exercises (
  slug, name, primary_muscle, secondary_muscles, category, equipment,
  setup, execution, breathing, cues, common_mistakes, should_feel,
  lower_back_notes, default_rest_seconds, default_rir, default_rep_range, is_compound
) VALUES (
  'wide-grip-chest-supported-row', 'Wide-Grip Chest-Supported Row', 'Mid back',
  ARRAY['Lats','Rear delts','Biceps'], 'pull', 'Machine',
  ARRAY['Chest firmly on the pad, feet planted.', 'Take a wide, pronated grip on the handles.'],
  ARRAY['Row the handles toward the lower ribs, elbows flared slightly wider than a standard grip.', 'Pause briefly, then let the weight stretch the back.'],
  'Exhale as you row.',
  ARRAY['Chest stays glued to the pad.', 'Drive through the elbows wide to bias the rear delts and upper back.'],
  ARRAY['Peeling off the pad to cheat weight up.', 'Shrugging at the top.', 'Grip too wide to control — stay wide but manageable.'],
  'Squeeze across the upper back and rear delts, more than a standard-grip row.',
  'Chest support keeps the lower back out of it - keep it that way.',
  120, '1-2', '8-12', true
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO public.exercises (
  slug, name, primary_muscle, secondary_muscles, category, equipment,
  setup, execution, breathing, cues, common_mistakes, should_feel,
  lower_back_notes, default_rest_seconds, default_rir, default_rep_range, is_compound
) VALUES (
  'seated-calf-raise', 'Seated Calf Raise', 'Calves',
  ARRAY[]::text[], 'legs', 'Machine',
  ARRAY['Sit with knees bent under the pad, balls of the feet on the platform.', 'Knees stay bent roughly 90 degrees throughout.'],
  ARRAY['Rise as high as possible onto the toes.', 'Lower into a deep stretch and pause.'],
  'Exhale as you rise.',
  ARRAY['Pause 1 second at both ends.', 'The bent-knee position shifts emphasis onto the soleus.'],
  ARRAY['Short, bouncy reps.', 'Letting the knees drift straight, turning it into a standing raise.'],
  'A strong stretch and cramp-like contraction deep in the calf, more soleus-biased than standing raises.',
  NULL, 75, '0-1', '12-15', false
) ON CONFLICT (slug) DO NOTHING;

-- 2. Point Friday's two plan slots at the new exercises (same workout_exercises row —
--    keeps set/rep/rest targets and, crucially, keeps every exercise_sessions row's
--    workout_exercise_id FK valid, since that column SET NULLs on delete).
UPDATE public.workout_exercises
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-row')
WHERE id = '131fefbe-cb8d-484b-a653-82a71e5fc674';

UPDATE public.workout_exercises
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'seated-calf-raise')
WHERE id = '8dca3ca3-89c6-46b1-bc87-bd57073c7452';

-- 3. Re-attribute every existing exercise_sessions row logged against Friday's two
--    slots specifically (scoped by workout_exercise_id, so Tuesday/Wednesday/
--    Saturday-Back's rows for the old exercises are untouched).
UPDATE public.exercise_sessions
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-row')
WHERE workout_exercise_id = '131fefbe-cb8d-484b-a653-82a71e5fc674';

UPDATE public.exercise_sessions
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'seated-calf-raise')
WHERE workout_exercise_id = '8dca3ca3-89c6-46b1-bc87-bd57073c7452';

-- 4. Re-attribute every logged set under those same Friday exercise_sessions rows,
--    so Progress/History correctly show this history under the new exercise.
UPDATE public.sets
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-row')
WHERE exercise_session_id IN (
  SELECT id FROM public.exercise_sessions WHERE workout_exercise_id = '131fefbe-cb8d-484b-a653-82a71e5fc674'
);

UPDATE public.sets
SET exercise_id = (SELECT id FROM public.exercises WHERE slug = 'seated-calf-raise')
WHERE exercise_session_id IN (
  SELECT id FROM public.exercise_sessions WHERE workout_exercise_id = '8dca3ca3-89c6-46b1-bc87-bd57073c7452'
);

COMMIT;
