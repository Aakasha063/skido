BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-reverse-lunge', 'Lunge', 'Wide-Grip Reverse Lunge', ARRAY['Lunge', 'Wide-Grip Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Wide-Grip Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-reverse-lunge'), 'beginner', 3,
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
  'underhand-reverse-lunge', 'Lunge', 'Underhand Reverse Lunge', ARRAY['Lunge', 'Underhand Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Underhand Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-reverse-lunge'), 'beginner', 3,
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
  'overhand-reverse-lunge', 'Lunge', 'Overhand Reverse Lunge', ARRAY['Lunge', 'Overhand Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Overhand Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-reverse-lunge'), 'beginner', 3,
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
  'pronated-reverse-lunge', 'Lunge', 'Pronated Reverse Lunge', ARRAY['Lunge', 'Pronated Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Pronated Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-reverse-lunge'), 'beginner', 3,
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
  'supinated-reverse-lunge', 'Lunge', 'Supinated Reverse Lunge', ARRAY['Lunge', 'Supinated Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Supinated Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-reverse-lunge'), 'beginner', 3,
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
  'incline-reverse-lunge', 'Lunge', 'Incline Reverse Lunge', ARRAY['Lunge', 'Incline Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Incline Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-reverse-lunge'), 'beginner', 3,
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
  'decline-reverse-lunge', 'Lunge', 'Decline Reverse Lunge', ARRAY['Lunge', 'Decline Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Decline Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-reverse-lunge'), 'beginner', 3,
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
  'long-rom-reverse-lunge', 'Lunge', 'Long-ROM Reverse Lunge', ARRAY['Lunge', 'Long-ROM Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Long-ROM Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-reverse-lunge'), 'beginner', 3,
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
  'paused-dumbbell-reverse-lunge', 'Lunge', 'Paused Dumbbell Reverse Lunge', ARRAY['Lunge', 'Paused Dumbbell Reverse Lunge']::TEXT[],
  'tempo', 'lunge', 'Paused Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'tempo-dumbbell-reverse-lunge', 'Lunge', 'Tempo Dumbbell Reverse Lunge', ARRAY['Lunge', 'Tempo Dumbbell Reverse Lunge']::TEXT[],
  'tempo', 'lunge', 'Tempo Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'slow-eccentric-dumbbell-reverse-lunge', 'Lunge', 'Slow Eccentric Dumbbell Reverse Lunge', ARRAY['Lunge', 'Slow Eccentric Dumbbell Reverse Lunge']::TEXT[],
  'tempo', 'lunge', 'Slow Eccentric Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-reverse-lunge'), 'beginner', 3,
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
  '1-5-rep-dumbbell-reverse-lunge', 'Lunge', '1.5 Rep Dumbbell Reverse Lunge', ARRAY['Lunge', '1.5 Rep Dumbbell Reverse Lunge']::TEXT[],
  'tempo', 'lunge', '1.5 Rep Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'single-arm-dumbbell-reverse-lunge', 'Lunge', 'Single-Arm Dumbbell Reverse Lunge', ARRAY['Lunge', 'Single-Arm Dumbbell Reverse Lunge']::TEXT[],
  'unilateral', 'lunge', 'Single-Arm Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'single-leg-dumbbell-reverse-lunge', 'Lunge', 'Single-Leg Dumbbell Reverse Lunge', ARRAY['Lunge', 'Single-Leg Dumbbell Reverse Lunge']::TEXT[],
  'unilateral', 'lunge', 'Single-Leg Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'alternating-dumbbell-reverse-lunge', 'Lunge', 'Alternating Dumbbell Reverse Lunge', ARRAY['Lunge', 'Alternating Dumbbell Reverse Lunge']::TEXT[],
  'unilateral', 'lunge', 'Alternating Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'half-kneeling-dumbbell-reverse-lunge', 'Lunge', 'Half-Kneeling Dumbbell Reverse Lunge', ARRAY['Lunge', 'Half-Kneeling Dumbbell Reverse Lunge']::TEXT[],
  'stance', 'lunge', 'Half-Kneeling Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'tall-kneeling-dumbbell-reverse-lunge', 'Lunge', 'Tall-Kneeling Dumbbell Reverse Lunge', ARRAY['Lunge', 'Tall-Kneeling Dumbbell Reverse Lunge']::TEXT[],
  'stance', 'lunge', 'Tall-Kneeling Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'split-stance-dumbbell-reverse-lunge', 'Lunge', 'Split-Stance Dumbbell Reverse Lunge', ARRAY['Lunge', 'Split-Stance Dumbbell Reverse Lunge']::TEXT[],
  'stance', 'lunge', 'Split-Stance Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'close-grip-dumbbell-reverse-lunge', 'Lunge', 'Close-Grip Dumbbell Reverse Lunge', ARRAY['Lunge', 'Close-Grip Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Close-Grip Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'neutral-grip-dumbbell-reverse-lunge', 'Lunge', 'Neutral-Grip Dumbbell Reverse Lunge', ARRAY['Lunge', 'Neutral-Grip Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Neutral-Grip Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'wide-grip-dumbbell-reverse-lunge', 'Lunge', 'Wide-Grip Dumbbell Reverse Lunge', ARRAY['Lunge', 'Wide-Grip Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Wide-Grip Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'underhand-dumbbell-reverse-lunge', 'Lunge', 'Underhand Dumbbell Reverse Lunge', ARRAY['Lunge', 'Underhand Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Underhand Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'overhand-dumbbell-reverse-lunge', 'Lunge', 'Overhand Dumbbell Reverse Lunge', ARRAY['Lunge', 'Overhand Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Overhand Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'pronated-dumbbell-reverse-lunge', 'Lunge', 'Pronated Dumbbell Reverse Lunge', ARRAY['Lunge', 'Pronated Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Pronated Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'supinated-dumbbell-reverse-lunge', 'Lunge', 'Supinated Dumbbell Reverse Lunge', ARRAY['Lunge', 'Supinated Dumbbell Reverse Lunge']::TEXT[],
  'grip', 'lunge', 'Supinated Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'incline-dumbbell-reverse-lunge', 'Lunge', 'Incline Dumbbell Reverse Lunge', ARRAY['Lunge', 'Incline Dumbbell Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Incline Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'decline-dumbbell-reverse-lunge', 'Lunge', 'Decline Dumbbell Reverse Lunge', ARRAY['Lunge', 'Decline Dumbbell Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Decline Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'long-rom-dumbbell-reverse-lunge', 'Lunge', 'Long-ROM Dumbbell Reverse Lunge', ARRAY['Lunge', 'Long-ROM Dumbbell Reverse Lunge']::TEXT[],
  'angle', 'lunge', 'Long-ROM Dumbbell Reverse Lunge is a standardized exercise variation derived from the Lunge movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-reverse-lunge'), 'beginner', 3,
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
  'paused-bulgarian-split-squat', 'Split Squat', 'Paused Bulgarian Split Squat', ARRAY['Split Squat', 'Paused Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Paused Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-bulgarian-split-squat'), 'intermediate', 3,
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
  'tempo-bulgarian-split-squat', 'Split Squat', 'Tempo Bulgarian Split Squat', ARRAY['Split Squat', 'Tempo Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Tempo Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-bulgarian-split-squat'), 'intermediate', 3,
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
  'slow-eccentric-bulgarian-split-squat', 'Split Squat', 'Slow Eccentric Bulgarian Split Squat', ARRAY['Split Squat', 'Slow Eccentric Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Slow Eccentric Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-bulgarian-split-squat'), 'intermediate', 3,
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
  '1-5-rep-bulgarian-split-squat', 'Split Squat', '1.5 Rep Bulgarian Split Squat', ARRAY['Split Squat', '1.5 Rep Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', '1.5 Rep Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-bulgarian-split-squat'), 'intermediate', 3,
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
  'single-arm-bulgarian-split-squat', 'Split Squat', 'Single-Arm Bulgarian Split Squat', ARRAY['Split Squat', 'Single-Arm Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Single-Arm Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-bulgarian-split-squat'), 'intermediate', 3,
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
  'single-leg-bulgarian-split-squat', 'Split Squat', 'Single-Leg Bulgarian Split Squat', ARRAY['Split Squat', 'Single-Leg Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Single-Leg Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-bulgarian-split-squat'), 'intermediate', 3,
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
  'alternating-bulgarian-split-squat', 'Split Squat', 'Alternating Bulgarian Split Squat', ARRAY['Split Squat', 'Alternating Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Alternating Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-bulgarian-split-squat'), 'intermediate', 3,
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
  'half-kneeling-bulgarian-split-squat', 'Split Squat', 'Half-Kneeling Bulgarian Split Squat', ARRAY['Split Squat', 'Half-Kneeling Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Half-Kneeling Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-bulgarian-split-squat'), 'intermediate', 3,
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
  'tall-kneeling-bulgarian-split-squat', 'Split Squat', 'Tall-Kneeling Bulgarian Split Squat', ARRAY['Split Squat', 'Tall-Kneeling Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Tall-Kneeling Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-bulgarian-split-squat'), 'intermediate', 3,
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
  'split-stance-bulgarian-split-squat', 'Split Squat', 'Split-Stance Bulgarian Split Squat', ARRAY['Split Squat', 'Split-Stance Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Split-Stance Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-bulgarian-split-squat'), 'intermediate', 3,
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
  'close-grip-bulgarian-split-squat', 'Split Squat', 'Close-Grip Bulgarian Split Squat', ARRAY['Split Squat', 'Close-Grip Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Close-Grip Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-bulgarian-split-squat'), 'intermediate', 3,
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
  'neutral-grip-bulgarian-split-squat', 'Split Squat', 'Neutral-Grip Bulgarian Split Squat', ARRAY['Split Squat', 'Neutral-Grip Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Neutral-Grip Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-bulgarian-split-squat'), 'intermediate', 3,
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
  'wide-grip-bulgarian-split-squat', 'Split Squat', 'Wide-Grip Bulgarian Split Squat', ARRAY['Split Squat', 'Wide-Grip Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Wide-Grip Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-bulgarian-split-squat'), 'intermediate', 3,
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
  'underhand-bulgarian-split-squat', 'Split Squat', 'Underhand Bulgarian Split Squat', ARRAY['Split Squat', 'Underhand Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Underhand Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-bulgarian-split-squat'), 'intermediate', 3,
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
  'overhand-bulgarian-split-squat', 'Split Squat', 'Overhand Bulgarian Split Squat', ARRAY['Split Squat', 'Overhand Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Overhand Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-bulgarian-split-squat'), 'intermediate', 3,
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
  'pronated-bulgarian-split-squat', 'Split Squat', 'Pronated Bulgarian Split Squat', ARRAY['Split Squat', 'Pronated Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Pronated Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-bulgarian-split-squat'), 'intermediate', 3,
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
  'supinated-bulgarian-split-squat', 'Split Squat', 'Supinated Bulgarian Split Squat', ARRAY['Split Squat', 'Supinated Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Supinated Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-bulgarian-split-squat'), 'intermediate', 3,
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
  'incline-bulgarian-split-squat', 'Split Squat', 'Incline Bulgarian Split Squat', ARRAY['Split Squat', 'Incline Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Incline Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-bulgarian-split-squat'), 'intermediate', 3,
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
  'decline-bulgarian-split-squat', 'Split Squat', 'Decline Bulgarian Split Squat', ARRAY['Split Squat', 'Decline Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Decline Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-bulgarian-split-squat'), 'intermediate', 3,
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
  'long-rom-bulgarian-split-squat', 'Split Squat', 'Long-ROM Bulgarian Split Squat', ARRAY['Split Squat', 'Long-ROM Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Long-ROM Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-bulgarian-split-squat'), 'intermediate', 3,
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
  'paused-dumbbell-bulgarian-split-squat', 'Split Squat', 'Paused Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Paused Dumbbell Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Paused Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'tempo-dumbbell-bulgarian-split-squat', 'Split Squat', 'Tempo Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Tempo Dumbbell Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Tempo Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'slow-eccentric-dumbbell-bulgarian-split-squat', 'Split Squat', 'Slow Eccentric Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Slow Eccentric Dumbbell Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', 'Slow Eccentric Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  '1-5-rep-dumbbell-bulgarian-split-squat', 'Split Squat', '1.5 Rep Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', '1.5 Rep Dumbbell Bulgarian Split Squat']::TEXT[],
  'tempo', 'split-squat', '1.5 Rep Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'single-arm-dumbbell-bulgarian-split-squat', 'Split Squat', 'Single-Arm Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Single-Arm Dumbbell Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Single-Arm Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'single-leg-dumbbell-bulgarian-split-squat', 'Split Squat', 'Single-Leg Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Single-Leg Dumbbell Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Single-Leg Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'alternating-dumbbell-bulgarian-split-squat', 'Split Squat', 'Alternating Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Alternating Dumbbell Bulgarian Split Squat']::TEXT[],
  'unilateral', 'split-squat', 'Alternating Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'half-kneeling-dumbbell-bulgarian-split-squat', 'Split Squat', 'Half-Kneeling Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Half-Kneeling Dumbbell Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Half-Kneeling Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'tall-kneeling-dumbbell-bulgarian-split-squat', 'Split Squat', 'Tall-Kneeling Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Tall-Kneeling Dumbbell Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Tall-Kneeling Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'split-stance-dumbbell-bulgarian-split-squat', 'Split Squat', 'Split-Stance Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Split-Stance Dumbbell Bulgarian Split Squat']::TEXT[],
  'stance', 'split-squat', 'Split-Stance Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'close-grip-dumbbell-bulgarian-split-squat', 'Split Squat', 'Close-Grip Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Close-Grip Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Close-Grip Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'neutral-grip-dumbbell-bulgarian-split-squat', 'Split Squat', 'Neutral-Grip Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Neutral-Grip Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Neutral-Grip Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'wide-grip-dumbbell-bulgarian-split-squat', 'Split Squat', 'Wide-Grip Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Wide-Grip Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Wide-Grip Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'underhand-dumbbell-bulgarian-split-squat', 'Split Squat', 'Underhand Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Underhand Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Underhand Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'overhand-dumbbell-bulgarian-split-squat', 'Split Squat', 'Overhand Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Overhand Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Overhand Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'pronated-dumbbell-bulgarian-split-squat', 'Split Squat', 'Pronated Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Pronated Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Pronated Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'supinated-dumbbell-bulgarian-split-squat', 'Split Squat', 'Supinated Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Supinated Dumbbell Bulgarian Split Squat']::TEXT[],
  'grip', 'split-squat', 'Supinated Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'incline-dumbbell-bulgarian-split-squat', 'Split Squat', 'Incline Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Incline Dumbbell Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Incline Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'decline-dumbbell-bulgarian-split-squat', 'Split Squat', 'Decline Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Decline Dumbbell Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Decline Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'long-rom-dumbbell-bulgarian-split-squat', 'Split Squat', 'Long-ROM Dumbbell Bulgarian Split Squat', ARRAY['Split Squat', 'Long-ROM Dumbbell Bulgarian Split Squat']::TEXT[],
  'angle', 'split-squat', 'Long-ROM Dumbbell Bulgarian Split Squat is a standardized exercise variation derived from the Split Squat movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'gluteus-medius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat') AND muscle_id = 'gluteus-medius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'lunge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bulgarian-split-squat'), 'intermediate', 3,
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
  'paused-barbell-deadlift', 'Deadlift', 'Paused Barbell Deadlift', ARRAY['Deadlift', 'Paused Barbell Deadlift']::TEXT[],
  'tempo', 'deadlift', 'Paused Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-deadlift'), 'advanced', 3,
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
  'tempo-barbell-deadlift', 'Deadlift', 'Tempo Barbell Deadlift', ARRAY['Deadlift', 'Tempo Barbell Deadlift']::TEXT[],
  'tempo', 'deadlift', 'Tempo Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-deadlift'), 'advanced', 3,
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
  'slow-eccentric-barbell-deadlift', 'Deadlift', 'Slow Eccentric Barbell Deadlift', ARRAY['Deadlift', 'Slow Eccentric Barbell Deadlift']::TEXT[],
  'tempo', 'deadlift', 'Slow Eccentric Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-deadlift'), 'advanced', 3,
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
  '1-5-rep-barbell-deadlift', 'Deadlift', '1.5 Rep Barbell Deadlift', ARRAY['Deadlift', '1.5 Rep Barbell Deadlift']::TEXT[],
  'tempo', 'deadlift', '1.5 Rep Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-deadlift'), 'advanced', 3,
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
  'single-arm-barbell-deadlift', 'Deadlift', 'Single-Arm Barbell Deadlift', ARRAY['Deadlift', 'Single-Arm Barbell Deadlift']::TEXT[],
  'unilateral', 'deadlift', 'Single-Arm Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-deadlift'), 'advanced', 3,
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
  'single-leg-barbell-deadlift', 'Deadlift', 'Single-Leg Barbell Deadlift', ARRAY['Deadlift', 'Single-Leg Barbell Deadlift']::TEXT[],
  'unilateral', 'deadlift', 'Single-Leg Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-deadlift'), 'advanced', 3,
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
  'alternating-barbell-deadlift', 'Deadlift', 'Alternating Barbell Deadlift', ARRAY['Deadlift', 'Alternating Barbell Deadlift']::TEXT[],
  'unilateral', 'deadlift', 'Alternating Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-deadlift'), 'advanced', 3,
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
  'half-kneeling-barbell-deadlift', 'Deadlift', 'Half-Kneeling Barbell Deadlift', ARRAY['Deadlift', 'Half-Kneeling Barbell Deadlift']::TEXT[],
  'stance', 'deadlift', 'Half-Kneeling Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-deadlift'), 'advanced', 3,
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
  'tall-kneeling-barbell-deadlift', 'Deadlift', 'Tall-Kneeling Barbell Deadlift', ARRAY['Deadlift', 'Tall-Kneeling Barbell Deadlift']::TEXT[],
  'stance', 'deadlift', 'Tall-Kneeling Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-deadlift'), 'advanced', 3,
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
  'split-stance-barbell-deadlift', 'Deadlift', 'Split-Stance Barbell Deadlift', ARRAY['Deadlift', 'Split-Stance Barbell Deadlift']::TEXT[],
  'stance', 'deadlift', 'Split-Stance Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-deadlift'), 'advanced', 3,
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
  'close-grip-barbell-deadlift', 'Deadlift', 'Close-Grip Barbell Deadlift', ARRAY['Deadlift', 'Close-Grip Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Close-Grip Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-deadlift'), 'advanced', 3,
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
  'neutral-grip-barbell-deadlift', 'Deadlift', 'Neutral-Grip Barbell Deadlift', ARRAY['Deadlift', 'Neutral-Grip Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Neutral-Grip Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-deadlift'), 'advanced', 3,
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
  'wide-grip-barbell-deadlift', 'Deadlift', 'Wide-Grip Barbell Deadlift', ARRAY['Deadlift', 'Wide-Grip Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Wide-Grip Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-deadlift'), 'advanced', 3,
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
  'underhand-barbell-deadlift', 'Deadlift', 'Underhand Barbell Deadlift', ARRAY['Deadlift', 'Underhand Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Underhand Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-deadlift'), 'advanced', 3,
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
  'overhand-barbell-deadlift', 'Deadlift', 'Overhand Barbell Deadlift', ARRAY['Deadlift', 'Overhand Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Overhand Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-deadlift'), 'advanced', 3,
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
  'pronated-barbell-deadlift', 'Deadlift', 'Pronated Barbell Deadlift', ARRAY['Deadlift', 'Pronated Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Pronated Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-deadlift'), 'advanced', 3,
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
  'supinated-barbell-deadlift', 'Deadlift', 'Supinated Barbell Deadlift', ARRAY['Deadlift', 'Supinated Barbell Deadlift']::TEXT[],
  'grip', 'deadlift', 'Supinated Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-deadlift'), 'advanced', 3,
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
  'incline-barbell-deadlift', 'Deadlift', 'Incline Barbell Deadlift', ARRAY['Deadlift', 'Incline Barbell Deadlift']::TEXT[],
  'angle', 'deadlift', 'Incline Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-deadlift'), 'advanced', 3,
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
  'decline-barbell-deadlift', 'Deadlift', 'Decline Barbell Deadlift', ARRAY['Deadlift', 'Decline Barbell Deadlift']::TEXT[],
  'angle', 'deadlift', 'Decline Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-deadlift'), 'advanced', 3,
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
  'long-rom-barbell-deadlift', 'Deadlift', 'Long-ROM Barbell Deadlift', ARRAY['Deadlift', 'Long-ROM Barbell Deadlift']::TEXT[],
  'angle', 'deadlift', 'Long-ROM Barbell Deadlift is a standardized exercise variation derived from the Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-deadlift'), 'advanced', 3,
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
  'paused-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Paused Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Paused Dumbbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Paused Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'tempo-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Tempo Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Tempo Dumbbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Tempo Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'slow-eccentric-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Slow Eccentric Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Slow Eccentric Dumbbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Slow Eccentric Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  '1-5-rep-dumbbell-romanian-deadlift', 'Romanian Deadlift', '1.5 Rep Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', '1.5 Rep Dumbbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', '1.5 Rep Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'single-arm-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Single-Arm Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Single-Arm Dumbbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Single-Arm Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'single-leg-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Single-Leg Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Single-Leg Dumbbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Single-Leg Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'alternating-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Alternating Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Alternating Dumbbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Alternating Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'half-kneeling-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Half-Kneeling Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Half-Kneeling Dumbbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Half-Kneeling Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'tall-kneeling-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Tall-Kneeling Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Tall-Kneeling Dumbbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Tall-Kneeling Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'split-stance-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Split-Stance Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Split-Stance Dumbbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Split-Stance Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'close-grip-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Close-Grip Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Close-Grip Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Close-Grip Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'neutral-grip-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Neutral-Grip Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Neutral-Grip Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Neutral-Grip Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'wide-grip-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Wide-Grip Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Wide-Grip Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Wide-Grip Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'underhand-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Underhand Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Underhand Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Underhand Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'overhand-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Overhand Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Overhand Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Overhand Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'pronated-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Pronated Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Pronated Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Pronated Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'supinated-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Supinated Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Supinated Dumbbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Supinated Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'incline-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Incline Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Incline Dumbbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Incline Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'decline-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Decline Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Decline Dumbbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Decline Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'long-rom-dumbbell-romanian-deadlift', 'Romanian Deadlift', 'Long-ROM Dumbbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Long-ROM Dumbbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Long-ROM Dumbbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-romanian-deadlift'), 'intermediate', 3,
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
  'paused-barbell-romanian-deadlift', 'Romanian Deadlift', 'Paused Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Paused Barbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Paused Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'tempo-barbell-romanian-deadlift', 'Romanian Deadlift', 'Tempo Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Tempo Barbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Tempo Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'slow-eccentric-barbell-romanian-deadlift', 'Romanian Deadlift', 'Slow Eccentric Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Slow Eccentric Barbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', 'Slow Eccentric Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-romanian-deadlift'), 'intermediate', 3,
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
  '1-5-rep-barbell-romanian-deadlift', 'Romanian Deadlift', '1.5 Rep Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', '1.5 Rep Barbell Romanian Deadlift']::TEXT[],
  'tempo', 'romanian-deadlift', '1.5 Rep Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'single-arm-barbell-romanian-deadlift', 'Romanian Deadlift', 'Single-Arm Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Single-Arm Barbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Single-Arm Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'single-leg-barbell-romanian-deadlift', 'Romanian Deadlift', 'Single-Leg Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Single-Leg Barbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Single-Leg Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'alternating-barbell-romanian-deadlift', 'Romanian Deadlift', 'Alternating Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Alternating Barbell Romanian Deadlift']::TEXT[],
  'unilateral', 'romanian-deadlift', 'Alternating Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'half-kneeling-barbell-romanian-deadlift', 'Romanian Deadlift', 'Half-Kneeling Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Half-Kneeling Barbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Half-Kneeling Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'tall-kneeling-barbell-romanian-deadlift', 'Romanian Deadlift', 'Tall-Kneeling Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Tall-Kneeling Barbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Tall-Kneeling Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'split-stance-barbell-romanian-deadlift', 'Romanian Deadlift', 'Split-Stance Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Split-Stance Barbell Romanian Deadlift']::TEXT[],
  'stance', 'romanian-deadlift', 'Split-Stance Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'close-grip-barbell-romanian-deadlift', 'Romanian Deadlift', 'Close-Grip Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Close-Grip Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Close-Grip Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'neutral-grip-barbell-romanian-deadlift', 'Romanian Deadlift', 'Neutral-Grip Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Neutral-Grip Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Neutral-Grip Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'wide-grip-barbell-romanian-deadlift', 'Romanian Deadlift', 'Wide-Grip Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Wide-Grip Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Wide-Grip Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'underhand-barbell-romanian-deadlift', 'Romanian Deadlift', 'Underhand Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Underhand Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Underhand Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'overhand-barbell-romanian-deadlift', 'Romanian Deadlift', 'Overhand Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Overhand Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Overhand Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'pronated-barbell-romanian-deadlift', 'Romanian Deadlift', 'Pronated Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Pronated Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Pronated Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'supinated-barbell-romanian-deadlift', 'Romanian Deadlift', 'Supinated Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Supinated Barbell Romanian Deadlift']::TEXT[],
  'grip', 'romanian-deadlift', 'Supinated Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'incline-barbell-romanian-deadlift', 'Romanian Deadlift', 'Incline Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Incline Barbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Incline Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'decline-barbell-romanian-deadlift', 'Romanian Deadlift', 'Decline Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Decline Barbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Decline Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'long-rom-barbell-romanian-deadlift', 'Romanian Deadlift', 'Long-ROM Barbell Romanian Deadlift', ARRAY['Romanian Deadlift', 'Long-ROM Barbell Romanian Deadlift']::TEXT[],
  'angle', 'romanian-deadlift', 'Long-ROM Barbell Romanian Deadlift is a standardized exercise variation derived from the Romanian Deadlift movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-romanian-deadlift'), 'intermediate', 3,
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
  'paused-good-morning', 'Good Morning', 'Paused Good Morning', ARRAY['Good Morning', 'Paused Good Morning']::TEXT[],
  'tempo', 'good-morning', 'Paused Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-good-morning'), 'advanced', 3,
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
  'tempo-good-morning', 'Good Morning', 'Tempo Good Morning', ARRAY['Good Morning', 'Tempo Good Morning']::TEXT[],
  'tempo', 'good-morning', 'Tempo Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-good-morning'), 'advanced', 3,
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
  'slow-eccentric-good-morning', 'Good Morning', 'Slow Eccentric Good Morning', ARRAY['Good Morning', 'Slow Eccentric Good Morning']::TEXT[],
  'tempo', 'good-morning', 'Slow Eccentric Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-good-morning'), 'advanced', 3,
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
  '1-5-rep-good-morning', 'Good Morning', '1.5 Rep Good Morning', ARRAY['Good Morning', '1.5 Rep Good Morning']::TEXT[],
  'tempo', 'good-morning', '1.5 Rep Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-good-morning'), 'advanced', 3,
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
  'single-arm-good-morning', 'Good Morning', 'Single-Arm Good Morning', ARRAY['Good Morning', 'Single-Arm Good Morning']::TEXT[],
  'unilateral', 'good-morning', 'Single-Arm Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-good-morning'), 'advanced', 3,
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
  'single-leg-good-morning', 'Good Morning', 'Single-Leg Good Morning', ARRAY['Good Morning', 'Single-Leg Good Morning']::TEXT[],
  'unilateral', 'good-morning', 'Single-Leg Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-good-morning'), 'advanced', 3,
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
  'alternating-good-morning', 'Good Morning', 'Alternating Good Morning', ARRAY['Good Morning', 'Alternating Good Morning']::TEXT[],
  'unilateral', 'good-morning', 'Alternating Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-good-morning'), 'advanced', 3,
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
  'half-kneeling-good-morning', 'Good Morning', 'Half-Kneeling Good Morning', ARRAY['Good Morning', 'Half-Kneeling Good Morning']::TEXT[],
  'stance', 'good-morning', 'Half-Kneeling Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-good-morning'), 'advanced', 3,
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
  'tall-kneeling-good-morning', 'Good Morning', 'Tall-Kneeling Good Morning', ARRAY['Good Morning', 'Tall-Kneeling Good Morning']::TEXT[],
  'stance', 'good-morning', 'Tall-Kneeling Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-good-morning'), 'advanced', 3,
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
  'split-stance-good-morning', 'Good Morning', 'Split-Stance Good Morning', ARRAY['Good Morning', 'Split-Stance Good Morning']::TEXT[],
  'stance', 'good-morning', 'Split-Stance Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-good-morning'), 'advanced', 3,
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
  'close-grip-good-morning', 'Good Morning', 'Close-Grip Good Morning', ARRAY['Good Morning', 'Close-Grip Good Morning']::TEXT[],
  'grip', 'good-morning', 'Close-Grip Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-good-morning'), 'advanced', 3,
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
  'neutral-grip-good-morning', 'Good Morning', 'Neutral-Grip Good Morning', ARRAY['Good Morning', 'Neutral-Grip Good Morning']::TEXT[],
  'grip', 'good-morning', 'Neutral-Grip Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-good-morning'), 'advanced', 3,
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
  'wide-grip-good-morning', 'Good Morning', 'Wide-Grip Good Morning', ARRAY['Good Morning', 'Wide-Grip Good Morning']::TEXT[],
  'grip', 'good-morning', 'Wide-Grip Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-good-morning'), 'advanced', 3,
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
  'underhand-good-morning', 'Good Morning', 'Underhand Good Morning', ARRAY['Good Morning', 'Underhand Good Morning']::TEXT[],
  'grip', 'good-morning', 'Underhand Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-good-morning'), 'advanced', 3,
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
  'overhand-good-morning', 'Good Morning', 'Overhand Good Morning', ARRAY['Good Morning', 'Overhand Good Morning']::TEXT[],
  'grip', 'good-morning', 'Overhand Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-good-morning'), 'advanced', 3,
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
  'pronated-good-morning', 'Good Morning', 'Pronated Good Morning', ARRAY['Good Morning', 'Pronated Good Morning']::TEXT[],
  'grip', 'good-morning', 'Pronated Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-good-morning'), 'advanced', 3,
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
  'supinated-good-morning', 'Good Morning', 'Supinated Good Morning', ARRAY['Good Morning', 'Supinated Good Morning']::TEXT[],
  'grip', 'good-morning', 'Supinated Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-good-morning'), 'advanced', 3,
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
  'incline-good-morning', 'Good Morning', 'Incline Good Morning', ARRAY['Good Morning', 'Incline Good Morning']::TEXT[],
  'angle', 'good-morning', 'Incline Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-good-morning'), 'advanced', 3,
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
  'decline-good-morning', 'Good Morning', 'Decline Good Morning', ARRAY['Good Morning', 'Decline Good Morning']::TEXT[],
  'angle', 'good-morning', 'Decline Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-good-morning'), 'advanced', 3,
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
  'long-rom-good-morning', 'Good Morning', 'Long-ROM Good Morning', ARRAY['Good Morning', 'Long-ROM Good Morning']::TEXT[],
  'angle', 'good-morning', 'Long-ROM Good Morning is a standardized exercise variation derived from the Good Morning movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-good-morning'), 'advanced', 3,
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
  'paused-barbell-hip-thrust', 'Hip Thrust', 'Paused Barbell Hip Thrust', ARRAY['Hip Thrust', 'Paused Barbell Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Paused Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-hip-thrust'), 'intermediate', 3,
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
  'tempo-barbell-hip-thrust', 'Hip Thrust', 'Tempo Barbell Hip Thrust', ARRAY['Hip Thrust', 'Tempo Barbell Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Tempo Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
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
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-hip-thrust'), 'intermediate', 3,
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
