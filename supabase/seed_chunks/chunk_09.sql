BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'dumbbell-pullover', 'Pullover', 'Dumbbell Pullover', ARRAY[]::TEXT[],
  NULL, NULL, NULL,
  ARRAY[]::TEXT[], ARRAY[]::TEXT[], ARRAY[]::TEXT[],
  ARRAY[]::TEXT[], NULL, NULL, 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'dumbbell-pullover'), 'beginner', 4,
                3, 3, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'glute-bridge-walkout', 'Glute Bridge', 'Glute Bridge Walkout', ARRAY[]::TEXT[],
  NULL, NULL, NULL,
  ARRAY[]::TEXT[], ARRAY[]::TEXT[], ARRAY[]::TEXT[],
  ARRAY[]::TEXT[], NULL, NULL, 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout'), 'hip-extension', FALSE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'glute-bridge-walkout'), 'beginner', 3,
                2, 1, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'doorframe-row', 'Row', 'Doorframe Bodyweight Row', ARRAY[]::TEXT[],
  NULL, NULL, NULL,
  ARRAY[]::TEXT[], ARRAY[]::TEXT[], ARRAY[]::TEXT[],
  ARRAY[]::TEXT[], NULL, NULL, 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'doorframe-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'doorframe-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'doorframe-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'doorframe-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'doorframe-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'doorframe-row'), 'beginner', 3,
                2, 1, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pike-push-up', 'Pike Push-Up', 'Pike Push-Up', ARRAY[]::TEXT[],
  NULL, NULL, NULL,
  ARRAY[]::TEXT[], ARRAY[]::TEXT[], ARRAY[]::TEXT[],
  ARRAY[]::TEXT[], NULL, NULL, 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pike-push-up'), 'anterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pike-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pike-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pike-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pike-push-up'), 'vertical-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pike-push-up'), 'intermediate', 4,
                3, 2, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

COMMIT;
