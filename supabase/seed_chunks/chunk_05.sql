BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Wide-Grip Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Wide-Grip Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Wide-Grip Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Underhand Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Underhand Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Underhand Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Overhand Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Overhand Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Overhand Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Pronated Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Pronated Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Pronated Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Supinated Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Supinated Neutral-Grip Lat Pulldown']::TEXT[],
  'grip', 'lat-pulldown', 'Supinated Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Incline Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Incline Neutral-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Incline Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Decline Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Decline Neutral-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Decline Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-neutral-grip-lat-pulldown', 'Lat Pulldown', 'Long-ROM Neutral-Grip Lat Pulldown', ARRAY['Lat Pulldown', 'Long-ROM Neutral-Grip Lat Pulldown']::TEXT[],
  'angle', 'lat-pulldown', 'Long-ROM Neutral-Grip Lat Pulldown is a standardized exercise variation derived from the Lat Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'brachialis', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown') AND muscle_id = 'brachialis'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-neutral-grip-lat-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Paused Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Paused Straight-Arm Cable Pulldown']::TEXT[],
  'tempo', 'straight-arm-pulldown', 'Paused Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Tempo Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Tempo Straight-Arm Cable Pulldown']::TEXT[],
  'tempo', 'straight-arm-pulldown', 'Tempo Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Slow Eccentric Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Slow Eccentric Straight-Arm Cable Pulldown']::TEXT[],
  'tempo', 'straight-arm-pulldown', 'Slow Eccentric Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', '1.5 Rep Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', '1.5 Rep Straight-Arm Cable Pulldown']::TEXT[],
  'tempo', 'straight-arm-pulldown', '1.5 Rep Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Single-Arm Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Single-Arm Straight-Arm Cable Pulldown']::TEXT[],
  'unilateral', 'straight-arm-pulldown', 'Single-Arm Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Single-Leg Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Single-Leg Straight-Arm Cable Pulldown']::TEXT[],
  'unilateral', 'straight-arm-pulldown', 'Single-Leg Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Alternating Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Alternating Straight-Arm Cable Pulldown']::TEXT[],
  'unilateral', 'straight-arm-pulldown', 'Alternating Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Half-Kneeling Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Half-Kneeling Straight-Arm Cable Pulldown']::TEXT[],
  'stance', 'straight-arm-pulldown', 'Half-Kneeling Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Tall-Kneeling Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Tall-Kneeling Straight-Arm Cable Pulldown']::TEXT[],
  'stance', 'straight-arm-pulldown', 'Tall-Kneeling Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Split-Stance Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Split-Stance Straight-Arm Cable Pulldown']::TEXT[],
  'stance', 'straight-arm-pulldown', 'Split-Stance Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Close-Grip Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Close-Grip Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Close-Grip Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Neutral-Grip Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Neutral-Grip Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Neutral-Grip Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Wide-Grip Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Wide-Grip Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Wide-Grip Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Underhand Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Underhand Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Underhand Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Overhand Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Overhand Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Overhand Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Pronated Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Pronated Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Pronated Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Supinated Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Supinated Straight-Arm Cable Pulldown']::TEXT[],
  'grip', 'straight-arm-pulldown', 'Supinated Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Incline Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Incline Straight-Arm Cable Pulldown']::TEXT[],
  'angle', 'straight-arm-pulldown', 'Incline Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Decline Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Decline Straight-Arm Cable Pulldown']::TEXT[],
  'angle', 'straight-arm-pulldown', 'Decline Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-straight-arm-cable-pulldown', 'Straight-Arm Pulldown', 'Long-ROM Straight-Arm Cable Pulldown', ARRAY['Straight-Arm Pulldown', 'Long-ROM Straight-Arm Cable Pulldown']::TEXT[],
  'angle', 'straight-arm-pulldown', 'Long-ROM Straight-Arm Cable Pulldown is a standardized exercise variation derived from the Straight-Arm Pulldown movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown'), 'vertical-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-straight-arm-cable-pulldown'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-seated-cable-row', 'Seated Row', 'Paused Seated Cable Row', ARRAY['Seated Row', 'Paused Seated Cable Row']::TEXT[],
  'tempo', 'seated-row', 'Paused Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-seated-cable-row', 'Seated Row', 'Tempo Seated Cable Row', ARRAY['Seated Row', 'Tempo Seated Cable Row']::TEXT[],
  'tempo', 'seated-row', 'Tempo Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-seated-cable-row', 'Seated Row', 'Slow Eccentric Seated Cable Row', ARRAY['Seated Row', 'Slow Eccentric Seated Cable Row']::TEXT[],
  'tempo', 'seated-row', 'Slow Eccentric Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-seated-cable-row', 'Seated Row', '1.5 Rep Seated Cable Row', ARRAY['Seated Row', '1.5 Rep Seated Cable Row']::TEXT[],
  'tempo', 'seated-row', '1.5 Rep Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-seated-cable-row', 'Seated Row', 'Single-Arm Seated Cable Row', ARRAY['Seated Row', 'Single-Arm Seated Cable Row']::TEXT[],
  'unilateral', 'seated-row', 'Single-Arm Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-seated-cable-row', 'Seated Row', 'Single-Leg Seated Cable Row', ARRAY['Seated Row', 'Single-Leg Seated Cable Row']::TEXT[],
  'unilateral', 'seated-row', 'Single-Leg Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-seated-cable-row', 'Seated Row', 'Alternating Seated Cable Row', ARRAY['Seated Row', 'Alternating Seated Cable Row']::TEXT[],
  'unilateral', 'seated-row', 'Alternating Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-seated-cable-row', 'Seated Row', 'Half-Kneeling Seated Cable Row', ARRAY['Seated Row', 'Half-Kneeling Seated Cable Row']::TEXT[],
  'stance', 'seated-row', 'Half-Kneeling Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-seated-cable-row', 'Seated Row', 'Tall-Kneeling Seated Cable Row', ARRAY['Seated Row', 'Tall-Kneeling Seated Cable Row']::TEXT[],
  'stance', 'seated-row', 'Tall-Kneeling Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-seated-cable-row', 'Seated Row', 'Split-Stance Seated Cable Row', ARRAY['Seated Row', 'Split-Stance Seated Cable Row']::TEXT[],
  'stance', 'seated-row', 'Split-Stance Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-seated-cable-row', 'Seated Row', 'Close-Grip Seated Cable Row', ARRAY['Seated Row', 'Close-Grip Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Close-Grip Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-seated-cable-row', 'Seated Row', 'Neutral-Grip Seated Cable Row', ARRAY['Seated Row', 'Neutral-Grip Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Neutral-Grip Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-seated-cable-row', 'Seated Row', 'Wide-Grip Seated Cable Row', ARRAY['Seated Row', 'Wide-Grip Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Wide-Grip Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-seated-cable-row', 'Seated Row', 'Underhand Seated Cable Row', ARRAY['Seated Row', 'Underhand Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Underhand Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-seated-cable-row', 'Seated Row', 'Overhand Seated Cable Row', ARRAY['Seated Row', 'Overhand Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Overhand Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-seated-cable-row', 'Seated Row', 'Pronated Seated Cable Row', ARRAY['Seated Row', 'Pronated Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Pronated Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-seated-cable-row', 'Seated Row', 'Supinated Seated Cable Row', ARRAY['Seated Row', 'Supinated Seated Cable Row']::TEXT[],
  'grip', 'seated-row', 'Supinated Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-seated-cable-row', 'Seated Row', 'Incline Seated Cable Row', ARRAY['Seated Row', 'Incline Seated Cable Row']::TEXT[],
  'angle', 'seated-row', 'Incline Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-seated-cable-row', 'Seated Row', 'Decline Seated Cable Row', ARRAY['Seated Row', 'Decline Seated Cable Row']::TEXT[],
  'angle', 'seated-row', 'Decline Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-seated-cable-row', 'Seated Row', 'Long-ROM Seated Cable Row', ARRAY['Seated Row', 'Long-ROM Seated Cable Row']::TEXT[],
  'angle', 'seated-row', 'Long-ROM Seated Cable Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-cable-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-close-grip-seated-row', 'Seated Row', 'Paused Close-Grip Seated Row', ARRAY['Seated Row', 'Paused Close-Grip Seated Row']::TEXT[],
  'tempo', 'seated-row', 'Paused Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-close-grip-seated-row', 'Seated Row', 'Tempo Close-Grip Seated Row', ARRAY['Seated Row', 'Tempo Close-Grip Seated Row']::TEXT[],
  'tempo', 'seated-row', 'Tempo Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-close-grip-seated-row', 'Seated Row', 'Slow Eccentric Close-Grip Seated Row', ARRAY['Seated Row', 'Slow Eccentric Close-Grip Seated Row']::TEXT[],
  'tempo', 'seated-row', 'Slow Eccentric Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-close-grip-seated-row', 'Seated Row', '1.5 Rep Close-Grip Seated Row', ARRAY['Seated Row', '1.5 Rep Close-Grip Seated Row']::TEXT[],
  'tempo', 'seated-row', '1.5 Rep Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-close-grip-seated-row', 'Seated Row', 'Single-Arm Close-Grip Seated Row', ARRAY['Seated Row', 'Single-Arm Close-Grip Seated Row']::TEXT[],
  'unilateral', 'seated-row', 'Single-Arm Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-close-grip-seated-row', 'Seated Row', 'Single-Leg Close-Grip Seated Row', ARRAY['Seated Row', 'Single-Leg Close-Grip Seated Row']::TEXT[],
  'unilateral', 'seated-row', 'Single-Leg Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-close-grip-seated-row', 'Seated Row', 'Alternating Close-Grip Seated Row', ARRAY['Seated Row', 'Alternating Close-Grip Seated Row']::TEXT[],
  'unilateral', 'seated-row', 'Alternating Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-close-grip-seated-row', 'Seated Row', 'Half-Kneeling Close-Grip Seated Row', ARRAY['Seated Row', 'Half-Kneeling Close-Grip Seated Row']::TEXT[],
  'stance', 'seated-row', 'Half-Kneeling Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-close-grip-seated-row', 'Seated Row', 'Tall-Kneeling Close-Grip Seated Row', ARRAY['Seated Row', 'Tall-Kneeling Close-Grip Seated Row']::TEXT[],
  'stance', 'seated-row', 'Tall-Kneeling Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-close-grip-seated-row', 'Seated Row', 'Split-Stance Close-Grip Seated Row', ARRAY['Seated Row', 'Split-Stance Close-Grip Seated Row']::TEXT[],
  'stance', 'seated-row', 'Split-Stance Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-close-grip-seated-row', 'Seated Row', 'Close-Grip Close-Grip Seated Row', ARRAY['Seated Row', 'Close-Grip Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Close-Grip Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-close-grip-seated-row', 'Seated Row', 'Neutral-Grip Close-Grip Seated Row', ARRAY['Seated Row', 'Neutral-Grip Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Neutral-Grip Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-close-grip-seated-row', 'Seated Row', 'Wide-Grip Close-Grip Seated Row', ARRAY['Seated Row', 'Wide-Grip Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Wide-Grip Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-close-grip-seated-row', 'Seated Row', 'Underhand Close-Grip Seated Row', ARRAY['Seated Row', 'Underhand Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Underhand Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-close-grip-seated-row', 'Seated Row', 'Overhand Close-Grip Seated Row', ARRAY['Seated Row', 'Overhand Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Overhand Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-close-grip-seated-row', 'Seated Row', 'Pronated Close-Grip Seated Row', ARRAY['Seated Row', 'Pronated Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Pronated Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-close-grip-seated-row', 'Seated Row', 'Supinated Close-Grip Seated Row', ARRAY['Seated Row', 'Supinated Close-Grip Seated Row']::TEXT[],
  'grip', 'seated-row', 'Supinated Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-close-grip-seated-row', 'Seated Row', 'Incline Close-Grip Seated Row', ARRAY['Seated Row', 'Incline Close-Grip Seated Row']::TEXT[],
  'angle', 'seated-row', 'Incline Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-close-grip-seated-row', 'Seated Row', 'Decline Close-Grip Seated Row', ARRAY['Seated Row', 'Decline Close-Grip Seated Row']::TEXT[],
  'angle', 'seated-row', 'Decline Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-close-grip-seated-row', 'Seated Row', 'Long-ROM Close-Grip Seated Row', ARRAY['Seated Row', 'Long-ROM Close-Grip Seated Row']::TEXT[],
  'angle', 'seated-row', 'Long-ROM Close-Grip Seated Row is a standardized exercise variation derived from the Seated Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-seated-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-barbell-bent-over-row', 'Row', 'Paused Barbell Bent-Over Row', ARRAY['Row', 'Paused Barbell Bent-Over Row']::TEXT[],
  'tempo', 'row', 'Paused Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-barbell-bent-over-row', 'Row', 'Tempo Barbell Bent-Over Row', ARRAY['Row', 'Tempo Barbell Bent-Over Row']::TEXT[],
  'tempo', 'row', 'Tempo Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-barbell-bent-over-row', 'Row', 'Slow Eccentric Barbell Bent-Over Row', ARRAY['Row', 'Slow Eccentric Barbell Bent-Over Row']::TEXT[],
  'tempo', 'row', 'Slow Eccentric Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-barbell-bent-over-row', 'Row', '1.5 Rep Barbell Bent-Over Row', ARRAY['Row', '1.5 Rep Barbell Bent-Over Row']::TEXT[],
  'tempo', 'row', '1.5 Rep Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-barbell-bent-over-row', 'Row', 'Single-Arm Barbell Bent-Over Row', ARRAY['Row', 'Single-Arm Barbell Bent-Over Row']::TEXT[],
  'unilateral', 'row', 'Single-Arm Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-barbell-bent-over-row', 'Row', 'Single-Leg Barbell Bent-Over Row', ARRAY['Row', 'Single-Leg Barbell Bent-Over Row']::TEXT[],
  'unilateral', 'row', 'Single-Leg Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-barbell-bent-over-row', 'Row', 'Alternating Barbell Bent-Over Row', ARRAY['Row', 'Alternating Barbell Bent-Over Row']::TEXT[],
  'unilateral', 'row', 'Alternating Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-barbell-bent-over-row', 'Row', 'Half-Kneeling Barbell Bent-Over Row', ARRAY['Row', 'Half-Kneeling Barbell Bent-Over Row']::TEXT[],
  'stance', 'row', 'Half-Kneeling Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-barbell-bent-over-row', 'Row', 'Tall-Kneeling Barbell Bent-Over Row', ARRAY['Row', 'Tall-Kneeling Barbell Bent-Over Row']::TEXT[],
  'stance', 'row', 'Tall-Kneeling Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-barbell-bent-over-row', 'Row', 'Split-Stance Barbell Bent-Over Row', ARRAY['Row', 'Split-Stance Barbell Bent-Over Row']::TEXT[],
  'stance', 'row', 'Split-Stance Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-barbell-bent-over-row', 'Row', 'Close-Grip Barbell Bent-Over Row', ARRAY['Row', 'Close-Grip Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Close-Grip Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-barbell-bent-over-row', 'Row', 'Neutral-Grip Barbell Bent-Over Row', ARRAY['Row', 'Neutral-Grip Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Neutral-Grip Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-barbell-bent-over-row', 'Row', 'Wide-Grip Barbell Bent-Over Row', ARRAY['Row', 'Wide-Grip Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Wide-Grip Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-barbell-bent-over-row', 'Row', 'Underhand Barbell Bent-Over Row', ARRAY['Row', 'Underhand Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Underhand Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-barbell-bent-over-row', 'Row', 'Overhand Barbell Bent-Over Row', ARRAY['Row', 'Overhand Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Overhand Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-barbell-bent-over-row', 'Row', 'Pronated Barbell Bent-Over Row', ARRAY['Row', 'Pronated Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Pronated Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-barbell-bent-over-row', 'Row', 'Supinated Barbell Bent-Over Row', ARRAY['Row', 'Supinated Barbell Bent-Over Row']::TEXT[],
  'grip', 'row', 'Supinated Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-barbell-bent-over-row', 'Row', 'Incline Barbell Bent-Over Row', ARRAY['Row', 'Incline Barbell Bent-Over Row']::TEXT[],
  'angle', 'row', 'Incline Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-barbell-bent-over-row', 'Row', 'Decline Barbell Bent-Over Row', ARRAY['Row', 'Decline Barbell Bent-Over Row']::TEXT[],
  'angle', 'row', 'Decline Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-barbell-bent-over-row', 'Row', 'Long-ROM Barbell Bent-Over Row', ARRAY['Row', 'Long-ROM Barbell Bent-Over Row']::TEXT[],
  'angle', 'row', 'Long-ROM Barbell Bent-Over Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'middle-trapezius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row') AND muscle_id = 'middle-trapezius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-bent-over-row'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-chest-supported-dumbbell-row', 'Row', 'Paused Chest-Supported Dumbbell Row', ARRAY['Row', 'Paused Chest-Supported Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Paused Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-chest-supported-dumbbell-row', 'Row', 'Tempo Chest-Supported Dumbbell Row', ARRAY['Row', 'Tempo Chest-Supported Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Tempo Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-chest-supported-dumbbell-row', 'Row', 'Slow Eccentric Chest-Supported Dumbbell Row', ARRAY['Row', 'Slow Eccentric Chest-Supported Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Slow Eccentric Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-chest-supported-dumbbell-row', 'Row', '1.5 Rep Chest-Supported Dumbbell Row', ARRAY['Row', '1.5 Rep Chest-Supported Dumbbell Row']::TEXT[],
  'tempo', 'row', '1.5 Rep Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-chest-supported-dumbbell-row', 'Row', 'Single-Arm Chest-Supported Dumbbell Row', ARRAY['Row', 'Single-Arm Chest-Supported Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Single-Arm Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-chest-supported-dumbbell-row', 'Row', 'Single-Leg Chest-Supported Dumbbell Row', ARRAY['Row', 'Single-Leg Chest-Supported Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Single-Leg Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-chest-supported-dumbbell-row', 'Row', 'Alternating Chest-Supported Dumbbell Row', ARRAY['Row', 'Alternating Chest-Supported Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Alternating Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-chest-supported-dumbbell-row', 'Row', 'Half-Kneeling Chest-Supported Dumbbell Row', ARRAY['Row', 'Half-Kneeling Chest-Supported Dumbbell Row']::TEXT[],
  'stance', 'row', 'Half-Kneeling Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-chest-supported-dumbbell-row', 'Row', 'Tall-Kneeling Chest-Supported Dumbbell Row', ARRAY['Row', 'Tall-Kneeling Chest-Supported Dumbbell Row']::TEXT[],
  'stance', 'row', 'Tall-Kneeling Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-chest-supported-dumbbell-row', 'Row', 'Split-Stance Chest-Supported Dumbbell Row', ARRAY['Row', 'Split-Stance Chest-Supported Dumbbell Row']::TEXT[],
  'stance', 'row', 'Split-Stance Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-chest-supported-dumbbell-row', 'Row', 'Close-Grip Chest-Supported Dumbbell Row', ARRAY['Row', 'Close-Grip Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Close-Grip Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-chest-supported-dumbbell-row', 'Row', 'Neutral-Grip Chest-Supported Dumbbell Row', ARRAY['Row', 'Neutral-Grip Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Neutral-Grip Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-chest-supported-dumbbell-row', 'Row', 'Wide-Grip Chest-Supported Dumbbell Row', ARRAY['Row', 'Wide-Grip Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Wide-Grip Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-chest-supported-dumbbell-row', 'Row', 'Underhand Chest-Supported Dumbbell Row', ARRAY['Row', 'Underhand Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Underhand Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-chest-supported-dumbbell-row', 'Row', 'Overhand Chest-Supported Dumbbell Row', ARRAY['Row', 'Overhand Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Overhand Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-chest-supported-dumbbell-row', 'Row', 'Pronated Chest-Supported Dumbbell Row', ARRAY['Row', 'Pronated Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Pronated Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-chest-supported-dumbbell-row', 'Row', 'Supinated Chest-Supported Dumbbell Row', ARRAY['Row', 'Supinated Chest-Supported Dumbbell Row']::TEXT[],
  'grip', 'row', 'Supinated Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-chest-supported-dumbbell-row', 'Row', 'Incline Chest-Supported Dumbbell Row', ARRAY['Row', 'Incline Chest-Supported Dumbbell Row']::TEXT[],
  'angle', 'row', 'Incline Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-chest-supported-dumbbell-row', 'Row', 'Decline Chest-Supported Dumbbell Row', ARRAY['Row', 'Decline Chest-Supported Dumbbell Row']::TEXT[],
  'angle', 'row', 'Decline Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-chest-supported-dumbbell-row', 'Row', 'Long-ROM Chest-Supported Dumbbell Row', ARRAY['Row', 'Long-ROM Chest-Supported Dumbbell Row']::TEXT[],
  'angle', 'row', 'Long-ROM Chest-Supported Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'rhomboids', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'latissimus-dorsi', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-chest-supported-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-single-arm-dumbbell-row', 'Row', 'Paused Single-Arm Dumbbell Row', ARRAY['Row', 'Paused Single-Arm Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Paused Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-single-arm-dumbbell-row', 'Row', 'Tempo Single-Arm Dumbbell Row', ARRAY['Row', 'Tempo Single-Arm Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Tempo Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-single-arm-dumbbell-row', 'Row', 'Slow Eccentric Single-Arm Dumbbell Row', ARRAY['Row', 'Slow Eccentric Single-Arm Dumbbell Row']::TEXT[],
  'tempo', 'row', 'Slow Eccentric Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-single-arm-dumbbell-row', 'Row', '1.5 Rep Single-Arm Dumbbell Row', ARRAY['Row', '1.5 Rep Single-Arm Dumbbell Row']::TEXT[],
  'tempo', 'row', '1.5 Rep Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-single-arm-dumbbell-row', 'Row', 'Single-Arm Single-Arm Dumbbell Row', ARRAY['Row', 'Single-Arm Single-Arm Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Single-Arm Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-single-arm-dumbbell-row', 'Row', 'Single-Leg Single-Arm Dumbbell Row', ARRAY['Row', 'Single-Leg Single-Arm Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Single-Leg Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-single-arm-dumbbell-row', 'Row', 'Alternating Single-Arm Dumbbell Row', ARRAY['Row', 'Alternating Single-Arm Dumbbell Row']::TEXT[],
  'unilateral', 'row', 'Alternating Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-single-arm-dumbbell-row', 'Row', 'Half-Kneeling Single-Arm Dumbbell Row', ARRAY['Row', 'Half-Kneeling Single-Arm Dumbbell Row']::TEXT[],
  'stance', 'row', 'Half-Kneeling Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-single-arm-dumbbell-row', 'Row', 'Tall-Kneeling Single-Arm Dumbbell Row', ARRAY['Row', 'Tall-Kneeling Single-Arm Dumbbell Row']::TEXT[],
  'stance', 'row', 'Tall-Kneeling Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-single-arm-dumbbell-row', 'Row', 'Split-Stance Single-Arm Dumbbell Row', ARRAY['Row', 'Split-Stance Single-Arm Dumbbell Row']::TEXT[],
  'stance', 'row', 'Split-Stance Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-single-arm-dumbbell-row', 'Row', 'Close-Grip Single-Arm Dumbbell Row', ARRAY['Row', 'Close-Grip Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Close-Grip Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-single-arm-dumbbell-row', 'Row', 'Neutral-Grip Single-Arm Dumbbell Row', ARRAY['Row', 'Neutral-Grip Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Neutral-Grip Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-single-arm-dumbbell-row', 'Row', 'Wide-Grip Single-Arm Dumbbell Row', ARRAY['Row', 'Wide-Grip Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Wide-Grip Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-single-arm-dumbbell-row', 'Row', 'Underhand Single-Arm Dumbbell Row', ARRAY['Row', 'Underhand Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Underhand Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-single-arm-dumbbell-row', 'Row', 'Overhand Single-Arm Dumbbell Row', ARRAY['Row', 'Overhand Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Overhand Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-single-arm-dumbbell-row', 'Row', 'Pronated Single-Arm Dumbbell Row', ARRAY['Row', 'Pronated Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Pronated Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-single-arm-dumbbell-row', 'Row', 'Supinated Single-Arm Dumbbell Row', ARRAY['Row', 'Supinated Single-Arm Dumbbell Row']::TEXT[],
  'grip', 'row', 'Supinated Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-single-arm-dumbbell-row', 'Row', 'Incline Single-Arm Dumbbell Row', ARRAY['Row', 'Incline Single-Arm Dumbbell Row']::TEXT[],
  'angle', 'row', 'Incline Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-single-arm-dumbbell-row', 'Row', 'Decline Single-Arm Dumbbell Row', ARRAY['Row', 'Decline Single-Arm Dumbbell Row']::TEXT[],
  'angle', 'row', 'Decline Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-single-arm-dumbbell-row', 'Row', 'Long-ROM Single-Arm Dumbbell Row', ARRAY['Row', 'Long-ROM Single-Arm Dumbbell Row']::TEXT[],
  'angle', 'row', 'Long-ROM Single-Arm Dumbbell Row is a standardized exercise variation derived from the Row movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'latissimus-dorsi', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row') AND muscle_id = 'latissimus-dorsi'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'rhomboids', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row') AND muscle_id = 'rhomboids'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'biceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row') AND muscle_id = 'biceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'horizontal-pull', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-row'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-barbell-back-squat', 'Back Squat', 'Paused Barbell Back Squat', ARRAY['Back Squat', 'Paused Barbell Back Squat']::TEXT[],
  'tempo', 'back-squat', 'Paused Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-barbell-back-squat', 'Back Squat', 'Tempo Barbell Back Squat', ARRAY['Back Squat', 'Tempo Barbell Back Squat']::TEXT[],
  'tempo', 'back-squat', 'Tempo Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-barbell-back-squat', 'Back Squat', 'Slow Eccentric Barbell Back Squat', ARRAY['Back Squat', 'Slow Eccentric Barbell Back Squat']::TEXT[],
  'tempo', 'back-squat', 'Slow Eccentric Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-barbell-back-squat', 'Back Squat', '1.5 Rep Barbell Back Squat', ARRAY['Back Squat', '1.5 Rep Barbell Back Squat']::TEXT[],
  'tempo', 'back-squat', '1.5 Rep Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-barbell-back-squat', 'Back Squat', 'Single-Arm Barbell Back Squat', ARRAY['Back Squat', 'Single-Arm Barbell Back Squat']::TEXT[],
  'unilateral', 'back-squat', 'Single-Arm Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-barbell-back-squat', 'Back Squat', 'Single-Leg Barbell Back Squat', ARRAY['Back Squat', 'Single-Leg Barbell Back Squat']::TEXT[],
  'unilateral', 'back-squat', 'Single-Leg Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-barbell-back-squat', 'Back Squat', 'Alternating Barbell Back Squat', ARRAY['Back Squat', 'Alternating Barbell Back Squat']::TEXT[],
  'unilateral', 'back-squat', 'Alternating Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-barbell-back-squat', 'Back Squat', 'Half-Kneeling Barbell Back Squat', ARRAY['Back Squat', 'Half-Kneeling Barbell Back Squat']::TEXT[],
  'stance', 'back-squat', 'Half-Kneeling Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-barbell-back-squat', 'Back Squat', 'Tall-Kneeling Barbell Back Squat', ARRAY['Back Squat', 'Tall-Kneeling Barbell Back Squat']::TEXT[],
  'stance', 'back-squat', 'Tall-Kneeling Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-barbell-back-squat', 'Back Squat', 'Split-Stance Barbell Back Squat', ARRAY['Back Squat', 'Split-Stance Barbell Back Squat']::TEXT[],
  'stance', 'back-squat', 'Split-Stance Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-barbell-back-squat', 'Back Squat', 'Close-Grip Barbell Back Squat', ARRAY['Back Squat', 'Close-Grip Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Close-Grip Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-barbell-back-squat', 'Back Squat', 'Neutral-Grip Barbell Back Squat', ARRAY['Back Squat', 'Neutral-Grip Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Neutral-Grip Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-barbell-back-squat', 'Back Squat', 'Wide-Grip Barbell Back Squat', ARRAY['Back Squat', 'Wide-Grip Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Wide-Grip Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-barbell-back-squat', 'Back Squat', 'Underhand Barbell Back Squat', ARRAY['Back Squat', 'Underhand Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Underhand Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-barbell-back-squat', 'Back Squat', 'Overhand Barbell Back Squat', ARRAY['Back Squat', 'Overhand Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Overhand Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-barbell-back-squat', 'Back Squat', 'Pronated Barbell Back Squat', ARRAY['Back Squat', 'Pronated Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Pronated Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-barbell-back-squat', 'Back Squat', 'Supinated Barbell Back Squat', ARRAY['Back Squat', 'Supinated Barbell Back Squat']::TEXT[],
  'grip', 'back-squat', 'Supinated Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-barbell-back-squat', 'Back Squat', 'Incline Barbell Back Squat', ARRAY['Back Squat', 'Incline Barbell Back Squat']::TEXT[],
  'angle', 'back-squat', 'Incline Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-barbell-back-squat', 'Back Squat', 'Decline Barbell Back Squat', ARRAY['Back Squat', 'Decline Barbell Back Squat']::TEXT[],
  'angle', 'back-squat', 'Decline Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-barbell-back-squat', 'Back Squat', 'Long-ROM Barbell Back Squat', ARRAY['Back Squat', 'Long-ROM Barbell Back Squat']::TEXT[],
  'angle', 'back-squat', 'Long-ROM Barbell Back Squat is a standardized exercise variation derived from the Back Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-back-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-front-squat', 'Front Squat', 'Paused Front Squat', ARRAY['Front Squat', 'Paused Front Squat']::TEXT[],
  'tempo', 'front-squat', 'Paused Front Squat is a standardized exercise variation derived from the Front Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-front-squat'), 'advanced', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-front-squat', 'Front Squat', 'Tempo Front Squat', ARRAY['Front Squat', 'Tempo Front Squat']::TEXT[],
  'tempo', 'front-squat', 'Tempo Front Squat is a standardized exercise variation derived from the Front Squat movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'gluteus-maximus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'adductors', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat') AND muscle_id = 'adductors'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-front-squat'), 'advanced', 3,
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
