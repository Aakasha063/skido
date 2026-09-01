BEGIN;


INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-barbell-hip-thrust', 'Hip Thrust', 'Slow Eccentric Barbell Hip Thrust', ARRAY['Hip Thrust', 'Slow Eccentric Barbell Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Slow Eccentric Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-barbell-hip-thrust', 'Hip Thrust', '1.5 Rep Barbell Hip Thrust', ARRAY['Hip Thrust', '1.5 Rep Barbell Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', '1.5 Rep Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-barbell-hip-thrust', 'Hip Thrust', 'Single-Arm Barbell Hip Thrust', ARRAY['Hip Thrust', 'Single-Arm Barbell Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Single-Arm Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-barbell-hip-thrust', 'Hip Thrust', 'Single-Leg Barbell Hip Thrust', ARRAY['Hip Thrust', 'Single-Leg Barbell Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Single-Leg Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-barbell-hip-thrust', 'Hip Thrust', 'Alternating Barbell Hip Thrust', ARRAY['Hip Thrust', 'Alternating Barbell Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Alternating Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-barbell-hip-thrust', 'Hip Thrust', 'Half-Kneeling Barbell Hip Thrust', ARRAY['Hip Thrust', 'Half-Kneeling Barbell Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Half-Kneeling Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-barbell-hip-thrust', 'Hip Thrust', 'Tall-Kneeling Barbell Hip Thrust', ARRAY['Hip Thrust', 'Tall-Kneeling Barbell Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Tall-Kneeling Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-barbell-hip-thrust', 'Hip Thrust', 'Split-Stance Barbell Hip Thrust', ARRAY['Hip Thrust', 'Split-Stance Barbell Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Split-Stance Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-barbell-hip-thrust', 'Hip Thrust', 'Close-Grip Barbell Hip Thrust', ARRAY['Hip Thrust', 'Close-Grip Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Close-Grip Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-barbell-hip-thrust', 'Hip Thrust', 'Neutral-Grip Barbell Hip Thrust', ARRAY['Hip Thrust', 'Neutral-Grip Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Neutral-Grip Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-barbell-hip-thrust', 'Hip Thrust', 'Wide-Grip Barbell Hip Thrust', ARRAY['Hip Thrust', 'Wide-Grip Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Wide-Grip Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-barbell-hip-thrust', 'Hip Thrust', 'Underhand Barbell Hip Thrust', ARRAY['Hip Thrust', 'Underhand Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Underhand Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-barbell-hip-thrust', 'Hip Thrust', 'Overhand Barbell Hip Thrust', ARRAY['Hip Thrust', 'Overhand Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Overhand Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-barbell-hip-thrust', 'Hip Thrust', 'Pronated Barbell Hip Thrust', ARRAY['Hip Thrust', 'Pronated Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Pronated Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-barbell-hip-thrust', 'Hip Thrust', 'Supinated Barbell Hip Thrust', ARRAY['Hip Thrust', 'Supinated Barbell Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Supinated Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-barbell-hip-thrust', 'Hip Thrust', 'Incline Barbell Hip Thrust', ARRAY['Hip Thrust', 'Incline Barbell Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Incline Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-barbell-hip-thrust', 'Hip Thrust', 'Decline Barbell Hip Thrust', ARRAY['Hip Thrust', 'Decline Barbell Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Decline Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-barbell-hip-thrust', 'Hip Thrust', 'Long-ROM Barbell Hip Thrust', ARRAY['Hip Thrust', 'Long-ROM Barbell Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Long-ROM Barbell Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'barbell', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'bench', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-barbell-hip-thrust'), 'intermediate', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-machine-hip-thrust', 'Hip Thrust', 'Paused Machine Hip Thrust', ARRAY['Hip Thrust', 'Paused Machine Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Paused Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-machine-hip-thrust', 'Hip Thrust', 'Tempo Machine Hip Thrust', ARRAY['Hip Thrust', 'Tempo Machine Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Tempo Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-machine-hip-thrust', 'Hip Thrust', 'Slow Eccentric Machine Hip Thrust', ARRAY['Hip Thrust', 'Slow Eccentric Machine Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', 'Slow Eccentric Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-machine-hip-thrust', 'Hip Thrust', '1.5 Rep Machine Hip Thrust', ARRAY['Hip Thrust', '1.5 Rep Machine Hip Thrust']::TEXT[],
  'tempo', 'hip-thrust', '1.5 Rep Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-machine-hip-thrust', 'Hip Thrust', 'Single-Arm Machine Hip Thrust', ARRAY['Hip Thrust', 'Single-Arm Machine Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Single-Arm Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-machine-hip-thrust', 'Hip Thrust', 'Single-Leg Machine Hip Thrust', ARRAY['Hip Thrust', 'Single-Leg Machine Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Single-Leg Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-machine-hip-thrust', 'Hip Thrust', 'Alternating Machine Hip Thrust', ARRAY['Hip Thrust', 'Alternating Machine Hip Thrust']::TEXT[],
  'unilateral', 'hip-thrust', 'Alternating Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-machine-hip-thrust', 'Hip Thrust', 'Half-Kneeling Machine Hip Thrust', ARRAY['Hip Thrust', 'Half-Kneeling Machine Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Half-Kneeling Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-machine-hip-thrust', 'Hip Thrust', 'Tall-Kneeling Machine Hip Thrust', ARRAY['Hip Thrust', 'Tall-Kneeling Machine Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Tall-Kneeling Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-machine-hip-thrust', 'Hip Thrust', 'Split-Stance Machine Hip Thrust', ARRAY['Hip Thrust', 'Split-Stance Machine Hip Thrust']::TEXT[],
  'stance', 'hip-thrust', 'Split-Stance Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-machine-hip-thrust', 'Hip Thrust', 'Close-Grip Machine Hip Thrust', ARRAY['Hip Thrust', 'Close-Grip Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Close-Grip Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-machine-hip-thrust', 'Hip Thrust', 'Neutral-Grip Machine Hip Thrust', ARRAY['Hip Thrust', 'Neutral-Grip Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Neutral-Grip Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-machine-hip-thrust', 'Hip Thrust', 'Wide-Grip Machine Hip Thrust', ARRAY['Hip Thrust', 'Wide-Grip Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Wide-Grip Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-machine-hip-thrust', 'Hip Thrust', 'Underhand Machine Hip Thrust', ARRAY['Hip Thrust', 'Underhand Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Underhand Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-machine-hip-thrust', 'Hip Thrust', 'Overhand Machine Hip Thrust', ARRAY['Hip Thrust', 'Overhand Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Overhand Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-machine-hip-thrust', 'Hip Thrust', 'Pronated Machine Hip Thrust', ARRAY['Hip Thrust', 'Pronated Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Pronated Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-machine-hip-thrust', 'Hip Thrust', 'Supinated Machine Hip Thrust', ARRAY['Hip Thrust', 'Supinated Machine Hip Thrust']::TEXT[],
  'grip', 'hip-thrust', 'Supinated Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-machine-hip-thrust', 'Hip Thrust', 'Incline Machine Hip Thrust', ARRAY['Hip Thrust', 'Incline Machine Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Incline Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-machine-hip-thrust', 'Hip Thrust', 'Decline Machine Hip Thrust', ARRAY['Hip Thrust', 'Decline Machine Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Decline Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-machine-hip-thrust', 'Hip Thrust', 'Long-ROM Machine Hip Thrust', ARRAY['Hip Thrust', 'Long-ROM Machine Hip Thrust']::TEXT[],
  'angle', 'hip-thrust', 'Long-ROM Machine Hip Thrust is a standardized exercise variation derived from the Hip Thrust movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-hip-thrust'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-glute-bridge', 'Glute Bridge', 'Paused Glute Bridge', ARRAY['Glute Bridge', 'Paused Glute Bridge']::TEXT[],
  'tempo', 'glute-bridge', 'Paused Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-glute-bridge', 'Glute Bridge', 'Tempo Glute Bridge', ARRAY['Glute Bridge', 'Tempo Glute Bridge']::TEXT[],
  'tempo', 'glute-bridge', 'Tempo Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-glute-bridge', 'Glute Bridge', 'Slow Eccentric Glute Bridge', ARRAY['Glute Bridge', 'Slow Eccentric Glute Bridge']::TEXT[],
  'tempo', 'glute-bridge', 'Slow Eccentric Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-glute-bridge', 'Glute Bridge', '1.5 Rep Glute Bridge', ARRAY['Glute Bridge', '1.5 Rep Glute Bridge']::TEXT[],
  'tempo', 'glute-bridge', '1.5 Rep Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-glute-bridge', 'Glute Bridge', 'Single-Arm Glute Bridge', ARRAY['Glute Bridge', 'Single-Arm Glute Bridge']::TEXT[],
  'unilateral', 'glute-bridge', 'Single-Arm Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-glute-bridge', 'Glute Bridge', 'Single-Leg Glute Bridge', ARRAY['Glute Bridge', 'Single-Leg Glute Bridge']::TEXT[],
  'unilateral', 'glute-bridge', 'Single-Leg Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-glute-bridge', 'Glute Bridge', 'Alternating Glute Bridge', ARRAY['Glute Bridge', 'Alternating Glute Bridge']::TEXT[],
  'unilateral', 'glute-bridge', 'Alternating Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-glute-bridge', 'Glute Bridge', 'Half-Kneeling Glute Bridge', ARRAY['Glute Bridge', 'Half-Kneeling Glute Bridge']::TEXT[],
  'stance', 'glute-bridge', 'Half-Kneeling Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-glute-bridge', 'Glute Bridge', 'Tall-Kneeling Glute Bridge', ARRAY['Glute Bridge', 'Tall-Kneeling Glute Bridge']::TEXT[],
  'stance', 'glute-bridge', 'Tall-Kneeling Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-glute-bridge', 'Glute Bridge', 'Split-Stance Glute Bridge', ARRAY['Glute Bridge', 'Split-Stance Glute Bridge']::TEXT[],
  'stance', 'glute-bridge', 'Split-Stance Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-glute-bridge', 'Glute Bridge', 'Close-Grip Glute Bridge', ARRAY['Glute Bridge', 'Close-Grip Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Close-Grip Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-glute-bridge', 'Glute Bridge', 'Neutral-Grip Glute Bridge', ARRAY['Glute Bridge', 'Neutral-Grip Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Neutral-Grip Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-glute-bridge', 'Glute Bridge', 'Wide-Grip Glute Bridge', ARRAY['Glute Bridge', 'Wide-Grip Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Wide-Grip Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-glute-bridge', 'Glute Bridge', 'Underhand Glute Bridge', ARRAY['Glute Bridge', 'Underhand Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Underhand Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-glute-bridge', 'Glute Bridge', 'Overhand Glute Bridge', ARRAY['Glute Bridge', 'Overhand Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Overhand Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-glute-bridge', 'Glute Bridge', 'Pronated Glute Bridge', ARRAY['Glute Bridge', 'Pronated Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Pronated Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-glute-bridge', 'Glute Bridge', 'Supinated Glute Bridge', ARRAY['Glute Bridge', 'Supinated Glute Bridge']::TEXT[],
  'grip', 'glute-bridge', 'Supinated Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-glute-bridge', 'Glute Bridge', 'Incline Glute Bridge', ARRAY['Glute Bridge', 'Incline Glute Bridge']::TEXT[],
  'angle', 'glute-bridge', 'Incline Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-glute-bridge', 'Glute Bridge', 'Decline Glute Bridge', ARRAY['Glute Bridge', 'Decline Glute Bridge']::TEXT[],
  'angle', 'glute-bridge', 'Decline Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-glute-bridge', 'Glute Bridge', 'Long-ROM Glute Bridge', ARRAY['Glute Bridge', 'Long-ROM Glute Bridge']::TEXT[],
  'angle', 'glute-bridge', 'Long-ROM Glute Bridge is a standardized exercise variation derived from the Glute Bridge movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge'), 'gluteus-maximus', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge') AND muscle_id = 'gluteus-maximus'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge'), 'hamstrings', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge'), 'hinge', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge'), 'bodyweight', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-glute-bridge'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-seated-leg-curl', 'Leg Curl', 'Paused Seated Leg Curl', ARRAY['Leg Curl', 'Paused Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Paused Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-seated-leg-curl', 'Leg Curl', 'Tempo Seated Leg Curl', ARRAY['Leg Curl', 'Tempo Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Tempo Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-seated-leg-curl', 'Leg Curl', 'Slow Eccentric Seated Leg Curl', ARRAY['Leg Curl', 'Slow Eccentric Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Slow Eccentric Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-seated-leg-curl', 'Leg Curl', '1.5 Rep Seated Leg Curl', ARRAY['Leg Curl', '1.5 Rep Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', '1.5 Rep Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-seated-leg-curl', 'Leg Curl', 'Single-Arm Seated Leg Curl', ARRAY['Leg Curl', 'Single-Arm Seated Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Single-Arm Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-seated-leg-curl', 'Leg Curl', 'Alternating Seated Leg Curl', ARRAY['Leg Curl', 'Alternating Seated Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Alternating Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-seated-leg-curl', 'Leg Curl', 'Half-Kneeling Seated Leg Curl', ARRAY['Leg Curl', 'Half-Kneeling Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Half-Kneeling Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-seated-leg-curl', 'Leg Curl', 'Tall-Kneeling Seated Leg Curl', ARRAY['Leg Curl', 'Tall-Kneeling Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Tall-Kneeling Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-seated-leg-curl', 'Leg Curl', 'Split-Stance Seated Leg Curl', ARRAY['Leg Curl', 'Split-Stance Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Split-Stance Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-seated-leg-curl', 'Leg Curl', 'Close-Grip Seated Leg Curl', ARRAY['Leg Curl', 'Close-Grip Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Close-Grip Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-seated-leg-curl', 'Leg Curl', 'Neutral-Grip Seated Leg Curl', ARRAY['Leg Curl', 'Neutral-Grip Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Neutral-Grip Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-seated-leg-curl', 'Leg Curl', 'Wide-Grip Seated Leg Curl', ARRAY['Leg Curl', 'Wide-Grip Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Wide-Grip Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-seated-leg-curl', 'Leg Curl', 'Underhand Seated Leg Curl', ARRAY['Leg Curl', 'Underhand Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Underhand Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-seated-leg-curl', 'Leg Curl', 'Overhand Seated Leg Curl', ARRAY['Leg Curl', 'Overhand Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Overhand Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-seated-leg-curl', 'Leg Curl', 'Pronated Seated Leg Curl', ARRAY['Leg Curl', 'Pronated Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Pronated Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-seated-leg-curl', 'Leg Curl', 'Supinated Seated Leg Curl', ARRAY['Leg Curl', 'Supinated Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Supinated Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-seated-leg-curl', 'Leg Curl', 'Incline Seated Leg Curl', ARRAY['Leg Curl', 'Incline Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Incline Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-seated-leg-curl', 'Leg Curl', 'Decline Seated Leg Curl', ARRAY['Leg Curl', 'Decline Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Decline Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-seated-leg-curl', 'Leg Curl', 'Long-ROM Seated Leg Curl', ARRAY['Leg Curl', 'Long-ROM Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Long-ROM Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-lying-leg-curl', 'Leg Curl', 'Paused Lying Leg Curl', ARRAY['Leg Curl', 'Paused Lying Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Paused Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-lying-leg-curl', 'Leg Curl', 'Tempo Lying Leg Curl', ARRAY['Leg Curl', 'Tempo Lying Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Tempo Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-lying-leg-curl', 'Leg Curl', 'Slow Eccentric Lying Leg Curl', ARRAY['Leg Curl', 'Slow Eccentric Lying Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Slow Eccentric Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-lying-leg-curl', 'Leg Curl', '1.5 Rep Lying Leg Curl', ARRAY['Leg Curl', '1.5 Rep Lying Leg Curl']::TEXT[],
  'tempo', 'leg-curl', '1.5 Rep Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-lying-leg-curl', 'Leg Curl', 'Single-Arm Lying Leg Curl', ARRAY['Leg Curl', 'Single-Arm Lying Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Single-Arm Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-lying-leg-curl', 'Leg Curl', 'Single-Leg Lying Leg Curl', ARRAY['Leg Curl', 'Single-Leg Lying Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Single-Leg Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-lying-leg-curl', 'Leg Curl', 'Alternating Lying Leg Curl', ARRAY['Leg Curl', 'Alternating Lying Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Alternating Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-lying-leg-curl', 'Leg Curl', 'Half-Kneeling Lying Leg Curl', ARRAY['Leg Curl', 'Half-Kneeling Lying Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Half-Kneeling Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-lying-leg-curl', 'Leg Curl', 'Tall-Kneeling Lying Leg Curl', ARRAY['Leg Curl', 'Tall-Kneeling Lying Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Tall-Kneeling Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-lying-leg-curl', 'Leg Curl', 'Split-Stance Lying Leg Curl', ARRAY['Leg Curl', 'Split-Stance Lying Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Split-Stance Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-lying-leg-curl', 'Leg Curl', 'Close-Grip Lying Leg Curl', ARRAY['Leg Curl', 'Close-Grip Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Close-Grip Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-lying-leg-curl', 'Leg Curl', 'Neutral-Grip Lying Leg Curl', ARRAY['Leg Curl', 'Neutral-Grip Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Neutral-Grip Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-lying-leg-curl', 'Leg Curl', 'Wide-Grip Lying Leg Curl', ARRAY['Leg Curl', 'Wide-Grip Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Wide-Grip Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-lying-leg-curl', 'Leg Curl', 'Underhand Lying Leg Curl', ARRAY['Leg Curl', 'Underhand Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Underhand Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-lying-leg-curl', 'Leg Curl', 'Overhand Lying Leg Curl', ARRAY['Leg Curl', 'Overhand Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Overhand Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-lying-leg-curl', 'Leg Curl', 'Pronated Lying Leg Curl', ARRAY['Leg Curl', 'Pronated Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Pronated Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-lying-leg-curl', 'Leg Curl', 'Supinated Lying Leg Curl', ARRAY['Leg Curl', 'Supinated Lying Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Supinated Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-lying-leg-curl', 'Leg Curl', 'Incline Lying Leg Curl', ARRAY['Leg Curl', 'Incline Lying Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Incline Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-lying-leg-curl', 'Leg Curl', 'Decline Lying Leg Curl', ARRAY['Leg Curl', 'Decline Lying Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Decline Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-lying-leg-curl', 'Leg Curl', 'Long-ROM Lying Leg Curl', ARRAY['Leg Curl', 'Long-ROM Lying Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Long-ROM Lying Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-lying-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-single-leg-seated-leg-curl', 'Leg Curl', 'Paused Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Paused Single-Leg Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Paused Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-single-leg-seated-leg-curl', 'Leg Curl', 'Tempo Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Tempo Single-Leg Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Tempo Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-single-leg-seated-leg-curl', 'Leg Curl', 'Slow Eccentric Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Slow Eccentric Single-Leg Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', 'Slow Eccentric Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-single-leg-seated-leg-curl', 'Leg Curl', '1.5 Rep Single-Leg Seated Leg Curl', ARRAY['Leg Curl', '1.5 Rep Single-Leg Seated Leg Curl']::TEXT[],
  'tempo', 'leg-curl', '1.5 Rep Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-single-leg-seated-leg-curl', 'Leg Curl', 'Single-Arm Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Single-Arm Single-Leg Seated Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Single-Arm Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-single-leg-seated-leg-curl', 'Leg Curl', 'Single-Leg Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Single-Leg Single-Leg Seated Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Single-Leg Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-single-leg-seated-leg-curl', 'Leg Curl', 'Alternating Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Alternating Single-Leg Seated Leg Curl']::TEXT[],
  'unilateral', 'leg-curl', 'Alternating Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-single-leg-seated-leg-curl', 'Leg Curl', 'Half-Kneeling Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Half-Kneeling Single-Leg Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Half-Kneeling Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-single-leg-seated-leg-curl', 'Leg Curl', 'Tall-Kneeling Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Tall-Kneeling Single-Leg Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Tall-Kneeling Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-single-leg-seated-leg-curl', 'Leg Curl', 'Split-Stance Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Split-Stance Single-Leg Seated Leg Curl']::TEXT[],
  'stance', 'leg-curl', 'Split-Stance Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-single-leg-seated-leg-curl', 'Leg Curl', 'Close-Grip Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Close-Grip Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Close-Grip Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-single-leg-seated-leg-curl', 'Leg Curl', 'Neutral-Grip Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Neutral-Grip Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Neutral-Grip Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-single-leg-seated-leg-curl', 'Leg Curl', 'Wide-Grip Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Wide-Grip Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Wide-Grip Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-single-leg-seated-leg-curl', 'Leg Curl', 'Underhand Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Underhand Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Underhand Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-single-leg-seated-leg-curl', 'Leg Curl', 'Overhand Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Overhand Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Overhand Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-single-leg-seated-leg-curl', 'Leg Curl', 'Pronated Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Pronated Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Pronated Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-single-leg-seated-leg-curl', 'Leg Curl', 'Supinated Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Supinated Single-Leg Seated Leg Curl']::TEXT[],
  'grip', 'leg-curl', 'Supinated Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-single-leg-seated-leg-curl', 'Leg Curl', 'Incline Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Incline Single-Leg Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Incline Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-single-leg-seated-leg-curl', 'Leg Curl', 'Decline Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Decline Single-Leg Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Decline Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-single-leg-seated-leg-curl', 'Leg Curl', 'Long-ROM Single-Leg Seated Leg Curl', ARRAY['Leg Curl', 'Long-ROM Single-Leg Seated Leg Curl']::TEXT[],
  'angle', 'leg-curl', 'Long-ROM Single-Leg Seated Leg Curl is a standardized exercise variation derived from the Leg Curl movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl'), 'hamstrings', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl') AND muscle_id = 'hamstrings'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl'), 'gastrocnemius', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl'), 'knee-flexion', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-single-leg-seated-leg-curl'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-machine-leg-extension', 'Leg Extension', 'Paused Machine Leg Extension', ARRAY['Leg Extension', 'Paused Machine Leg Extension']::TEXT[],
  'tempo', 'leg-extension', 'Paused Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-machine-leg-extension', 'Leg Extension', 'Tempo Machine Leg Extension', ARRAY['Leg Extension', 'Tempo Machine Leg Extension']::TEXT[],
  'tempo', 'leg-extension', 'Tempo Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-machine-leg-extension', 'Leg Extension', 'Slow Eccentric Machine Leg Extension', ARRAY['Leg Extension', 'Slow Eccentric Machine Leg Extension']::TEXT[],
  'tempo', 'leg-extension', 'Slow Eccentric Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-machine-leg-extension', 'Leg Extension', '1.5 Rep Machine Leg Extension', ARRAY['Leg Extension', '1.5 Rep Machine Leg Extension']::TEXT[],
  'tempo', 'leg-extension', '1.5 Rep Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-machine-leg-extension', 'Leg Extension', 'Single-Arm Machine Leg Extension', ARRAY['Leg Extension', 'Single-Arm Machine Leg Extension']::TEXT[],
  'unilateral', 'leg-extension', 'Single-Arm Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-machine-leg-extension', 'Leg Extension', 'Single-Leg Machine Leg Extension', ARRAY['Leg Extension', 'Single-Leg Machine Leg Extension']::TEXT[],
  'unilateral', 'leg-extension', 'Single-Leg Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-machine-leg-extension', 'Leg Extension', 'Alternating Machine Leg Extension', ARRAY['Leg Extension', 'Alternating Machine Leg Extension']::TEXT[],
  'unilateral', 'leg-extension', 'Alternating Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-machine-leg-extension', 'Leg Extension', 'Half-Kneeling Machine Leg Extension', ARRAY['Leg Extension', 'Half-Kneeling Machine Leg Extension']::TEXT[],
  'stance', 'leg-extension', 'Half-Kneeling Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-machine-leg-extension', 'Leg Extension', 'Tall-Kneeling Machine Leg Extension', ARRAY['Leg Extension', 'Tall-Kneeling Machine Leg Extension']::TEXT[],
  'stance', 'leg-extension', 'Tall-Kneeling Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-machine-leg-extension', 'Leg Extension', 'Split-Stance Machine Leg Extension', ARRAY['Leg Extension', 'Split-Stance Machine Leg Extension']::TEXT[],
  'stance', 'leg-extension', 'Split-Stance Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-machine-leg-extension', 'Leg Extension', 'Close-Grip Machine Leg Extension', ARRAY['Leg Extension', 'Close-Grip Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Close-Grip Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-machine-leg-extension', 'Leg Extension', 'Neutral-Grip Machine Leg Extension', ARRAY['Leg Extension', 'Neutral-Grip Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Neutral-Grip Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-machine-leg-extension', 'Leg Extension', 'Wide-Grip Machine Leg Extension', ARRAY['Leg Extension', 'Wide-Grip Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Wide-Grip Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'underhand-machine-leg-extension', 'Leg Extension', 'Underhand Machine Leg Extension', ARRAY['Leg Extension', 'Underhand Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Underhand Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'underhand-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'underhand-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'overhand-machine-leg-extension', 'Leg Extension', 'Overhand Machine Leg Extension', ARRAY['Leg Extension', 'Overhand Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Overhand Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'overhand-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'overhand-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'pronated-machine-leg-extension', 'Leg Extension', 'Pronated Machine Leg Extension', ARRAY['Leg Extension', 'Pronated Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Pronated Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'pronated-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'pronated-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'supinated-machine-leg-extension', 'Leg Extension', 'Supinated Machine Leg Extension', ARRAY['Leg Extension', 'Supinated Machine Leg Extension']::TEXT[],
  'grip', 'leg-extension', 'Supinated Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'supinated-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'supinated-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'incline-machine-leg-extension', 'Leg Extension', 'Incline Machine Leg Extension', ARRAY['Leg Extension', 'Incline Machine Leg Extension']::TEXT[],
  'angle', 'leg-extension', 'Incline Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'incline-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'incline-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'incline-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'incline-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'decline-machine-leg-extension', 'Leg Extension', 'Decline Machine Leg Extension', ARRAY['Leg Extension', 'Decline Machine Leg Extension']::TEXT[],
  'angle', 'leg-extension', 'Decline Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'decline-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'decline-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'decline-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'decline-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'long-rom-machine-leg-extension', 'Leg Extension', 'Long-ROM Machine Leg Extension', ARRAY['Leg Extension', 'Long-ROM Machine Leg Extension']::TEXT[],
  'angle', 'leg-extension', 'Long-ROM Machine Leg Extension is a standardized exercise variation derived from the Leg Extension movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-leg-extension'), 'quadriceps', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-leg-extension') AND muscle_id = 'quadriceps'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-leg-extension'), 'squat', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-leg-extension'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'long-rom-machine-leg-extension'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'paused-standing-calf-raise', 'Calf Raise', 'Paused Standing Calf Raise', ARRAY['Calf Raise', 'Paused Standing Calf Raise']::TEXT[],
  'tempo', 'calf-raise', 'Paused Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'paused-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tempo-standing-calf-raise', 'Calf Raise', 'Tempo Standing Calf Raise', ARRAY['Calf Raise', 'Tempo Standing Calf Raise']::TEXT[],
  'tempo', 'calf-raise', 'Tempo Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tempo-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'slow-eccentric-standing-calf-raise', 'Calf Raise', 'Slow Eccentric Standing Calf Raise', ARRAY['Calf Raise', 'Slow Eccentric Standing Calf Raise']::TEXT[],
  'tempo', 'calf-raise', 'Slow Eccentric Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'slow-eccentric-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  '1-5-rep-standing-calf-raise', 'Calf Raise', '1.5 Rep Standing Calf Raise', ARRAY['Calf Raise', '1.5 Rep Standing Calf Raise']::TEXT[],
  'tempo', 'calf-raise', '1.5 Rep Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = '1-5-rep-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-arm-standing-calf-raise', 'Calf Raise', 'Single-Arm Standing Calf Raise', ARRAY['Calf Raise', 'Single-Arm Standing Calf Raise']::TEXT[],
  'unilateral', 'calf-raise', 'Single-Arm Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-arm-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'single-leg-standing-calf-raise', 'Calf Raise', 'Single-Leg Standing Calf Raise', ARRAY['Calf Raise', 'Single-Leg Standing Calf Raise']::TEXT[],
  'unilateral', 'calf-raise', 'Single-Leg Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'single-leg-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'alternating-standing-calf-raise', 'Calf Raise', 'Alternating Standing Calf Raise', ARRAY['Calf Raise', 'Alternating Standing Calf Raise']::TEXT[],
  'unilateral', 'calf-raise', 'Alternating Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'alternating-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'half-kneeling-standing-calf-raise', 'Calf Raise', 'Half-Kneeling Standing Calf Raise', ARRAY['Calf Raise', 'Half-Kneeling Standing Calf Raise']::TEXT[],
  'stance', 'calf-raise', 'Half-Kneeling Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'half-kneeling-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'tall-kneeling-standing-calf-raise', 'Calf Raise', 'Tall-Kneeling Standing Calf Raise', ARRAY['Calf Raise', 'Tall-Kneeling Standing Calf Raise']::TEXT[],
  'stance', 'calf-raise', 'Tall-Kneeling Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'tall-kneeling-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'split-stance-standing-calf-raise', 'Calf Raise', 'Split-Stance Standing Calf Raise', ARRAY['Calf Raise', 'Split-Stance Standing Calf Raise']::TEXT[],
  'stance', 'calf-raise', 'Split-Stance Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'split-stance-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'close-grip-standing-calf-raise', 'Calf Raise', 'Close-Grip Standing Calf Raise', ARRAY['Calf Raise', 'Close-Grip Standing Calf Raise']::TEXT[],
  'grip', 'calf-raise', 'Close-Grip Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'close-grip-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'neutral-grip-standing-calf-raise', 'Calf Raise', 'Neutral-Grip Standing Calf Raise', ARRAY['Calf Raise', 'Neutral-Grip Standing Calf Raise']::TEXT[],
  'grip', 'calf-raise', 'Neutral-Grip Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'neutral-grip-standing-calf-raise'), 'beginner', 3,
                3, 4, FALSE,
                'uniform'
              ) ON CONFLICT (exercise_id) DO UPDATE SET
                difficulty_level = EXCLUDED.difficulty_level,
                stimulus_to_fatigue = EXCLUDED.stimulus_to_fatigue,
                technical_demand = EXCLUDED.technical_demand,
                loadability = EXCLUDED.loadability,
                lengthened_emphasis = EXCLUDED.lengthened_emphasis,
                resistance_profile = EXCLUDED.resistance_profile;

INSERT INTO public.exercises (
  slug, canonical_name, name, aliases, variation_type, parent_slug,
  description, setup, execution, cues, common_mistakes, should_feel, breathing, status
) VALUES (
  'wide-grip-standing-calf-raise', 'Calf Raise', 'Wide-Grip Standing Calf Raise', ARRAY['Calf Raise', 'Wide-Grip Standing Calf Raise']::TEXT[],
  'grip', 'calf-raise', 'Wide-Grip Standing Calf Raise is a standardized exercise variation derived from the Calf Raise movement family.',
  ARRAY['Prepare the listed equipment and establish a stable starting position.', 'Use a load appropriate for the user''s training level.']::TEXT[], ARRAY['Perform controlled repetitions through a comfortable range of motion.', 'Maintain stable alignment and consistent technique.']::TEXT[], ARRAY['Control the lowering phase.', 'Avoid using momentum to complete repetitions.', 'Stop for sharp or unusual pain.']::TEXT[],
  ARRAY['Excessive momentum.', 'Uncontrolled range of motion.', 'Allowing technique to deteriorate with fatigue.']::TEXT[], 'The listed target muscles working without sharp or unusual pain.', 'Inhale during the easier phase and exhale during the harder phase.', 'active'
) ON CONFLICT (slug) DO UPDATE SET
  canonical_name = EXCLUDED.canonical_name,
  name = EXCLUDED.name,
  aliases = EXCLUDED.aliases,
  variation_type = EXCLUDED.variation_type,
  parent_slug = EXCLUDED.parent_slug,
  description = EXCLUDED.description,
  setup = EXCLUDED.setup,
  execution = EXCLUDED.execution,
  cues = EXCLUDED.cues,
  common_mistakes = EXCLUDED.common_mistakes,
  should_feel = EXCLUDED.should_feel,
  breathing = EXCLUDED.breathing,
  status = 'active';
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise'), 'gastrocnemius', NULL, 'primary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise') AND muscle_id = 'gastrocnemius'
                );
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role)
                SELECT (SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise'), 'soleus', NULL, 'secondary'
                WHERE NOT EXISTS (
                  SELECT 1 FROM public.exercise_muscles 
                  WHERE exercise_id = (SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise') AND muscle_id = 'soleus'
                );
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise'), 'calf-raise', TRUE)
                ON CONFLICT (exercise_id, movement_pattern_id) DO NOTHING;
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
                VALUES ((SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise'), 'machine', TRUE)
                ON CONFLICT (exercise_id, equipment_id) DO NOTHING;
INSERT INTO public.exercise_characteristics (
                exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, lengthened_emphasis, resistance_profile
              ) VALUES (
                (SELECT id FROM public.exercises WHERE slug = 'wide-grip-standing-calf-raise'), 'beginner', 3,
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
