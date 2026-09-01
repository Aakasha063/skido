BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-machine-lateral-raise', 'Lateral Raise', 'Slow Eccentric Machine Lateral Raise', ARRAY['Lateral Raise', 'Slow Eccentric Machine Lateral Raise']::TEXT[],
  'tempo', 'lateral-raise', 'Slow Eccentric Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-machine-lateral-raise', 'Lateral Raise', '1.5 Rep Machine Lateral Raise', ARRAY['Lateral Raise', '1.5 Rep Machine Lateral Raise']::TEXT[],
  'tempo', 'lateral-raise', '1.5 Rep Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-machine-lateral-raise', 'Lateral Raise', 'Single-Arm Machine Lateral Raise', ARRAY['Lateral Raise', 'Single-Arm Machine Lateral Raise']::TEXT[],
  'unilateral', 'lateral-raise', 'Single-Arm Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-machine-lateral-raise', 'Lateral Raise', 'Single-Leg Machine Lateral Raise', ARRAY['Lateral Raise', 'Single-Leg Machine Lateral Raise']::TEXT[],
  'unilateral', 'lateral-raise', 'Single-Leg Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-machine-lateral-raise', 'Lateral Raise', 'Alternating Machine Lateral Raise', ARRAY['Lateral Raise', 'Alternating Machine Lateral Raise']::TEXT[],
  'unilateral', 'lateral-raise', 'Alternating Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-machine-lateral-raise', 'Lateral Raise', 'Half-Kneeling Machine Lateral Raise', ARRAY['Lateral Raise', 'Half-Kneeling Machine Lateral Raise']::TEXT[],
  'stance', 'lateral-raise', 'Half-Kneeling Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-machine-lateral-raise', 'Lateral Raise', 'Tall-Kneeling Machine Lateral Raise', ARRAY['Lateral Raise', 'Tall-Kneeling Machine Lateral Raise']::TEXT[],
  'stance', 'lateral-raise', 'Tall-Kneeling Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-machine-lateral-raise', 'Lateral Raise', 'Split-Stance Machine Lateral Raise', ARRAY['Lateral Raise', 'Split-Stance Machine Lateral Raise']::TEXT[],
  'stance', 'lateral-raise', 'Split-Stance Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-machine-lateral-raise', 'Lateral Raise', 'Close-Grip Machine Lateral Raise', ARRAY['Lateral Raise', 'Close-Grip Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Close-Grip Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-machine-lateral-raise', 'Lateral Raise', 'Neutral-Grip Machine Lateral Raise', ARRAY['Lateral Raise', 'Neutral-Grip Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Neutral-Grip Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'wide-grip-machine-lateral-raise', 'Lateral Raise', 'Wide-Grip Machine Lateral Raise', ARRAY['Lateral Raise', 'Wide-Grip Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Wide-Grip Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'underhand-machine-lateral-raise', 'Lateral Raise', 'Underhand Machine Lateral Raise', ARRAY['Lateral Raise', 'Underhand Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Underhand Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'overhand-machine-lateral-raise', 'Lateral Raise', 'Overhand Machine Lateral Raise', ARRAY['Lateral Raise', 'Overhand Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Overhand Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'pronated-machine-lateral-raise', 'Lateral Raise', 'Pronated Machine Lateral Raise', ARRAY['Lateral Raise', 'Pronated Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Pronated Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'supinated-machine-lateral-raise', 'Lateral Raise', 'Supinated Machine Lateral Raise', ARRAY['Lateral Raise', 'Supinated Machine Lateral Raise']::TEXT[],
  'grip', 'lateral-raise', 'Supinated Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'incline-machine-lateral-raise', 'Lateral Raise', 'Incline Machine Lateral Raise', ARRAY['Lateral Raise', 'Incline Machine Lateral Raise']::TEXT[],
  'angle', 'lateral-raise', 'Incline Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'decline-machine-lateral-raise', 'Lateral Raise', 'Decline Machine Lateral Raise', ARRAY['Lateral Raise', 'Decline Machine Lateral Raise']::TEXT[],
  'angle', 'lateral-raise', 'Decline Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'long-rom-machine-lateral-raise', 'Lateral Raise', 'Long-ROM Machine Lateral Raise', ARRAY['Lateral Raise', 'Long-ROM Machine Lateral Raise']::TEXT[],
  'angle', 'lateral-raise', 'Long-ROM Machine Lateral Raise is a standardized exercise variation derived from the Lateral Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-lateral-raise'), 'lateral-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-lateral-raise') AND muscle_id = 'lateral-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-lateral-raise'), 'shoulder-abduction', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-lateral-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-lateral-raise'), 'beginner', 3,
                3, 4, FALSE,
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
  'paused-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Paused Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Paused Rear-Delt Dumbbell Fly']::TEXT[],
  'tempo', 'rear-delt-fly', 'Paused Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'tempo-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Tempo Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Tempo Rear-Delt Dumbbell Fly']::TEXT[],
  'tempo', 'rear-delt-fly', 'Tempo Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'slow-eccentric-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Slow Eccentric Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Slow Eccentric Rear-Delt Dumbbell Fly']::TEXT[],
  'tempo', 'rear-delt-fly', 'Slow Eccentric Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-rear-delt-dumbbell-fly', 'Rear-Delt Fly', '1.5 Rep Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', '1.5 Rep Rear-Delt Dumbbell Fly']::TEXT[],
  'tempo', 'rear-delt-fly', '1.5 Rep Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Single-Arm Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Single-Arm Rear-Delt Dumbbell Fly']::TEXT[],
  'unilateral', 'rear-delt-fly', 'Single-Arm Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Single-Leg Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Single-Leg Rear-Delt Dumbbell Fly']::TEXT[],
  'unilateral', 'rear-delt-fly', 'Single-Leg Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Alternating Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Alternating Rear-Delt Dumbbell Fly']::TEXT[],
  'unilateral', 'rear-delt-fly', 'Alternating Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Half-Kneeling Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Half-Kneeling Rear-Delt Dumbbell Fly']::TEXT[],
  'stance', 'rear-delt-fly', 'Half-Kneeling Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Tall-Kneeling Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Tall-Kneeling Rear-Delt Dumbbell Fly']::TEXT[],
  'stance', 'rear-delt-fly', 'Tall-Kneeling Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Split-Stance Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Split-Stance Rear-Delt Dumbbell Fly']::TEXT[],
  'stance', 'rear-delt-fly', 'Split-Stance Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Close-Grip Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Close-Grip Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Close-Grip Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Neutral-Grip Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Neutral-Grip Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Neutral-Grip Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'wide-grip-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Wide-Grip Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Wide-Grip Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Wide-Grip Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'underhand-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Underhand Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Underhand Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Underhand Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'overhand-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Overhand Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Overhand Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Overhand Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'pronated-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Pronated Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Pronated Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Pronated Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'supinated-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Supinated Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Supinated Rear-Delt Dumbbell Fly']::TEXT[],
  'grip', 'rear-delt-fly', 'Supinated Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'incline-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Incline Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Incline Rear-Delt Dumbbell Fly']::TEXT[],
  'angle', 'rear-delt-fly', 'Incline Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'decline-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Decline Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Decline Rear-Delt Dumbbell Fly']::TEXT[],
  'angle', 'rear-delt-fly', 'Decline Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'long-rom-rear-delt-dumbbell-fly', 'Rear-Delt Fly', 'Long-ROM Rear-Delt Dumbbell Fly', ARRAY['Rear-Delt Fly', 'Long-ROM Rear-Delt Dumbbell Fly']::TEXT[],
  'angle', 'rear-delt-fly', 'Long-ROM Rear-Delt Dumbbell Fly is a standardized exercise variation derived from the Rear-Delt Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-rear-delt-dumbbell-fly'), 'beginner', 3,
                3, 4, FALSE,
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
  'paused-cable-face-pull', 'Face Pull', 'Paused Cable Face Pull', ARRAY['Face Pull', 'Paused Cable Face Pull']::TEXT[],
  'tempo', 'face-pull', 'Paused Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'tempo-cable-face-pull', 'Face Pull', 'Tempo Cable Face Pull', ARRAY['Face Pull', 'Tempo Cable Face Pull']::TEXT[],
  'tempo', 'face-pull', 'Tempo Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'slow-eccentric-cable-face-pull', 'Face Pull', 'Slow Eccentric Cable Face Pull', ARRAY['Face Pull', 'Slow Eccentric Cable Face Pull']::TEXT[],
  'tempo', 'face-pull', 'Slow Eccentric Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-cable-face-pull', 'Face Pull', '1.5 Rep Cable Face Pull', ARRAY['Face Pull', '1.5 Rep Cable Face Pull']::TEXT[],
  'tempo', 'face-pull', '1.5 Rep Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-cable-face-pull', 'Face Pull', 'Single-Arm Cable Face Pull', ARRAY['Face Pull', 'Single-Arm Cable Face Pull']::TEXT[],
  'unilateral', 'face-pull', 'Single-Arm Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-cable-face-pull', 'Face Pull', 'Single-Leg Cable Face Pull', ARRAY['Face Pull', 'Single-Leg Cable Face Pull']::TEXT[],
  'unilateral', 'face-pull', 'Single-Leg Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-cable-face-pull', 'Face Pull', 'Alternating Cable Face Pull', ARRAY['Face Pull', 'Alternating Cable Face Pull']::TEXT[],
  'unilateral', 'face-pull', 'Alternating Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-cable-face-pull', 'Face Pull', 'Half-Kneeling Cable Face Pull', ARRAY['Face Pull', 'Half-Kneeling Cable Face Pull']::TEXT[],
  'stance', 'face-pull', 'Half-Kneeling Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-cable-face-pull', 'Face Pull', 'Tall-Kneeling Cable Face Pull', ARRAY['Face Pull', 'Tall-Kneeling Cable Face Pull']::TEXT[],
  'stance', 'face-pull', 'Tall-Kneeling Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-cable-face-pull', 'Face Pull', 'Split-Stance Cable Face Pull', ARRAY['Face Pull', 'Split-Stance Cable Face Pull']::TEXT[],
  'stance', 'face-pull', 'Split-Stance Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-cable-face-pull', 'Face Pull', 'Close-Grip Cable Face Pull', ARRAY['Face Pull', 'Close-Grip Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Close-Grip Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-cable-face-pull', 'Face Pull', 'Neutral-Grip Cable Face Pull', ARRAY['Face Pull', 'Neutral-Grip Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Neutral-Grip Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'wide-grip-cable-face-pull', 'Face Pull', 'Wide-Grip Cable Face Pull', ARRAY['Face Pull', 'Wide-Grip Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Wide-Grip Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'underhand-cable-face-pull', 'Face Pull', 'Underhand Cable Face Pull', ARRAY['Face Pull', 'Underhand Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Underhand Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'overhand-cable-face-pull', 'Face Pull', 'Overhand Cable Face Pull', ARRAY['Face Pull', 'Overhand Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Overhand Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'pronated-cable-face-pull', 'Face Pull', 'Pronated Cable Face Pull', ARRAY['Face Pull', 'Pronated Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Pronated Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'supinated-cable-face-pull', 'Face Pull', 'Supinated Cable Face Pull', ARRAY['Face Pull', 'Supinated Cable Face Pull']::TEXT[],
  'grip', 'face-pull', 'Supinated Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'incline-cable-face-pull', 'Face Pull', 'Incline Cable Face Pull', ARRAY['Face Pull', 'Incline Cable Face Pull']::TEXT[],
  'angle', 'face-pull', 'Incline Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'decline-cable-face-pull', 'Face Pull', 'Decline Cable Face Pull', ARRAY['Face Pull', 'Decline Cable Face Pull']::TEXT[],
  'angle', 'face-pull', 'Decline Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'long-rom-cable-face-pull', 'Face Pull', 'Long-ROM Cable Face Pull', ARRAY['Face Pull', 'Long-ROM Cable Face Pull']::TEXT[],
  'angle', 'face-pull', 'Long-ROM Cable Face Pull is a standardized exercise variation derived from the Face Pull movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'posterior-deltoid', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull') AND muscle_id = 'posterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'upper-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull') AND muscle_id = 'upper-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'rotator-cuff', NULL, 'tertiary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull') AND muscle_id = 'rotator-cuff'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-cable-face-pull'), 'beginner', 3,
                3, 4, FALSE,
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
  'paused-pull-up', 'Pull-Up', 'Paused Pull-Up', ARRAY['Pull-Up', 'Paused Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Paused Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'tempo-pull-up', 'Pull-Up', 'Tempo Pull-Up', ARRAY['Pull-Up', 'Tempo Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Tempo Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'slow-eccentric-pull-up', 'Pull-Up', 'Slow Eccentric Pull-Up', ARRAY['Pull-Up', 'Slow Eccentric Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Slow Eccentric Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  '1-5-rep-pull-up', 'Pull-Up', '1.5 Rep Pull-Up', ARRAY['Pull-Up', '1.5 Rep Pull-Up']::TEXT[],
  'tempo', 'pull-up', '1.5 Rep Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'single-arm-pull-up', 'Pull-Up', 'Single-Arm Pull-Up', ARRAY['Pull-Up', 'Single-Arm Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Arm Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'single-leg-pull-up', 'Pull-Up', 'Single-Leg Pull-Up', ARRAY['Pull-Up', 'Single-Leg Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Leg Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'alternating-pull-up', 'Pull-Up', 'Alternating Pull-Up', ARRAY['Pull-Up', 'Alternating Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Alternating Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'half-kneeling-pull-up', 'Pull-Up', 'Half-Kneeling Pull-Up', ARRAY['Pull-Up', 'Half-Kneeling Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Half-Kneeling Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'tall-kneeling-pull-up', 'Pull-Up', 'Tall-Kneeling Pull-Up', ARRAY['Pull-Up', 'Tall-Kneeling Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Tall-Kneeling Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'split-stance-pull-up', 'Pull-Up', 'Split-Stance Pull-Up', ARRAY['Pull-Up', 'Split-Stance Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Split-Stance Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'close-grip-pull-up', 'Pull-Up', 'Close-Grip Pull-Up', ARRAY['Pull-Up', 'Close-Grip Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Close-Grip Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'neutral-grip-pull-up', 'Pull-Up', 'Neutral-Grip Pull-Up', ARRAY['Pull-Up', 'Neutral-Grip Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Neutral-Grip Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'wide-grip-pull-up', 'Pull-Up', 'Wide-Grip Pull-Up', ARRAY['Pull-Up', 'Wide-Grip Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Wide-Grip Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'underhand-pull-up', 'Pull-Up', 'Underhand Pull-Up', ARRAY['Pull-Up', 'Underhand Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Underhand Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'overhand-pull-up', 'Pull-Up', 'Overhand Pull-Up', ARRAY['Pull-Up', 'Overhand Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Overhand Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'pronated-pull-up', 'Pull-Up', 'Pronated Pull-Up', ARRAY['Pull-Up', 'Pronated Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Pronated Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'supinated-pull-up', 'Pull-Up', 'Supinated Pull-Up', ARRAY['Pull-Up', 'Supinated Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Supinated Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'incline-pull-up', 'Pull-Up', 'Incline Pull-Up', ARRAY['Pull-Up', 'Incline Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Incline Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'decline-pull-up', 'Pull-Up', 'Decline Pull-Up', ARRAY['Pull-Up', 'Decline Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Decline Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'long-rom-pull-up', 'Pull-Up', 'Long-ROM Pull-Up', ARRAY['Pull-Up', 'Long-ROM Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Long-ROM Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-pull-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'paused-chin-up', 'Pull-Up', 'Paused Chin-Up', ARRAY['Pull-Up', 'Paused Chin-Up']::TEXT[],
  'tempo', 'pull-up', 'Paused Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'tempo-chin-up', 'Pull-Up', 'Tempo Chin-Up', ARRAY['Pull-Up', 'Tempo Chin-Up']::TEXT[],
  'tempo', 'pull-up', 'Tempo Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'slow-eccentric-chin-up', 'Pull-Up', 'Slow Eccentric Chin-Up', ARRAY['Pull-Up', 'Slow Eccentric Chin-Up']::TEXT[],
  'tempo', 'pull-up', 'Slow Eccentric Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  '1-5-rep-chin-up', 'Pull-Up', '1.5 Rep Chin-Up', ARRAY['Pull-Up', '1.5 Rep Chin-Up']::TEXT[],
  'tempo', 'pull-up', '1.5 Rep Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'single-arm-chin-up', 'Pull-Up', 'Single-Arm Chin-Up', ARRAY['Pull-Up', 'Single-Arm Chin-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Arm Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'single-leg-chin-up', 'Pull-Up', 'Single-Leg Chin-Up', ARRAY['Pull-Up', 'Single-Leg Chin-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Leg Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'alternating-chin-up', 'Pull-Up', 'Alternating Chin-Up', ARRAY['Pull-Up', 'Alternating Chin-Up']::TEXT[],
  'unilateral', 'pull-up', 'Alternating Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'half-kneeling-chin-up', 'Pull-Up', 'Half-Kneeling Chin-Up', ARRAY['Pull-Up', 'Half-Kneeling Chin-Up']::TEXT[],
  'stance', 'pull-up', 'Half-Kneeling Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'tall-kneeling-chin-up', 'Pull-Up', 'Tall-Kneeling Chin-Up', ARRAY['Pull-Up', 'Tall-Kneeling Chin-Up']::TEXT[],
  'stance', 'pull-up', 'Tall-Kneeling Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'split-stance-chin-up', 'Pull-Up', 'Split-Stance Chin-Up', ARRAY['Pull-Up', 'Split-Stance Chin-Up']::TEXT[],
  'stance', 'pull-up', 'Split-Stance Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'close-grip-chin-up', 'Pull-Up', 'Close-Grip Chin-Up', ARRAY['Pull-Up', 'Close-Grip Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Close-Grip Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'neutral-grip-chin-up', 'Pull-Up', 'Neutral-Grip Chin-Up', ARRAY['Pull-Up', 'Neutral-Grip Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Neutral-Grip Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'wide-grip-chin-up', 'Pull-Up', 'Wide-Grip Chin-Up', ARRAY['Pull-Up', 'Wide-Grip Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Wide-Grip Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'underhand-chin-up', 'Pull-Up', 'Underhand Chin-Up', ARRAY['Pull-Up', 'Underhand Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Underhand Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'overhand-chin-up', 'Pull-Up', 'Overhand Chin-Up', ARRAY['Pull-Up', 'Overhand Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Overhand Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'pronated-chin-up', 'Pull-Up', 'Pronated Chin-Up', ARRAY['Pull-Up', 'Pronated Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Pronated Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'supinated-chin-up', 'Pull-Up', 'Supinated Chin-Up', ARRAY['Pull-Up', 'Supinated Chin-Up']::TEXT[],
  'grip', 'pull-up', 'Supinated Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'incline-chin-up', 'Pull-Up', 'Incline Chin-Up', ARRAY['Pull-Up', 'Incline Chin-Up']::TEXT[],
  'angle', 'pull-up', 'Incline Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'decline-chin-up', 'Pull-Up', 'Decline Chin-Up', ARRAY['Pull-Up', 'Decline Chin-Up']::TEXT[],
  'angle', 'pull-up', 'Decline Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'long-rom-chin-up', 'Pull-Up', 'Long-ROM Chin-Up', ARRAY['Pull-Up', 'Long-ROM Chin-Up']::TEXT[],
  'angle', 'pull-up', 'Long-ROM Chin-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'biceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'pull-up-bar', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-chin-up'), 'intermediate', 3,
                3, 4, FALSE,
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
  'paused-assisted-pull-up', 'Pull-Up', 'Paused Assisted Pull-Up', ARRAY['Pull-Up', 'Paused Assisted Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Paused Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'tempo-assisted-pull-up', 'Pull-Up', 'Tempo Assisted Pull-Up', ARRAY['Pull-Up', 'Tempo Assisted Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Tempo Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'slow-eccentric-assisted-pull-up', 'Pull-Up', 'Slow Eccentric Assisted Pull-Up', ARRAY['Pull-Up', 'Slow Eccentric Assisted Pull-Up']::TEXT[],
  'tempo', 'pull-up', 'Slow Eccentric Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-assisted-pull-up', 'Pull-Up', '1.5 Rep Assisted Pull-Up', ARRAY['Pull-Up', '1.5 Rep Assisted Pull-Up']::TEXT[],
  'tempo', 'pull-up', '1.5 Rep Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-assisted-pull-up', 'Pull-Up', 'Single-Arm Assisted Pull-Up', ARRAY['Pull-Up', 'Single-Arm Assisted Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Arm Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-assisted-pull-up', 'Pull-Up', 'Single-Leg Assisted Pull-Up', ARRAY['Pull-Up', 'Single-Leg Assisted Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Single-Leg Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-assisted-pull-up', 'Pull-Up', 'Alternating Assisted Pull-Up', ARRAY['Pull-Up', 'Alternating Assisted Pull-Up']::TEXT[],
  'unilateral', 'pull-up', 'Alternating Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-assisted-pull-up', 'Pull-Up', 'Half-Kneeling Assisted Pull-Up', ARRAY['Pull-Up', 'Half-Kneeling Assisted Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Half-Kneeling Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-assisted-pull-up', 'Pull-Up', 'Tall-Kneeling Assisted Pull-Up', ARRAY['Pull-Up', 'Tall-Kneeling Assisted Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Tall-Kneeling Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-assisted-pull-up', 'Pull-Up', 'Split-Stance Assisted Pull-Up', ARRAY['Pull-Up', 'Split-Stance Assisted Pull-Up']::TEXT[],
  'stance', 'pull-up', 'Split-Stance Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-assisted-pull-up', 'Pull-Up', 'Close-Grip Assisted Pull-Up', ARRAY['Pull-Up', 'Close-Grip Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Close-Grip Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-assisted-pull-up', 'Pull-Up', 'Neutral-Grip Assisted Pull-Up', ARRAY['Pull-Up', 'Neutral-Grip Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Neutral-Grip Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'wide-grip-assisted-pull-up', 'Pull-Up', 'Wide-Grip Assisted Pull-Up', ARRAY['Pull-Up', 'Wide-Grip Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Wide-Grip Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'underhand-assisted-pull-up', 'Pull-Up', 'Underhand Assisted Pull-Up', ARRAY['Pull-Up', 'Underhand Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Underhand Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'overhand-assisted-pull-up', 'Pull-Up', 'Overhand Assisted Pull-Up', ARRAY['Pull-Up', 'Overhand Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Overhand Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'pronated-assisted-pull-up', 'Pull-Up', 'Pronated Assisted Pull-Up', ARRAY['Pull-Up', 'Pronated Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Pronated Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'supinated-assisted-pull-up', 'Pull-Up', 'Supinated Assisted Pull-Up', ARRAY['Pull-Up', 'Supinated Assisted Pull-Up']::TEXT[],
  'grip', 'pull-up', 'Supinated Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'incline-assisted-pull-up', 'Pull-Up', 'Incline Assisted Pull-Up', ARRAY['Pull-Up', 'Incline Assisted Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Incline Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'decline-assisted-pull-up', 'Pull-Up', 'Decline Assisted Pull-Up', ARRAY['Pull-Up', 'Decline Assisted Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Decline Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'long-rom-assisted-pull-up', 'Pull-Up', 'Long-ROM Assisted Pull-Up', ARRAY['Pull-Up', 'Long-ROM Assisted Pull-Up']::TEXT[],
  'angle', 'pull-up', 'Long-ROM Assisted Pull-Up is a standardized exercise variation derived from the Pull-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-assisted-pull-up'), 'beginner', 3,
                3, 4, FALSE,
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
  'paused-wide-grip-lat-pulldown', 'Lat Pulldown', 'Paused Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Paused Wide-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Paused Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'tempo-wide-grip-lat-pulldown', 'Lat Pulldown', 'Tempo Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Tempo Wide-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Tempo Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'slow-eccentric-wide-grip-lat-pulldown', 'Lat Pulldown', 'Slow Eccentric Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Slow Eccentric Wide-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Slow Eccentric Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-wide-grip-lat-pulldown', 'Lat Pulldown', '1.5 Rep Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', '1.5 Rep Wide-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', '1.5 Rep Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-wide-grip-lat-pulldown', 'Lat Pulldown', 'Single-Arm Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Single-Arm Wide-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Single-Arm Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-wide-grip-lat-pulldown', 'Lat Pulldown', 'Single-Leg Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Single-Leg Wide-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Single-Leg Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-wide-grip-lat-pulldown', 'Lat Pulldown', 'Alternating Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Alternating Wide-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Alternating Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-wide-grip-lat-pulldown', 'Lat Pulldown', 'Half-Kneeling Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Half-Kneeling Wide-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Half-Kneeling Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-wide-grip-lat-pulldown', 'Lat Pulldown', 'Tall-Kneeling Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Tall-Kneeling Wide-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Tall-Kneeling Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-wide-grip-lat-pulldown', 'Lat Pulldown', 'Split-Stance Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Split-Stance Wide-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Split-Stance Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-wide-grip-lat-pulldown', 'Lat Pulldown', 'Close-Grip Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Close-Grip Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Close-Grip Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-wide-grip-lat-pulldown', 'Lat Pulldown', 'Neutral-Grip Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Neutral-Grip Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Neutral-Grip Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'wide-grip-wide-grip-lat-pulldown', 'Lat Pulldown', 'Wide-Grip Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Wide-Grip Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Wide-Grip Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'underhand-wide-grip-lat-pulldown', 'Lat Pulldown', 'Underhand Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Underhand Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Underhand Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'overhand-wide-grip-lat-pulldown', 'Lat Pulldown', 'Overhand Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Overhand Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Overhand Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'pronated-wide-grip-lat-pulldown', 'Lat Pulldown', 'Pronated Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Pronated Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Pronated Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'supinated-wide-grip-lat-pulldown', 'Lat Pulldown', 'Supinated Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Supinated Wide-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Supinated Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'incline-wide-grip-lat-pulldown', 'Lat Pulldown', 'Incline Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Incline Wide-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Incline Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'decline-wide-grip-lat-pulldown', 'Lat Pulldown', 'Decline Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Decline Wide-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Decline Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'long-rom-wide-grip-lat-pulldown', 'Lat Pulldown', 'Long-ROM Wide-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Long-ROM Wide-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Long-ROM Wide-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-wide-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'paused-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Paused Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Paused Neutral-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Paused Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'tempo-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Tempo Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Tempo Neutral-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Tempo Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'slow-eccentric-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Slow Eccentric Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Slow Eccentric Neutral-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', 'Slow Eccentric Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  '1-5-rep-neutral-grip-lat-pulldown', 'Lat Pulldown', '1.5 Rep Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', '1.5 Rep Neutral-Grip Lat Pulldown']::TEXT[],
  'tempo', 'lat-pulldown', '1.5 Rep Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-arm-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Single-Arm Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Single-Arm Neutral-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Single-Arm Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'single-leg-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Single-Leg Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Single-Leg Neutral-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Single-Leg Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'alternating-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Alternating Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Alternating Neutral-Grip Lat Pulldown']::TEXT[],
  'unilateral', 'lat-pulldown', 'Alternating Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'half-kneeling-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Half-Kneeling Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Half-Kneeling Neutral-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Half-Kneeling Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'tall-kneeling-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Tall-Kneeling Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Tall-Kneeling Neutral-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Tall-Kneeling Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'split-stance-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Split-Stance Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Split-Stance Neutral-Grip Lat Pulldown']::TEXT[],
  'stance', 'lat-pulldown', 'Split-Stance Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'close-grip-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Close-Grip Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Close-Grip Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Close-Grip Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
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
  'neutral-grip-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Neutral-Grip Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Neutral-Grip Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Neutral-Grip Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

COMMIT;
