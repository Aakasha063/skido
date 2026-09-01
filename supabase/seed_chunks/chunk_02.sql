BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-dumbbell-bench-press', 'Bench Press', 'Underhand Dumbbell Bench Press', ARRAY['Bench Press', 'Underhand Dumbbell Bench Press']::TEXT[],
  'grip', 'bench-press', 'Underhand Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-dumbbell-bench-press', 'Bench Press', 'Overhand Dumbbell Bench Press', ARRAY['Bench Press', 'Overhand Dumbbell Bench Press']::TEXT[],
  'grip', 'bench-press', 'Overhand Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-dumbbell-bench-press', 'Bench Press', 'Pronated Dumbbell Bench Press', ARRAY['Bench Press', 'Pronated Dumbbell Bench Press']::TEXT[],
  'grip', 'bench-press', 'Pronated Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-dumbbell-bench-press', 'Bench Press', 'Supinated Dumbbell Bench Press', ARRAY['Bench Press', 'Supinated Dumbbell Bench Press']::TEXT[],
  'grip', 'bench-press', 'Supinated Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-dumbbell-bench-press', 'Bench Press', 'Incline Dumbbell Bench Press', ARRAY['Bench Press', 'Incline Dumbbell Bench Press']::TEXT[],
  'angle', 'bench-press', 'Incline Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-dumbbell-bench-press', 'Bench Press', 'Decline Dumbbell Bench Press', ARRAY['Bench Press', 'Decline Dumbbell Bench Press']::TEXT[],
  'angle', 'bench-press', 'Decline Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-dumbbell-bench-press', 'Bench Press', 'Long-ROM Dumbbell Bench Press', ARRAY['Bench Press', 'Long-ROM Dumbbell Bench Press']::TEXT[],
  'angle', 'bench-press', 'Long-ROM Dumbbell Bench Press is a standardized exercise variation derived from the Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-dumbbell-bench-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-incline-dumbbell-press', 'Incline Press', 'Paused Incline Dumbbell Press', ARRAY['Incline Press', 'Paused Incline Dumbbell Press']::TEXT[],
  'tempo', 'incline-press', 'Paused Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-incline-dumbbell-press', 'Incline Press', 'Tempo Incline Dumbbell Press', ARRAY['Incline Press', 'Tempo Incline Dumbbell Press']::TEXT[],
  'tempo', 'incline-press', 'Tempo Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-incline-dumbbell-press', 'Incline Press', 'Slow Eccentric Incline Dumbbell Press', ARRAY['Incline Press', 'Slow Eccentric Incline Dumbbell Press']::TEXT[],
  'tempo', 'incline-press', 'Slow Eccentric Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-incline-dumbbell-press', 'Incline Press', '1.5 Rep Incline Dumbbell Press', ARRAY['Incline Press', '1.5 Rep Incline Dumbbell Press']::TEXT[],
  'tempo', 'incline-press', '1.5 Rep Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-incline-dumbbell-press', 'Incline Press', 'Single-Arm Incline Dumbbell Press', ARRAY['Incline Press', 'Single-Arm Incline Dumbbell Press']::TEXT[],
  'unilateral', 'incline-press', 'Single-Arm Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-incline-dumbbell-press', 'Incline Press', 'Single-Leg Incline Dumbbell Press', ARRAY['Incline Press', 'Single-Leg Incline Dumbbell Press']::TEXT[],
  'unilateral', 'incline-press', 'Single-Leg Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-incline-dumbbell-press', 'Incline Press', 'Alternating Incline Dumbbell Press', ARRAY['Incline Press', 'Alternating Incline Dumbbell Press']::TEXT[],
  'unilateral', 'incline-press', 'Alternating Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-incline-dumbbell-press', 'Incline Press', 'Half-Kneeling Incline Dumbbell Press', ARRAY['Incline Press', 'Half-Kneeling Incline Dumbbell Press']::TEXT[],
  'stance', 'incline-press', 'Half-Kneeling Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-incline-dumbbell-press', 'Incline Press', 'Tall-Kneeling Incline Dumbbell Press', ARRAY['Incline Press', 'Tall-Kneeling Incline Dumbbell Press']::TEXT[],
  'stance', 'incline-press', 'Tall-Kneeling Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-incline-dumbbell-press', 'Incline Press', 'Split-Stance Incline Dumbbell Press', ARRAY['Incline Press', 'Split-Stance Incline Dumbbell Press']::TEXT[],
  'stance', 'incline-press', 'Split-Stance Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-incline-dumbbell-press', 'Incline Press', 'Close-Grip Incline Dumbbell Press', ARRAY['Incline Press', 'Close-Grip Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Close-Grip Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-incline-dumbbell-press', 'Incline Press', 'Neutral-Grip Incline Dumbbell Press', ARRAY['Incline Press', 'Neutral-Grip Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Neutral-Grip Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-incline-dumbbell-press', 'Incline Press', 'Wide-Grip Incline Dumbbell Press', ARRAY['Incline Press', 'Wide-Grip Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Wide-Grip Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-incline-dumbbell-press', 'Incline Press', 'Underhand Incline Dumbbell Press', ARRAY['Incline Press', 'Underhand Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Underhand Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-incline-dumbbell-press', 'Incline Press', 'Overhand Incline Dumbbell Press', ARRAY['Incline Press', 'Overhand Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Overhand Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-incline-dumbbell-press', 'Incline Press', 'Pronated Incline Dumbbell Press', ARRAY['Incline Press', 'Pronated Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Pronated Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-incline-dumbbell-press', 'Incline Press', 'Supinated Incline Dumbbell Press', ARRAY['Incline Press', 'Supinated Incline Dumbbell Press']::TEXT[],
  'grip', 'incline-press', 'Supinated Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-incline-dumbbell-press', 'Incline Press', 'Incline Incline Dumbbell Press', ARRAY['Incline Press', 'Incline Incline Dumbbell Press']::TEXT[],
  'angle', 'incline-press', 'Incline Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-incline-dumbbell-press', 'Incline Press', 'Decline Incline Dumbbell Press', ARRAY['Incline Press', 'Decline Incline Dumbbell Press']::TEXT[],
  'angle', 'incline-press', 'Decline Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-incline-dumbbell-press', 'Incline Press', 'Long-ROM Incline Dumbbell Press', ARRAY['Incline Press', 'Long-ROM Incline Dumbbell Press']::TEXT[],
  'angle', 'incline-press', 'Long-ROM Incline Dumbbell Press is a standardized exercise variation derived from the Incline Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'pectoralis-major', 'chest-upper', 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-dumbbell-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-single-arm-dumbbell-chest-press', 'Chest Press', 'Paused Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Paused Single-Arm Dumbbell Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Paused Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-single-arm-dumbbell-chest-press', 'Chest Press', 'Tempo Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Tempo Single-Arm Dumbbell Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Tempo Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-single-arm-dumbbell-chest-press', 'Chest Press', 'Slow Eccentric Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Slow Eccentric Single-Arm Dumbbell Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Slow Eccentric Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-single-arm-dumbbell-chest-press', 'Chest Press', '1.5 Rep Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', '1.5 Rep Single-Arm Dumbbell Chest Press']::TEXT[],
  'tempo', 'chest-press', '1.5 Rep Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-single-arm-dumbbell-chest-press', 'Chest Press', 'Single-Arm Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Single-Arm Single-Arm Dumbbell Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Single-Arm Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-single-arm-dumbbell-chest-press', 'Chest Press', 'Single-Leg Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Single-Leg Single-Arm Dumbbell Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Single-Leg Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-single-arm-dumbbell-chest-press', 'Chest Press', 'Alternating Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Alternating Single-Arm Dumbbell Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Alternating Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-single-arm-dumbbell-chest-press', 'Chest Press', 'Half-Kneeling Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Half-Kneeling Single-Arm Dumbbell Chest Press']::TEXT[],
  'stance', 'chest-press', 'Half-Kneeling Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-single-arm-dumbbell-chest-press', 'Chest Press', 'Tall-Kneeling Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Tall-Kneeling Single-Arm Dumbbell Chest Press']::TEXT[],
  'stance', 'chest-press', 'Tall-Kneeling Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-single-arm-dumbbell-chest-press', 'Chest Press', 'Split-Stance Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Split-Stance Single-Arm Dumbbell Chest Press']::TEXT[],
  'stance', 'chest-press', 'Split-Stance Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-single-arm-dumbbell-chest-press', 'Chest Press', 'Close-Grip Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Close-Grip Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Close-Grip Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-single-arm-dumbbell-chest-press', 'Chest Press', 'Neutral-Grip Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Neutral-Grip Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Neutral-Grip Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-single-arm-dumbbell-chest-press', 'Chest Press', 'Wide-Grip Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Wide-Grip Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Wide-Grip Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-single-arm-dumbbell-chest-press', 'Chest Press', 'Underhand Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Underhand Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Underhand Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-single-arm-dumbbell-chest-press', 'Chest Press', 'Overhand Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Overhand Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Overhand Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-single-arm-dumbbell-chest-press', 'Chest Press', 'Pronated Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Pronated Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Pronated Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-single-arm-dumbbell-chest-press', 'Chest Press', 'Supinated Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Supinated Single-Arm Dumbbell Chest Press']::TEXT[],
  'grip', 'chest-press', 'Supinated Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-single-arm-dumbbell-chest-press', 'Chest Press', 'Incline Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Incline Single-Arm Dumbbell Chest Press']::TEXT[],
  'angle', 'chest-press', 'Incline Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-single-arm-dumbbell-chest-press', 'Chest Press', 'Decline Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Decline Single-Arm Dumbbell Chest Press']::TEXT[],
  'angle', 'chest-press', 'Decline Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-single-arm-dumbbell-chest-press', 'Chest Press', 'Long-ROM Single-Arm Dumbbell Chest Press', ARRAY['Chest Press', 'Long-ROM Single-Arm Dumbbell Chest Press']::TEXT[],
  'angle', 'chest-press', 'Long-ROM Single-Arm Dumbbell Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'dumbbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-arm-dumbbell-chest-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-machine-chest-press', 'Chest Press', 'Paused Machine Chest Press', ARRAY['Chest Press', 'Paused Machine Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Paused Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-machine-chest-press', 'Chest Press', 'Tempo Machine Chest Press', ARRAY['Chest Press', 'Tempo Machine Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Tempo Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-machine-chest-press', 'Chest Press', 'Slow Eccentric Machine Chest Press', ARRAY['Chest Press', 'Slow Eccentric Machine Chest Press']::TEXT[],
  'tempo', 'chest-press', 'Slow Eccentric Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-machine-chest-press', 'Chest Press', '1.5 Rep Machine Chest Press', ARRAY['Chest Press', '1.5 Rep Machine Chest Press']::TEXT[],
  'tempo', 'chest-press', '1.5 Rep Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-machine-chest-press', 'Chest Press', 'Single-Arm Machine Chest Press', ARRAY['Chest Press', 'Single-Arm Machine Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Single-Arm Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-machine-chest-press', 'Chest Press', 'Single-Leg Machine Chest Press', ARRAY['Chest Press', 'Single-Leg Machine Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Single-Leg Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-machine-chest-press', 'Chest Press', 'Alternating Machine Chest Press', ARRAY['Chest Press', 'Alternating Machine Chest Press']::TEXT[],
  'unilateral', 'chest-press', 'Alternating Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-machine-chest-press', 'Chest Press', 'Half-Kneeling Machine Chest Press', ARRAY['Chest Press', 'Half-Kneeling Machine Chest Press']::TEXT[],
  'stance', 'chest-press', 'Half-Kneeling Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-machine-chest-press', 'Chest Press', 'Tall-Kneeling Machine Chest Press', ARRAY['Chest Press', 'Tall-Kneeling Machine Chest Press']::TEXT[],
  'stance', 'chest-press', 'Tall-Kneeling Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-machine-chest-press', 'Chest Press', 'Split-Stance Machine Chest Press', ARRAY['Chest Press', 'Split-Stance Machine Chest Press']::TEXT[],
  'stance', 'chest-press', 'Split-Stance Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-machine-chest-press', 'Chest Press', 'Close-Grip Machine Chest Press', ARRAY['Chest Press', 'Close-Grip Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Close-Grip Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-machine-chest-press', 'Chest Press', 'Neutral-Grip Machine Chest Press', ARRAY['Chest Press', 'Neutral-Grip Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Neutral-Grip Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-machine-chest-press', 'Chest Press', 'Wide-Grip Machine Chest Press', ARRAY['Chest Press', 'Wide-Grip Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Wide-Grip Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-machine-chest-press', 'Chest Press', 'Underhand Machine Chest Press', ARRAY['Chest Press', 'Underhand Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Underhand Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-machine-chest-press', 'Chest Press', 'Overhand Machine Chest Press', ARRAY['Chest Press', 'Overhand Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Overhand Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-machine-chest-press', 'Chest Press', 'Pronated Machine Chest Press', ARRAY['Chest Press', 'Pronated Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Pronated Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-machine-chest-press', 'Chest Press', 'Supinated Machine Chest Press', ARRAY['Chest Press', 'Supinated Machine Chest Press']::TEXT[],
  'grip', 'chest-press', 'Supinated Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-machine-chest-press', 'Chest Press', 'Incline Machine Chest Press', ARRAY['Chest Press', 'Incline Machine Chest Press']::TEXT[],
  'angle', 'chest-press', 'Incline Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-machine-chest-press', 'Chest Press', 'Decline Machine Chest Press', ARRAY['Chest Press', 'Decline Machine Chest Press']::TEXT[],
  'angle', 'chest-press', 'Decline Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-machine-chest-press', 'Chest Press', 'Long-ROM Machine Chest Press', ARRAY['Chest Press', 'Long-ROM Machine Chest Press']::TEXT[],
  'angle', 'chest-press', 'Long-ROM Machine Chest Press is a standardized exercise variation derived from the Chest Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-chest-press'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-push-up', 'Push-Up', 'Paused Push-Up', ARRAY['Push-Up', 'Paused Push-Up']::TEXT[],
  'tempo', 'push-up', 'Paused Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-push-up', 'Push-Up', 'Tempo Push-Up', ARRAY['Push-Up', 'Tempo Push-Up']::TEXT[],
  'tempo', 'push-up', 'Tempo Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-push-up', 'Push-Up', 'Slow Eccentric Push-Up', ARRAY['Push-Up', 'Slow Eccentric Push-Up']::TEXT[],
  'tempo', 'push-up', 'Slow Eccentric Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-push-up', 'Push-Up', '1.5 Rep Push-Up', ARRAY['Push-Up', '1.5 Rep Push-Up']::TEXT[],
  'tempo', 'push-up', '1.5 Rep Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-push-up', 'Push-Up', 'Alternating Push-Up', ARRAY['Push-Up', 'Alternating Push-Up']::TEXT[],
  'unilateral', 'push-up', 'Alternating Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-push-up', 'Push-Up', 'Half-Kneeling Push-Up', ARRAY['Push-Up', 'Half-Kneeling Push-Up']::TEXT[],
  'stance', 'push-up', 'Half-Kneeling Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-push-up', 'Push-Up', 'Tall-Kneeling Push-Up', ARRAY['Push-Up', 'Tall-Kneeling Push-Up']::TEXT[],
  'stance', 'push-up', 'Tall-Kneeling Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-push-up', 'Push-Up', 'Split-Stance Push-Up', ARRAY['Push-Up', 'Split-Stance Push-Up']::TEXT[],
  'stance', 'push-up', 'Split-Stance Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-push-up', 'Push-Up', 'Neutral-Grip Push-Up', ARRAY['Push-Up', 'Neutral-Grip Push-Up']::TEXT[],
  'grip', 'push-up', 'Neutral-Grip Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-push-up', 'Push-Up', 'Wide-Grip Push-Up', ARRAY['Push-Up', 'Wide-Grip Push-Up']::TEXT[],
  'grip', 'push-up', 'Wide-Grip Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-push-up', 'Push-Up', 'Underhand Push-Up', ARRAY['Push-Up', 'Underhand Push-Up']::TEXT[],
  'grip', 'push-up', 'Underhand Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-push-up', 'Push-Up', 'Overhand Push-Up', ARRAY['Push-Up', 'Overhand Push-Up']::TEXT[],
  'grip', 'push-up', 'Overhand Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-push-up', 'Push-Up', 'Pronated Push-Up', ARRAY['Push-Up', 'Pronated Push-Up']::TEXT[],
  'grip', 'push-up', 'Pronated Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-push-up', 'Push-Up', 'Supinated Push-Up', ARRAY['Push-Up', 'Supinated Push-Up']::TEXT[],
  'grip', 'push-up', 'Supinated Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-push-up', 'Push-Up', 'Long-ROM Push-Up', ARRAY['Push-Up', 'Long-ROM Push-Up']::TEXT[],
  'angle', 'push-up', 'Long-ROM Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-incline-push-up', 'Push-Up', 'Paused Incline Push-Up', ARRAY['Push-Up', 'Paused Incline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Paused Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-incline-push-up', 'Push-Up', 'Tempo Incline Push-Up', ARRAY['Push-Up', 'Tempo Incline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Tempo Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-incline-push-up', 'Push-Up', 'Slow Eccentric Incline Push-Up', ARRAY['Push-Up', 'Slow Eccentric Incline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Slow Eccentric Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-incline-push-up', 'Push-Up', '1.5 Rep Incline Push-Up', ARRAY['Push-Up', '1.5 Rep Incline Push-Up']::TEXT[],
  'tempo', 'push-up', '1.5 Rep Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-incline-push-up', 'Push-Up', 'Alternating Incline Push-Up', ARRAY['Push-Up', 'Alternating Incline Push-Up']::TEXT[],
  'unilateral', 'push-up', 'Alternating Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-incline-push-up', 'Push-Up', 'Half-Kneeling Incline Push-Up', ARRAY['Push-Up', 'Half-Kneeling Incline Push-Up']::TEXT[],
  'stance', 'push-up', 'Half-Kneeling Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-incline-push-up', 'Push-Up', 'Tall-Kneeling Incline Push-Up', ARRAY['Push-Up', 'Tall-Kneeling Incline Push-Up']::TEXT[],
  'stance', 'push-up', 'Tall-Kneeling Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-incline-push-up', 'Push-Up', 'Split-Stance Incline Push-Up', ARRAY['Push-Up', 'Split-Stance Incline Push-Up']::TEXT[],
  'stance', 'push-up', 'Split-Stance Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-incline-push-up', 'Push-Up', 'Close-Grip Incline Push-Up', ARRAY['Push-Up', 'Close-Grip Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Close-Grip Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-incline-push-up', 'Push-Up', 'Neutral-Grip Incline Push-Up', ARRAY['Push-Up', 'Neutral-Grip Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Neutral-Grip Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-incline-push-up', 'Push-Up', 'Wide-Grip Incline Push-Up', ARRAY['Push-Up', 'Wide-Grip Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Wide-Grip Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-incline-push-up', 'Push-Up', 'Underhand Incline Push-Up', ARRAY['Push-Up', 'Underhand Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Underhand Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-incline-push-up', 'Push-Up', 'Overhand Incline Push-Up', ARRAY['Push-Up', 'Overhand Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Overhand Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-incline-push-up', 'Push-Up', 'Pronated Incline Push-Up', ARRAY['Push-Up', 'Pronated Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Pronated Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-incline-push-up', 'Push-Up', 'Supinated Incline Push-Up', ARRAY['Push-Up', 'Supinated Incline Push-Up']::TEXT[],
  'grip', 'push-up', 'Supinated Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-incline-push-up', 'Push-Up', 'Incline Incline Push-Up', ARRAY['Push-Up', 'Incline Incline Push-Up']::TEXT[],
  'angle', 'push-up', 'Incline Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-incline-push-up', 'Push-Up', 'Decline Incline Push-Up', ARRAY['Push-Up', 'Decline Incline Push-Up']::TEXT[],
  'angle', 'push-up', 'Decline Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-incline-push-up', 'Push-Up', 'Long-ROM Incline Push-Up', ARRAY['Push-Up', 'Long-ROM Incline Push-Up']::TEXT[],
  'angle', 'push-up', 'Long-ROM Incline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-incline-push-up'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-decline-push-up', 'Push-Up', 'Paused Decline Push-Up', ARRAY['Push-Up', 'Paused Decline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Paused Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-decline-push-up', 'Push-Up', 'Tempo Decline Push-Up', ARRAY['Push-Up', 'Tempo Decline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Tempo Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-decline-push-up', 'Push-Up', 'Slow Eccentric Decline Push-Up', ARRAY['Push-Up', 'Slow Eccentric Decline Push-Up']::TEXT[],
  'tempo', 'push-up', 'Slow Eccentric Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-decline-push-up', 'Push-Up', '1.5 Rep Decline Push-Up', ARRAY['Push-Up', '1.5 Rep Decline Push-Up']::TEXT[],
  'tempo', 'push-up', '1.5 Rep Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-decline-push-up', 'Push-Up', 'Alternating Decline Push-Up', ARRAY['Push-Up', 'Alternating Decline Push-Up']::TEXT[],
  'unilateral', 'push-up', 'Alternating Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-decline-push-up', 'Push-Up', 'Half-Kneeling Decline Push-Up', ARRAY['Push-Up', 'Half-Kneeling Decline Push-Up']::TEXT[],
  'stance', 'push-up', 'Half-Kneeling Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-decline-push-up', 'Push-Up', 'Tall-Kneeling Decline Push-Up', ARRAY['Push-Up', 'Tall-Kneeling Decline Push-Up']::TEXT[],
  'stance', 'push-up', 'Tall-Kneeling Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-decline-push-up', 'Push-Up', 'Split-Stance Decline Push-Up', ARRAY['Push-Up', 'Split-Stance Decline Push-Up']::TEXT[],
  'stance', 'push-up', 'Split-Stance Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-decline-push-up', 'Push-Up', 'Close-Grip Decline Push-Up', ARRAY['Push-Up', 'Close-Grip Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Close-Grip Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-decline-push-up', 'Push-Up', 'Neutral-Grip Decline Push-Up', ARRAY['Push-Up', 'Neutral-Grip Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Neutral-Grip Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-decline-push-up', 'Push-Up', 'Wide-Grip Decline Push-Up', ARRAY['Push-Up', 'Wide-Grip Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Wide-Grip Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-decline-push-up', 'Push-Up', 'Underhand Decline Push-Up', ARRAY['Push-Up', 'Underhand Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Underhand Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-decline-push-up', 'Push-Up', 'Overhand Decline Push-Up', ARRAY['Push-Up', 'Overhand Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Overhand Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-decline-push-up', 'Push-Up', 'Pronated Decline Push-Up', ARRAY['Push-Up', 'Pronated Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Pronated Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-decline-push-up', 'Push-Up', 'Supinated Decline Push-Up', ARRAY['Push-Up', 'Supinated Decline Push-Up']::TEXT[],
  'grip', 'push-up', 'Supinated Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-decline-push-up', 'Push-Up', 'Incline Decline Push-Up', ARRAY['Push-Up', 'Incline Decline Push-Up']::TEXT[],
  'angle', 'push-up', 'Incline Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-decline-push-up', 'Push-Up', 'Decline Decline Push-Up', ARRAY['Push-Up', 'Decline Decline Push-Up']::TEXT[],
  'angle', 'push-up', 'Decline Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-decline-push-up', 'Push-Up', 'Long-ROM Decline Push-Up', ARRAY['Push-Up', 'Long-ROM Decline Push-Up']::TEXT[],
  'angle', 'push-up', 'Long-ROM Decline Push-Up is a standardized exercise variation derived from the Push-Up movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'triceps-brachii', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-decline-push-up'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-close-grip-bench-press', 'Close-Grip Bench Press', 'Paused Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Paused Close-Grip Bench Press']::TEXT[],
  'tempo', 'close-grip-bench-press', 'Paused Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-close-grip-bench-press', 'Close-Grip Bench Press', 'Tempo Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Tempo Close-Grip Bench Press']::TEXT[],
  'tempo', 'close-grip-bench-press', 'Tempo Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-close-grip-bench-press', 'Close-Grip Bench Press', 'Slow Eccentric Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Slow Eccentric Close-Grip Bench Press']::TEXT[],
  'tempo', 'close-grip-bench-press', 'Slow Eccentric Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-close-grip-bench-press', 'Close-Grip Bench Press', '1.5 Rep Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', '1.5 Rep Close-Grip Bench Press']::TEXT[],
  'tempo', 'close-grip-bench-press', '1.5 Rep Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-close-grip-bench-press', 'Close-Grip Bench Press', 'Single-Arm Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Single-Arm Close-Grip Bench Press']::TEXT[],
  'unilateral', 'close-grip-bench-press', 'Single-Arm Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-close-grip-bench-press', 'Close-Grip Bench Press', 'Single-Leg Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Single-Leg Close-Grip Bench Press']::TEXT[],
  'unilateral', 'close-grip-bench-press', 'Single-Leg Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-close-grip-bench-press', 'Close-Grip Bench Press', 'Alternating Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Alternating Close-Grip Bench Press']::TEXT[],
  'unilateral', 'close-grip-bench-press', 'Alternating Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-close-grip-bench-press', 'Close-Grip Bench Press', 'Half-Kneeling Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Half-Kneeling Close-Grip Bench Press']::TEXT[],
  'stance', 'close-grip-bench-press', 'Half-Kneeling Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-close-grip-bench-press', 'Close-Grip Bench Press', 'Tall-Kneeling Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Tall-Kneeling Close-Grip Bench Press']::TEXT[],
  'stance', 'close-grip-bench-press', 'Tall-Kneeling Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-close-grip-bench-press', 'Close-Grip Bench Press', 'Split-Stance Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Split-Stance Close-Grip Bench Press']::TEXT[],
  'stance', 'close-grip-bench-press', 'Split-Stance Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-close-grip-bench-press', 'Close-Grip Bench Press', 'Close-Grip Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Close-Grip Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Close-Grip Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-close-grip-bench-press', 'Close-Grip Bench Press', 'Neutral-Grip Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Neutral-Grip Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Neutral-Grip Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-close-grip-bench-press', 'Close-Grip Bench Press', 'Wide-Grip Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Wide-Grip Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Wide-Grip Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-close-grip-bench-press', 'Close-Grip Bench Press', 'Underhand Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Underhand Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Underhand Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-close-grip-bench-press', 'Close-Grip Bench Press', 'Overhand Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Overhand Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Overhand Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-close-grip-bench-press', 'Close-Grip Bench Press', 'Pronated Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Pronated Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Pronated Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-close-grip-bench-press', 'Close-Grip Bench Press', 'Supinated Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Supinated Close-Grip Bench Press']::TEXT[],
  'grip', 'close-grip-bench-press', 'Supinated Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-close-grip-bench-press', 'Close-Grip Bench Press', 'Incline Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Incline Close-Grip Bench Press']::TEXT[],
  'angle', 'close-grip-bench-press', 'Incline Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-close-grip-bench-press', 'Close-Grip Bench Press', 'Decline Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Decline Close-Grip Bench Press']::TEXT[],
  'angle', 'close-grip-bench-press', 'Decline Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-close-grip-bench-press', 'Close-Grip Bench Press', 'Long-ROM Close-Grip Bench Press', ARRAY['Close-Grip Bench Press', 'Long-ROM Close-Grip Bench Press']::TEXT[],
  'angle', 'close-grip-bench-press', 'Long-ROM Close-Grip Bench Press is a standardized exercise variation derived from the Close-Grip Bench Press movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'triceps-brachii', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press') AND muscle_id = 'triceps-brachii'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'pectoralis-major', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'rack', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-close-grip-bench-press'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-cable-chest-fly', 'Chest Fly', 'Paused Cable Chest Fly', ARRAY['Chest Fly', 'Paused Cable Chest Fly']::TEXT[],
  'tempo', 'chest-fly', 'Paused Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-cable-chest-fly', 'Chest Fly', 'Tempo Cable Chest Fly', ARRAY['Chest Fly', 'Tempo Cable Chest Fly']::TEXT[],
  'tempo', 'chest-fly', 'Tempo Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-cable-chest-fly', 'Chest Fly', 'Slow Eccentric Cable Chest Fly', ARRAY['Chest Fly', 'Slow Eccentric Cable Chest Fly']::TEXT[],
  'tempo', 'chest-fly', 'Slow Eccentric Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-cable-chest-fly', 'Chest Fly', '1.5 Rep Cable Chest Fly', ARRAY['Chest Fly', '1.5 Rep Cable Chest Fly']::TEXT[],
  'tempo', 'chest-fly', '1.5 Rep Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-cable-chest-fly', 'Chest Fly', 'Single-Arm Cable Chest Fly', ARRAY['Chest Fly', 'Single-Arm Cable Chest Fly']::TEXT[],
  'unilateral', 'chest-fly', 'Single-Arm Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-cable-chest-fly', 'Chest Fly', 'Single-Leg Cable Chest Fly', ARRAY['Chest Fly', 'Single-Leg Cable Chest Fly']::TEXT[],
  'unilateral', 'chest-fly', 'Single-Leg Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-cable-chest-fly', 'Chest Fly', 'Alternating Cable Chest Fly', ARRAY['Chest Fly', 'Alternating Cable Chest Fly']::TEXT[],
  'unilateral', 'chest-fly', 'Alternating Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-cable-chest-fly', 'Chest Fly', 'Half-Kneeling Cable Chest Fly', ARRAY['Chest Fly', 'Half-Kneeling Cable Chest Fly']::TEXT[],
  'stance', 'chest-fly', 'Half-Kneeling Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-cable-chest-fly', 'Chest Fly', 'Tall-Kneeling Cable Chest Fly', ARRAY['Chest Fly', 'Tall-Kneeling Cable Chest Fly']::TEXT[],
  'stance', 'chest-fly', 'Tall-Kneeling Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-cable-chest-fly', 'Chest Fly', 'Split-Stance Cable Chest Fly', ARRAY['Chest Fly', 'Split-Stance Cable Chest Fly']::TEXT[],
  'stance', 'chest-fly', 'Split-Stance Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-cable-chest-fly', 'Chest Fly', 'Close-Grip Cable Chest Fly', ARRAY['Chest Fly', 'Close-Grip Cable Chest Fly']::TEXT[],
  'grip', 'chest-fly', 'Close-Grip Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-cable-chest-fly'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-cable-chest-fly', 'Chest Fly', 'Neutral-Grip Cable Chest Fly', ARRAY['Chest Fly', 'Neutral-Grip Cable Chest Fly']::TEXT[],
  'grip', 'chest-fly', 'Neutral-Grip Cable Chest Fly is a standardized exercise variation derived from the Chest Fly movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly'), 'pectoralis-major', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly') AND muscle_id = 'pectoralis-major'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly'), 'anterior-deltoid', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly') AND muscle_id = 'anterior-deltoid'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly'), 'horizontal-push', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly'), 'cable', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-cable-chest-fly'), 'beginner', 3,
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
