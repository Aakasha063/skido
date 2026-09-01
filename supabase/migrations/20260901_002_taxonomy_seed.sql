-- Phase 1b: Seed taxonomy lookup tables
-- muscle_groups, movement_patterns, equipment_items

-- ── muscle_groups ──────────────────────────────────────────────────────────────
-- Insert parents first, children second (self-referential FK)
INSERT INTO public.muscle_groups (id, name, body_region, parent_id) VALUES
  -- Upper body: chest
  ('chest',       'Chest (Pectoralis Major)',  'upper-body', NULL),
  ('chest-upper', 'Upper Chest',               'upper-body', 'chest'),
  ('chest-lower', 'Lower Chest',               'upper-body', 'chest'),
  -- Upper body: back
  ('lats',        'Latissimus Dorsi',          'upper-body', NULL),
  ('mid-back',    'Mid Back (Rhomboids / Mid Traps)', 'upper-body', NULL),
  ('upper-back',  'Upper Back (Lower Traps)',  'upper-body', NULL),
  ('traps',       'Trapezius (Upper)',         'upper-body', NULL),
  -- Upper body: shoulders
  ('front-delts', 'Front Deltoid',             'upper-body', NULL),
  ('side-delts',  'Lateral Deltoid',           'upper-body', NULL),
  ('rear-delts',  'Rear Deltoid',              'upper-body', NULL),
  ('rotator-cuff','Rotator Cuff',              'upper-body', NULL),
  -- Upper body: arms
  ('biceps',      'Biceps Brachii',            'upper-body', NULL),
  ('brachialis',  'Brachialis',               'upper-body', NULL),
  ('triceps',     'Triceps Brachii',           'upper-body', NULL),
  ('forearms',    'Forearms',                  'upper-body', NULL),
  -- Lower body
  ('quads',       'Quadriceps',               'lower-body', NULL),
  ('hamstrings',  'Hamstrings',               'lower-body', NULL),
  ('glutes',      'Gluteus Maximus',           'lower-body', NULL),
  ('glute-med',   'Gluteus Medius',            'lower-body', 'glutes'),
  ('calves',      'Calves',                    'lower-body', NULL),
  ('gastrocnemius','Gastrocnemius',            'lower-body', 'calves'),
  ('soleus',      'Soleus',                    'lower-body', 'calves'),
  ('hip-flexors', 'Hip Flexors',               'lower-body', NULL),
  ('adductors',   'Hip Adductors',             'lower-body', NULL),
  -- Core
  ('abs',         'Rectus Abdominis',          'core',       NULL),
  ('obliques',    'Obliques',                  'core',       NULL),
  -- Cardio / systemic
  ('cardiovascular','Cardiovascular System',  'cardio',     NULL);

-- ── movement_patterns ──────────────────────────────────────────────────────────
INSERT INTO public.movement_patterns (id, name, description) VALUES
  ('horizontal-push',             'Horizontal Push',            'Pressing in horizontal plane — bench press, push-up, chest fly'),
  ('vertical-push',               'Vertical Push',              'Pressing overhead — shoulder press, dumbbell OHP'),
  ('horizontal-pull',             'Horizontal Pull',            'Rowing pattern — chest-supported row, face pull'),
  ('vertical-pull',               'Vertical Pull',              'Pulling from overhead — lat pulldown, pull-up, straight-arm pulldown'),
  ('hip-extension',               'Hip Extension / Hinge',      'Hip thrust, RDL, hinge pattern — glute/hamstring dominant'),
  ('knee-extension',              'Knee Extension / Squat',     'Quad-dominant push: leg press, squat, split squat'),
  ('knee-flexion',                'Knee Flexion',               'Hamstring curl pattern — leg curl'),
  ('shoulder-abduction',          'Shoulder Abduction',         'Lateral raise — arm moves away from body in frontal plane'),
  ('shoulder-horizontal-abduction','Shoulder Horizontal Abduction','Rear delt fly / face pull — arm moves back in transverse plane'),
  ('shoulder-elevation',          'Shoulder Elevation / Shrug', 'Upper trap shrug'),
  ('elbow-flexion',               'Elbow Flexion / Curl',       'Bicep curl pattern — any variation'),
  ('elbow-extension',             'Elbow Extension / Triceps',  'Triceps extension / pushdown pattern'),
  ('calf-plantarflexion',         'Calf Raise / Plantarflexion','Standing or seated calf raise'),
  ('anti-rotation',               'Anti-Rotation',              'Resisting rotational force — Pallof press'),
  ('anti-extension',              'Anti-Extension',             'Resisting lumbar extension — dead bug, plank, ab wheel'),
  ('core-flexion',                'Core Flexion',               'Spine or pelvis flexion under load — crunch, hanging leg raise'),
  ('wrist-flexion',               'Wrist Flexion',              'Forearm curl — flexes wrist'),
  ('wrist-extension',             'Wrist Extension',            'Reverse wrist curl — extends wrist'),
  ('locomotion',                  'Locomotion / Cardio',        'Walking, running, cycling, rowing — steady-state cardiovascular work');

-- ── equipment_items ────────────────────────────────────────────────────────────
INSERT INTO public.equipment_items (id, name, category) VALUES
  ('barbell',        'Barbell',                 'free-weights'),
  ('dumbbell',       'Dumbbell',                'free-weights'),
  ('ez-bar',         'EZ Bar',                  'free-weights'),
  ('trap-bar',       'Trap Bar / Hex Bar',      'free-weights'),
  ('kettlebell',     'Kettlebell',              'free-weights'),
  ('weight-plates',  'Weight Plates',           'free-weights'),
  ('cable',          'Cable Machine',           'cable'),
  ('machine',        'Resistance Machine',      'machine'),
  ('smith-machine',  'Smith Machine',           'machine'),
  ('treadmill',      'Treadmill',               'cardio'),
  ('bench',          'Adjustable Bench',        'accessory'),
  ('rack',           'Power Rack / Squat Rack', 'accessory'),
  ('pull-up-bar',    'Pull-up Bar',             'bodyweight'),
  ('dip-bars',       'Dip Bars / Station',      'bodyweight'),
  ('preacher-bench', 'Preacher Curl Bench',     'accessory'),
  ('resistance-band','Resistance Band',         'free-weights'),
  ('weight-belt',    'Dipping Belt / Weight Belt','accessory');
