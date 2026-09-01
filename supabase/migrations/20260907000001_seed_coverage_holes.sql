-- Migration to seed 4 specific exercises to fill critical coverage holes

-- 1. Dumbbell Pullover (Lats / Beginner / Home)
INSERT INTO public.exercises (id, slug, canonical_name, name, variation_type, parent_exercise_id, status)
VALUES (
  '11111111-1111-1111-1111-111111111111', 'dumbbell-pullover', 'Pullover', 'Dumbbell Pullover', 'equipment', null, 'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role) VALUES 
('11111111-1111-1111-1111-111111111111', 'latissimus-dorsi', null, 'primary'),
('11111111-1111-1111-1111-111111111111', 'pectoralis-major', null, 'secondary')
ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary) VALUES 
('11111111-1111-1111-1111-111111111111', 'vertical-pull', true) ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required) VALUES 
('11111111-1111-1111-1111-111111111111', 'dumbbell', true),
('11111111-1111-1111-1111-111111111111', 'bench', true) ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_characteristics (exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, unilateral, resistance_profile) VALUES 
('11111111-1111-1111-1111-111111111111', 'beginner', 4, 3, 3, false, 'uniform') ON CONFLICT DO NOTHING;


-- 2. Glute Bridge Walkout (Hamstrings / Bodyweight / Beginner)
INSERT INTO public.exercises (id, slug, canonical_name, name, variation_type, parent_exercise_id, status)
VALUES (
  '22222222-2222-2222-2222-222222222222', 'glute-bridge-walkout', 'Glute Bridge', 'Glute Bridge Walkout', 'tempo', null, 'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role) VALUES 
('22222222-2222-2222-2222-222222222222', 'hamstrings', null, 'primary'),
('22222222-2222-2222-2222-222222222222', 'gluteus-maximus', null, 'secondary')
ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary) VALUES 
('22222222-2222-2222-2222-222222222222', 'knee-flexion', true),
('22222222-2222-2222-2222-222222222222', 'hip-extension', false) ON CONFLICT DO NOTHING;

-- No equipment mapped intentionally means bodyweight in our domain logic (or we map 'bodyweight' explicitly if it exists).
-- Wait, the taxonomy equipment list doesn't have 'bodyweight'. The absence of equipment rows means bodyweight.

INSERT INTO public.exercise_characteristics (exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, unilateral, resistance_profile) VALUES 
('22222222-2222-2222-2222-222222222222', 'beginner', 3, 2, 1, false, 'uniform') ON CONFLICT DO NOTHING;


-- 3. Doorframe Bodyweight Row (Lats / Bodyweight / Beginner)
INSERT INTO public.exercises (id, slug, canonical_name, name, variation_type, parent_exercise_id, status)
VALUES (
  '33333333-3333-3333-3333-333333333333', 'doorframe-row', 'Row', 'Doorframe Bodyweight Row', 'equipment', null, 'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role) VALUES 
('33333333-3333-3333-3333-333333333333', 'latissimus-dorsi', null, 'primary'),
('33333333-3333-3333-3333-333333333333', 'rhomboids', null, 'secondary')
ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary) VALUES 
('33333333-3333-3333-3333-333333333333', 'horizontal-pull', true) ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_characteristics (exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, unilateral, resistance_profile) VALUES 
('33333333-3333-3333-3333-333333333333', 'beginner', 3, 2, 1, false, 'uniform') ON CONFLICT DO NOTHING;


-- 4. Pike Push-Up (Anterior Deltoid / Bodyweight / Intermediate)
INSERT INTO public.exercises (id, slug, canonical_name, name, variation_type, parent_exercise_id, status)
VALUES (
  '44444444-4444-4444-4444-444444444444', 'pike-push-up', 'Pike Push-Up', 'Pike Push-Up', 'stance', null, 'active'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.exercise_muscles (exercise_id, muscle_id, region_id, role) VALUES 
('44444444-4444-4444-4444-444444444444', 'anterior-deltoid', null, 'primary'),
('44444444-4444-4444-4444-444444444444', 'triceps-brachii', null, 'secondary')
ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary) VALUES 
('44444444-4444-4444-4444-444444444444', 'vertical-push', true) ON CONFLICT DO NOTHING;

INSERT INTO public.exercise_characteristics (exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability, unilateral, resistance_profile) VALUES 
('44444444-4444-4444-4444-444444444444', 'intermediate', 4, 3, 2, false, 'uniform') ON CONFLICT DO NOTHING;


-- Common Goal Suitability mapping for all 4 exercises
INSERT INTO public.exercise_goal_suitability (exercise_id, goal_id, score, rationale)
SELECT e.id, g.id, 8, 'Curated default score'
FROM public.exercises e
CROSS JOIN public.goals g
WHERE e.id IN (
  '11111111-1111-1111-1111-111111111111',
  '22222222-2222-2222-2222-222222222222',
  '33333333-3333-3333-3333-333333333333',
  '44444444-4444-4444-4444-444444444444'
) ON CONFLICT DO NOTHING;

-- Data Sources
INSERT INTO public.exercise_data_sources (exercise_id, field_scope, source_type, source_name, confidence)
SELECT e.id, 'all', 'curated', 'Coverage Gap Fix', 'high'
FROM public.exercises e
WHERE e.id IN (
  '11111111-1111-1111-1111-111111111111',
  '22222222-2222-2222-2222-222222222222',
  '33333333-3333-3333-3333-333333333333',
  '44444444-4444-4444-4444-444444444444'
) ON CONFLICT DO NOTHING;
