-- 1. Taxonomy refinement
-- 20260902_001 Create muscles table + seed
CREATE TABLE public.muscles (
  id             TEXT PRIMARY KEY,
  anatomical_name TEXT NOT NULL,
  common_name    TEXT,
  body_region    TEXT NOT NULL CHECK (body_region IN ('upper-body','lower-body','core','cardio')),
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.muscles TO authenticated, anon;
GRANT ALL ON public.muscles TO service_role;
ALTER TABLE public.muscles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "muscles readable" ON public.muscles FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.muscles (id, anatomical_name, common_name, body_region) VALUES
  ('pectoralis-major',    'Pectoralis Major',           'Chest',         'upper-body'),
  ('latissimus-dorsi',    'Latissimus Dorsi',           'Lats',          'upper-body'),
  ('rhomboids',           'Rhomboids',                  'Mid Back',      'upper-body'),
  ('middle-trapezius',    'Middle Trapezius',           'Mid Back',      'upper-body'),
  ('lower-trapezius',     'Lower Trapezius',            'Upper Back',    'upper-body'),
  ('upper-trapezius',     'Upper Trapezius',            'Traps',         'upper-body'),
  ('anterior-deltoid',    'Anterior Deltoid',           'Front Delt',    'upper-body'),
  ('lateral-deltoid',     'Lateral Deltoid',            'Side Delt',     'upper-body'),
  ('posterior-deltoid',   'Posterior Deltoid',          'Rear Delt',     'upper-body'),
  ('rotator-cuff',        'Rotator Cuff',               'Rotator Cuff',  'upper-body'),
  ('biceps-brachii',      'Biceps Brachii',             'Biceps',        'upper-body'),
  ('brachialis',          'Brachialis',                 'Brachialis',    'upper-body'),
  ('triceps-brachii',     'Triceps Brachii',            'Triceps',       'upper-body'),
  ('forearm-flexors',     'Forearm Flexors',            'Forearms',      'upper-body'),
  ('forearm-extensors',   'Forearm Extensors',          'Forearms',      'upper-body'),
  ('serratus-anterior',   'Serratus Anterior',          'Serratus',      'upper-body'),
  ('quadriceps',          'Quadriceps',                 'Quads',         'lower-body'),
  ('hamstrings',          'Hamstrings',                 'Hamstrings',    'lower-body'),
  ('gluteus-maximus',     'Gluteus Maximus',            'Glutes',        'lower-body'),
  ('gluteus-medius',      'Gluteus Medius',             'Glute Med',     'lower-body'),
  ('gastrocnemius',       'Gastrocnemius',              'Calves',        'lower-body'),
  ('soleus',              'Soleus',                     'Calves',        'lower-body'),
  ('hip-flexors',         'Hip Flexors (Iliopsoas)',    'Hip Flexors',   'lower-body'),
  ('adductors',           'Hip Adductors',              'Adductors',     'lower-body'),
  ('rectus-abdominis',    'Rectus Abdominis',           'Abs',           'core'),
  ('obliques',            'Internal/External Obliques', 'Obliques',      'core'),
  ('cardiovascular-system','Cardiovascular System',     'Cardio',        'cardio');

-- 20260902_002 Create muscle_regions table + composite unique constraint + seed
CREATE TABLE public.muscle_regions (
  id         TEXT PRIMARY KEY,
  muscle_id  TEXT NOT NULL REFERENCES public.muscles(id),
  name       TEXT NOT NULL,
  label      TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT uq_muscle_region UNIQUE (muscle_id, id)
);
GRANT SELECT ON public.muscle_regions TO authenticated, anon;
GRANT ALL ON public.muscle_regions TO service_role;
ALTER TABLE public.muscle_regions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "muscle_regions readable" ON public.muscle_regions FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.muscle_regions (id, muscle_id, name, label) VALUES
  ('chest-upper',  'pectoralis-major', 'Clavicular Head (Upper Chest)',    'Upper Chest'),
  ('chest-lower',  'pectoralis-major', 'Sternal Head (Lower/Mid Chest)',   'Lower Chest'),
  ('lats-upper',   'latissimus-dorsi', 'Upper Lat (High Insertion)',        'Upper Lats'),
  ('lats-lower',   'latissimus-dorsi', 'Lower Lat (Width / Taper)',         'Lower Lats'),
  ('triceps-long', 'triceps-brachii',  'Long Head (Lengthened/Overhead)',   'Triceps Long Head'),
  ('triceps-lateral','triceps-brachii','Lateral Head (Outer)',               'Triceps Lateral Head'),
  ('biceps-short', 'biceps-brachii',   'Short Head (Inner)',                'Biceps Short Head'),
  ('biceps-long',  'biceps-brachii',   'Long Head (Outer / Lengthened)',    'Biceps Long Head'),
  ('quads-rf',     'quadriceps',       'Rectus Femoris',                    'Rectus Femoris'),
  ('quads-vmo',    'quadriceps',       'Vastus Medialis',                   'VMO'),
  ('glutes-upper', 'gluteus-maximus',  'Upper Glutes',                      'Upper Glutes'),
  ('glutes-lower', 'gluteus-maximus',  'Lower Glutes',                      'Lower Glutes');

-- 20260902_003 Create exercise_aliases table (UNIQUE normalized_alias, language)
CREATE TABLE public.exercise_aliases (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exercise_id      UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  alias            TEXT NOT NULL,
  normalized_alias TEXT NOT NULL,
  language         TEXT NOT NULL DEFAULT 'en',
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (normalized_alias, language)
);
GRANT SELECT ON public.exercise_aliases TO authenticated, anon;
GRANT ALL ON public.exercise_aliases TO service_role;
ALTER TABLE public.exercise_aliases ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exercise_aliases readable" ON public.exercise_aliases FOR SELECT TO authenticated, anon USING (true);
CREATE INDEX idx_exercise_aliases_exercise ON public.exercise_aliases(exercise_id);
CREATE INDEX idx_exercise_aliases_normalized ON public.exercise_aliases(normalized_alias);

-- 20260902_004 Extend exercises.status CHECK to include 'draft','review'
ALTER TABLE public.exercises DROP CONSTRAINT IF EXISTS exercises_status_check;
ALTER TABLE public.exercises ADD CONSTRAINT exercises_status_check
  CHECK (status IN ('draft','review','active','deprecated','archived'));

-- 20260902_005 Add exercises.parent_exercise_id, variation_type, canonical_name
ALTER TABLE public.exercises ADD COLUMN IF NOT EXISTS parent_exercise_id UUID REFERENCES public.exercises(id);
ALTER TABLE public.exercises ADD COLUMN IF NOT EXISTS variation_type TEXT
  CHECK (variation_type IN ('equipment','grip','angle','stance','tempo','unilateral','load-type','other'));
ALTER TABLE public.exercises ADD COLUMN IF NOT EXISTS canonical_name TEXT;
CREATE INDEX IF NOT EXISTS idx_exercises_parent ON public.exercises(parent_exercise_id) WHERE parent_exercise_id IS NOT NULL;
