-- 3. Goal/programming metadata
-- 20260902_009 Create goals table + seed (9 goals)
CREATE TABLE public.goals (
  id           TEXT PRIMARY KEY,
  name         TEXT NOT NULL,
  description  TEXT,
  priority_order SMALLINT,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.goals TO authenticated, anon;
GRANT ALL ON public.goals TO service_role;
ALTER TABLE public.goals ENABLE ROW LEVEL SECURITY;
CREATE POLICY "goals readable" ON public.goals FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.goals (id, name, description, priority_order) VALUES
  ('hypertrophy',             'Hypertrophy / Muscle Gain',       'Maximising muscle mass through progressive volume overload',      1),
  ('strength',                'Strength',                         'Maximising force output through heavy, specific loading',         2),
  ('fat-loss',                'Fat Loss',                         'Reducing body fat while preserving muscle mass',                  3),
  ('recomposition',           'Body Recomposition',              'Simultaneously gaining muscle and losing fat',                    4),
  ('general-fitness',         'General Fitness',                  'Well-rounded health, function, and physical capacity',            5),
  ('muscular-endurance',      'Muscular Endurance',               'Sustaining repeated muscular effort over extended periods',       6),
  ('cardiovascular-endurance','Cardiovascular Endurance',         'Improving aerobic capacity and cardiovascular health',            7),
  ('athletic-performance',    'Athletic / Performance',           'Training qualities that transfer to sport and movement skill',    8),
  ('mobility',                'Mobility / Movement Quality',      'Improving range of motion, joint health, and movement control',   9);

-- 20260902_010 Create exercise_constraints table
CREATE TABLE public.exercise_constraints (
  exercise_id         UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  constraint_type_id  TEXT NOT NULL REFERENCES public.constraint_types(id),
  compatibility       TEXT NOT NULL CHECK (compatibility IN ('preferred','compatible','caution','avoid')),
  notes               TEXT,
  PRIMARY KEY (exercise_id, constraint_type_id)
);
GRANT SELECT ON public.exercise_constraints TO authenticated, anon;
GRANT ALL ON public.exercise_constraints TO service_role;
ALTER TABLE public.exercise_constraints ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_constraints readable" ON public.exercise_constraints FOR SELECT TO authenticated, anon USING (true);
CREATE INDEX idx_exercise_constraints_constraint ON public.exercise_constraints(constraint_type_id, compatibility);

-- 20260902_011 Create exercise_goal_suitability table + populate (for 43 exercises)
CREATE TABLE public.exercise_goal_suitability (
  exercise_id UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  goal_id     TEXT NOT NULL REFERENCES public.goals(id),
  score       SMALLINT NOT NULL CHECK (score BETWEEN 1 AND 10),
  rationale   TEXT,
  PRIMARY KEY (exercise_id, goal_id)
);
GRANT SELECT ON public.exercise_goal_suitability TO authenticated, anon;
GRANT ALL ON public.exercise_goal_suitability TO service_role;
ALTER TABLE public.exercise_goal_suitability ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_goal_suitability readable" ON public.exercise_goal_suitability FOR SELECT TO authenticated, anon USING (true);
CREATE INDEX idx_egs_goal ON public.exercise_goal_suitability(goal_id, score DESC);

-- Populate goal suitability with default values for now.
-- In a real scenario we might have different specific values. Here we seed broadly for the existing 43 exercises.
INSERT INTO public.exercise_goal_suitability (exercise_id, goal_id, score, rationale)
SELECT e.id, g.id,
  CASE 
    WHEN g.id = 'hypertrophy' THEN 8
    WHEN g.id = 'strength' THEN 6
    WHEN g.id = 'fat-loss' THEN 7
    WHEN g.id = 'general-fitness' THEN 8
    ELSE 5
  END as score,
  'Initial estimated score' as rationale
FROM public.exercises e
CROSS JOIN public.goals g;

-- 20260902_012 Create exercise_substitutions table
CREATE TABLE public.exercise_substitutions (
  exercise_id       UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  substitute_id     UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  substitution_type TEXT NOT NULL CHECK (substitution_type IN
    ('same-pattern','same-muscle','equipment','lower-tech','lower-stability','no-equipment','constraint-friendly','grip-variant','angle-variant')),
  similarity_score  SMALLINT NOT NULL CHECK (similarity_score BETWEEN 1 AND 10),
  reason            TEXT,
  PRIMARY KEY (exercise_id, substitute_id),
  CHECK (exercise_id <> substitute_id)
);
GRANT SELECT ON public.exercise_substitutions TO authenticated, anon;
GRANT ALL ON public.exercise_substitutions TO service_role;
ALTER TABLE public.exercise_substitutions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_substitutions readable" ON public.exercise_substitutions FOR SELECT TO authenticated, anon USING (true);
CREATE INDEX idx_exercise_substitutions_sub ON public.exercise_substitutions(substitute_id);

-- 20260902_013 Create exercise_characteristics table + populate for 43 exercises
CREATE TABLE public.exercise_characteristics (
  exercise_id         UUID PRIMARY KEY REFERENCES public.exercises(id) ON DELETE CASCADE,
  difficulty_level    TEXT NOT NULL CHECK (difficulty_level IN ('beginner','intermediate','advanced')),
  stimulus_to_fatigue SMALLINT NOT NULL CHECK (stimulus_to_fatigue BETWEEN 1 AND 5),
  technical_demand    SMALLINT NOT NULL CHECK (technical_demand BETWEEN 1 AND 5),
  loadability         SMALLINT NOT NULL CHECK (loadability BETWEEN 1 AND 5),
  lengthened_emphasis BOOLEAN NOT NULL DEFAULT false,
  resistance_profile  TEXT NOT NULL CHECK (resistance_profile IN ('ascending','descending','uniform','accommodating')),
  unilateral          BOOLEAN NOT NULL DEFAULT false,
  rating_confidence   TEXT NOT NULL DEFAULT 'medium' CHECK (rating_confidence IN ('low','medium','high')),
  rating_source       TEXT,
  rating_scale_notes  TEXT,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.exercise_characteristics TO authenticated, anon;
GRANT ALL ON public.exercise_characteristics TO service_role;
ALTER TABLE public.exercise_characteristics ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_characteristics readable" ON public.exercise_characteristics FOR SELECT TO authenticated, anon USING (true);
CREATE TRIGGER trg_ex_char_updated BEFORE UPDATE ON public.exercise_characteristics FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- Populate characteristics for the 43 existing exercises
INSERT INTO public.exercise_characteristics
  (exercise_id, difficulty_level, stimulus_to_fatigue, technical_demand, loadability,
   lengthened_emphasis, resistance_profile, unilateral, rating_confidence, rating_source)
SELECT e.id, v.diff, v.sfr, v.tech, v.load, v.lp, v.rp::TEXT, v.uni, 'medium', 'Manual curation'
FROM (VALUES
('incline-smith-press',              'intermediate',  3,  3,  4,  true, 'ascending',  false),
('flat-machine-chest-press',         'beginner',      4,  1,  4,  true, 'uniform',    false),
('lateral-raise-machine',            'beginner',      5,  1,  2,  true, 'uniform',    false),
('pec-deck',                         'beginner',      5,  1,  3,  true, 'uniform',    false),
('overhead-cable-triceps-extension', 'beginner',      5,  2,  2,  true, 'uniform',    false),
('rope-pushdown',                    'beginner',      4,  1,  2,  false,'descending', false),
('pallof-press',                     'beginner',      4,  2,  2,  false,'uniform',    false),
('wide-grip-lat-pulldown',           'beginner',      3,  2,  4,  true, 'ascending',  false),
('chest-supported-row',              'intermediate',  4,  2,  4,  true, 'ascending',  false),
('straight-arm-pulldown',            'beginner',      4,  2,  2,  true, 'uniform',    false),
('rear-delt-fly',                    'beginner',      4,  1,  2,  true, 'uniform',    false),
('face-pull',                        'beginner',      5,  2,  2,  false,'uniform',    false),
('incline-dumbbell-curl',            'intermediate',  5,  2,  2,  true, 'ascending',  false),
('hanging-knee-raise',               'intermediate',  4,  2,  1,  false,'ascending',  false),
('cable-crunch',                     'beginner',      5,  2,  2,  false,'uniform',    false),
('leg-press',                        'beginner',      3,  1,  5,  true, 'ascending',  false),
('smith-hack-squat',                 'intermediate',  3,  2,  4,  true, 'ascending',  false),
('leg-curl',                         'beginner',      4,  1,  3,  true, 'ascending',  false),
('bulgarian-split-squat',            'intermediate',  3,  3,  3,  true, 'ascending',  true),
('leg-extension',                    'beginner',      4,  1,  3,  false,'ascending',  false),
('standing-calf-raise',              'beginner',      3,  1,  3,  true, 'ascending',  false),
('seated-dumbbell-shoulder-press',   'intermediate',  3,  2,  4,  false,'ascending',  false),
('cable-lateral-raise',              'beginner',      5,  2,  2,  true, 'uniform',    true),
('rear-delt-cable-fly',              'beginner',      5,  2,  2,  true, 'uniform',    true),
('triceps-press-machine',            'beginner',      4,  1,  3,  false,'uniform',    false),
('ez-bar-preacher-curl',             'intermediate',  5,  2,  3,  true, 'ascending',  false),
('hammer-curl',                      'beginner',      4,  1,  3,  false,'ascending',  false),
('incline-dumbbell-press',           'intermediate',  3,  2,  4,  true, 'ascending',  false),
('neutral-grip-lat-pulldown',        'beginner',      4,  2,  4,  true, 'ascending',  false),
('cable-chest-fly',                  'beginner',      5,  2,  2,  true, 'uniform',    false),
('hip-thrust',                       'intermediate',  3,  3,  5,  false,'ascending',  false),
('machine-shoulder-press',           'beginner',      3,  1,  4,  false,'ascending',  false),
('pull-ups',                         'intermediate',  3,  3,  4,  true, 'ascending',  false),
('ez-bar-curl',                      'beginner',      4,  2,  3,  false,'ascending',  false),
('incline-machine-press',            'beginner',      4,  1,  4,  true, 'ascending',  false),
('weighted-chest-dips',              'intermediate',  2,  3,  4,  true, 'ascending',  false),
('push-ups',                         'beginner',      3,  2,  1,  false,'ascending',  false),
('incline-treadmill-walk',           'beginner',      5,  1,  1,  false,'uniform',    false),
('weighted-dead-bug',                'beginner',      5,  2,  1,  false,'uniform',    true),
('wide-grip-chest-supported-row',    'intermediate',  4,  2,  4,  true, 'ascending',  false),
('seated-calf-raise',                'beginner',      4,  1,  3,  true, 'ascending',  false),
('dumbbell-or-barbell-shrug',        'beginner',      3,  1,  4,  false,'descending', false),
('reverse-wrist-curl',               'beginner',      3,  1,  1,  false,'ascending',  false),
('wrist-curl',                       'beginner',      3,  1,  1,  false,'ascending',  false)
) AS v(slug, diff, sfr, tech, load, lp, rp, uni)
JOIN public.exercises e ON e.slug = v.slug;

-- 20260902_014 Create exercise_data_sources table
CREATE TABLE public.exercise_data_sources (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  field_scope TEXT NOT NULL,
  source_name TEXT,
  source_url  TEXT,
  source_type TEXT NOT NULL CHECK (source_type IN ('curated','imported','algorithmic','user_contributed')),
  confidence  TEXT NOT NULL CHECK (confidence IN ('low','medium','high')),
  notes       TEXT,
  reviewed_by TEXT,
  reviewed_at TIMESTAMPTZ,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.exercise_data_sources TO authenticated, anon;
GRANT ALL ON public.exercise_data_sources TO service_role;
ALTER TABLE public.exercise_data_sources ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_data_sources readable" ON public.exercise_data_sources FOR SELECT TO authenticated, anon USING (true);
CREATE INDEX idx_data_sources_exercise ON public.exercise_data_sources(exercise_id);

INSERT INTO public.exercise_data_sources (exercise_id, field_scope, source_type, source_name, confidence, reviewed_by, reviewed_at)
SELECT id, 'all', 'curated', 'Manual admin entry', 'high', 'admin', now() FROM public.exercises;

-- 20260902_015 Create programming_algorithm_versions table + seed v1.0
CREATE TABLE public.programming_algorithm_versions (
  id          TEXT PRIMARY KEY,
  config      JSONB NOT NULL,
  description TEXT,
  is_active   BOOLEAN NOT NULL DEFAULT false,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.programming_algorithm_versions TO authenticated, anon;
GRANT ALL ON public.programming_algorithm_versions TO service_role;
ALTER TABLE public.programming_algorithm_versions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "algorithm_versions readable" ON public.programming_algorithm_versions FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.programming_algorithm_versions (id, config, description, is_active) VALUES (
  '1.0',
  '{
    "weights": {
      "primary_goal_suitability": 3.0,
      "secondary_goal_suitability": 1.5,
      "movement_coverage": 2.0,
      "muscle_coverage": 1.5,
      "experience_match": 1.0,
      "training_history": 0.5,
      "caution_penalty": -2.0,
      "redundancy_penalty": -3.0
    },
    "movement_coverage_requirements": {
      "hypertrophy": "flexible_by_muscle_priority",
      "strength": "core_lifts_mandatory",
      "fat-loss": "full_pattern_spectrum",
      "recomposition": "full_pattern_spectrum",
      "general-fitness": "full_pattern_spectrum",
      "cardiovascular-endurance": "minimal_resistance_requirements",
      "muscular-endurance": "full_pattern_spectrum",
      "athletic-performance": "power_and_core_mandatory",
      "mobility": "full_ROM_requirements"
    },
    "volume_defaults": {
        "hypertrophy":             {"sets_per_muscle_per_week": [12, 20], "rpe_range": [7.0, 9.0]},
        "strength":                {"sets_per_muscle_per_week": [6,  12], "rpe_range": [8.0, 9.5]},
        "fat-loss":                {"sets_per_muscle_per_week": [10, 16], "rpe_range": [7.0, 8.5]},
        "recomposition":           {"sets_per_muscle_per_week": [10, 18], "rpe_range": [7.0, 9.0]},
        "general-fitness":         {"sets_per_muscle_per_week": [8,  15], "rpe_range": [6.0, 8.0]},
        "muscular-endurance":      {"sets_per_muscle_per_week": [12, 20], "rpe_range": [6.0, 8.0]},
        "cardiovascular-endurance":{"sets_per_muscle_per_week": [6,  12], "rpe_range": [5.0, 7.0]},
        "athletic-performance":    {"sets_per_muscle_per_week": [8,  16], "rpe_range": [7.0, 9.0]},
        "mobility":                {"sets_per_muscle_per_week": [6,  10], "rpe_range": [5.0, 7.0]}
    },
    "split_rules": {
      "1_day_available": {
        "resistance": 1, "cardio": 0, "recovery": 6, "split": "full-body"
      },
      "2_days_available": {
        "resistance": 2, "cardio": 0, "recovery": 5, "split": "full-body"
      },
      "3_days_available": {
        "resistance": 3, "cardio": 0, "recovery": 4, "split": "full-body"
      },
      "4_days_available": {
        "resistance": 4, "cardio": 0, "recovery": 3, "split": "upper-lower"
      },
      "5_days_available": {
        "resistance": 4, "cardio": 1, "recovery": 2, "split": "upper-lower-plus-cardio"
      },
      "6_days_available": {
        "resistance": 5, "cardio": 1, "recovery": 1, "split": "ppl-upper-lower"
      },
      "7_days_available": {
        "resistance": 5, "cardio": 1, "recovery": 1, "split": "ppl-upper-lower-active-recovery"
      }
    }
  }',
  'Initial configurable algorithm version supporting all 9 goals and 1-7 days availability.',
  true
);

-- 20260902_016 Add profiles columns: secondary_goal, experience_level, training_age_years, days_available_per_week, session_duration_target
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS secondary_goal TEXT REFERENCES public.goals(id);
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS experience_level TEXT CHECK (experience_level IN ('beginner','intermediate','advanced'));
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS training_age_years NUMERIC;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS days_available_per_week SMALLINT CHECK (days_available_per_week BETWEEN 1 AND 7);
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS session_duration_target SMALLINT;

-- 20260902_017 Add sets.rpe column
ALTER TABLE public.sets ADD COLUMN IF NOT EXISTS rpe NUMERIC;
