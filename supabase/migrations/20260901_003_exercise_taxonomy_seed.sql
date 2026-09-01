-- Phase 1c: Seed exercise_muscles, exercise_movements, exercise_equipment
-- for all 43 existing exercises.
-- Uses slug lookups — no hardcoded UUIDs.

BEGIN;

-- ══════════════════════════════════════════════════════════════════════════════
-- exercise_muscles
-- ══════════════════════════════════════════════════════════════════════════════
INSERT INTO public.exercise_muscles (exercise_id, muscle_group_id, role)
SELECT e.id, v.mg, v.role
FROM (VALUES
  -- incline-smith-press
  ('incline-smith-press',           'chest-upper',   'primary'),
  ('incline-smith-press',           'front-delts',   'secondary'),
  ('incline-smith-press',           'triceps',        'secondary'),
  -- flat-machine-chest-press
  ('flat-machine-chest-press',      'chest',          'primary'),
  ('flat-machine-chest-press',      'front-delts',   'secondary'),
  ('flat-machine-chest-press',      'triceps',        'secondary'),
  -- lateral-raise-machine
  ('lateral-raise-machine',         'side-delts',    'primary'),
  ('lateral-raise-machine',         'traps',          'secondary'),
  -- pec-deck
  ('pec-deck',                      'chest',          'primary'),
  ('pec-deck',                      'front-delts',   'secondary'),
  -- overhead-cable-triceps-extension
  ('overhead-cable-triceps-extension','triceps',      'primary'),
  -- rope-pushdown
  ('rope-pushdown',                 'triceps',        'primary'),
  -- pallof-press
  ('pallof-press',                  'abs',            'primary'),
  ('pallof-press',                  'obliques',       'secondary'),
  -- wide-grip-lat-pulldown
  ('wide-grip-lat-pulldown',        'lats',           'primary'),
  ('wide-grip-lat-pulldown',        'biceps',         'secondary'),
  ('wide-grip-lat-pulldown',        'rear-delts',    'secondary'),
  -- chest-supported-row
  ('chest-supported-row',           'mid-back',       'primary'),
  ('chest-supported-row',           'lats',           'secondary'),
  ('chest-supported-row',           'rear-delts',    'secondary'),
  ('chest-supported-row',           'biceps',         'tertiary'),
  -- straight-arm-pulldown
  ('straight-arm-pulldown',         'lats',           'primary'),
  -- rear-delt-fly
  ('rear-delt-fly',                 'rear-delts',    'primary'),
  ('rear-delt-fly',                 'mid-back',       'secondary'),
  -- face-pull
  ('face-pull',                     'rear-delts',    'primary'),
  ('face-pull',                     'upper-back',    'secondary'),
  ('face-pull',                     'rotator-cuff',  'tertiary'),
  -- incline-dumbbell-curl
  ('incline-dumbbell-curl',         'biceps',         'primary'),
  -- hanging-knee-raise
  ('hanging-knee-raise',            'abs',            'primary'),
  ('hanging-knee-raise',            'hip-flexors',   'secondary'),
  -- cable-crunch
  ('cable-crunch',                  'abs',            'primary'),
  -- leg-press
  ('leg-press',                     'quads',          'primary'),
  ('leg-press',                     'glutes',         'secondary'),
  ('leg-press',                     'hamstrings',     'tertiary'),
  -- smith-hack-squat
  ('smith-hack-squat',              'quads',          'primary'),
  ('smith-hack-squat',              'glutes',         'secondary'),
  -- leg-curl
  ('leg-curl',                      'hamstrings',     'primary'),
  ('leg-curl',                      'calves',         'secondary'),
  -- bulgarian-split-squat
  ('bulgarian-split-squat',         'quads',          'primary'),
  ('bulgarian-split-squat',         'glutes',         'secondary'),
  -- leg-extension
  ('leg-extension',                 'quads',          'primary'),
  -- standing-calf-raise
  ('standing-calf-raise',           'gastrocnemius', 'primary'),
  ('standing-calf-raise',           'soleus',         'secondary'),
  -- seated-dumbbell-shoulder-press
  ('seated-dumbbell-shoulder-press','front-delts',   'primary'),
  ('seated-dumbbell-shoulder-press','side-delts',    'secondary'),
  ('seated-dumbbell-shoulder-press','triceps',        'tertiary'),
  -- cable-lateral-raise
  ('cable-lateral-raise',           'side-delts',    'primary'),
  -- rear-delt-cable-fly
  ('rear-delt-cable-fly',           'rear-delts',    'primary'),
  ('rear-delt-cable-fly',           'upper-back',    'secondary'),
  -- triceps-press-machine
  ('triceps-press-machine',         'triceps',        'primary'),
  -- ez-bar-preacher-curl
  ('ez-bar-preacher-curl',          'biceps',         'primary'),
  ('ez-bar-preacher-curl',          'forearms',       'secondary'),
  -- hammer-curl
  ('hammer-curl',                   'brachialis',    'primary'),
  ('hammer-curl',                   'biceps',         'secondary'),
  ('hammer-curl',                   'forearms',       'secondary'),
  -- incline-dumbbell-press
  ('incline-dumbbell-press',        'chest-upper',   'primary'),
  ('incline-dumbbell-press',        'front-delts',   'secondary'),
  ('incline-dumbbell-press',        'triceps',        'secondary'),
  -- neutral-grip-lat-pulldown
  ('neutral-grip-lat-pulldown',     'lats',           'primary'),
  ('neutral-grip-lat-pulldown',     'biceps',         'secondary'),
  -- cable-chest-fly
  ('cable-chest-fly',               'chest',          'primary'),
  ('cable-chest-fly',               'front-delts',   'secondary'),
  -- hip-thrust
  ('hip-thrust',                    'glutes',         'primary'),
  ('hip-thrust',                    'hamstrings',     'secondary'),
  -- machine-shoulder-press
  ('machine-shoulder-press',        'front-delts',   'primary'),
  ('machine-shoulder-press',        'side-delts',    'secondary'),
  ('machine-shoulder-press',        'triceps',        'tertiary'),
  -- pull-ups
  ('pull-ups',                      'lats',           'primary'),
  ('pull-ups',                      'biceps',         'secondary'),
  ('pull-ups',                      'mid-back',       'secondary'),
  -- ez-bar-curl
  ('ez-bar-curl',                   'biceps',         'primary'),
  ('ez-bar-curl',                   'forearms',       'secondary'),
  -- incline-machine-press
  ('incline-machine-press',         'chest-upper',   'primary'),
  ('incline-machine-press',         'front-delts',   'secondary'),
  ('incline-machine-press',         'triceps',        'secondary'),
  -- weighted-chest-dips
  ('weighted-chest-dips',           'chest',          'primary'),
  ('weighted-chest-dips',           'triceps',        'secondary'),
  ('weighted-chest-dips',           'front-delts',   'secondary'),
  -- push-ups
  ('push-ups',                      'chest',          'primary'),
  ('push-ups',                      'triceps',        'secondary'),
  ('push-ups',                      'front-delts',   'secondary'),
  -- incline-treadmill-walk
  ('incline-treadmill-walk',        'cardiovascular','primary'),
  ('incline-treadmill-walk',        'glutes',         'secondary'),
  ('incline-treadmill-walk',        'calves',         'secondary'),
  -- weighted-dead-bug
  ('weighted-dead-bug',             'abs',            'primary'),
  ('weighted-dead-bug',             'hip-flexors',   'secondary'),
  -- wide-grip-chest-supported-row
  ('wide-grip-chest-supported-row', 'mid-back',       'primary'),
  ('wide-grip-chest-supported-row', 'rear-delts',    'secondary'),
  ('wide-grip-chest-supported-row', 'lats',           'secondary'),
  ('wide-grip-chest-supported-row', 'biceps',         'tertiary'),
  -- seated-calf-raise
  ('seated-calf-raise',             'soleus',         'primary'),
  ('seated-calf-raise',             'gastrocnemius', 'secondary'),
  -- dumbbell-or-barbell-shrug
  ('dumbbell-or-barbell-shrug',     'traps',          'primary'),
  -- reverse-wrist-curl
  ('reverse-wrist-curl',            'forearms',       'primary'),
  -- wrist-curl
  ('wrist-curl',                    'forearms',       'primary')
) AS v(slug, mg, role)
JOIN public.exercises e ON e.slug = v.slug;

-- ══════════════════════════════════════════════════════════════════════════════
-- exercise_movements
-- ══════════════════════════════════════════════════════════════════════════════
INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
SELECT e.id, v.mp, v.is_primary
FROM (VALUES
  -- Push exercises
  ('incline-smith-press',           'horizontal-push',  true),
  ('flat-machine-chest-press',      'horizontal-push',  true),
  ('incline-dumbbell-press',        'horizontal-push',  true),
  ('incline-machine-press',         'horizontal-push',  true),
  ('weighted-chest-dips',           'horizontal-push',  true),
  ('push-ups',                      'horizontal-push',  true),
  ('push-ups',                      'anti-extension',   false),
  ('pec-deck',                      'horizontal-push',  true),   -- fly variant of horizontal push
  ('cable-chest-fly',               'horizontal-push',  true),   -- fly variant
  -- Shoulder press (vertical push)
  ('seated-dumbbell-shoulder-press','vertical-push',    true),
  ('machine-shoulder-press',        'vertical-push',    true),
  -- Triceps isolation
  ('overhead-cable-triceps-extension','elbow-extension',true),
  ('rope-pushdown',                 'elbow-extension',  true),
  ('triceps-press-machine',         'elbow-extension',  true),
  -- Rows (horizontal pull)
  ('chest-supported-row',           'horizontal-pull',  true),
  ('wide-grip-chest-supported-row', 'horizontal-pull',  true),
  ('face-pull',                     'horizontal-pull',  true),
  ('face-pull',                     'shoulder-horizontal-abduction', false),
  -- Lat pulldowns / vertical pull
  ('wide-grip-lat-pulldown',        'vertical-pull',    true),
  ('neutral-grip-lat-pulldown',     'vertical-pull',    true),
  ('pull-ups',                      'vertical-pull',    true),
  ('straight-arm-pulldown',         'vertical-pull',    true),
  -- Rear delt / horizontal abduction
  ('rear-delt-fly',                 'shoulder-horizontal-abduction', true),
  ('rear-delt-cable-fly',           'shoulder-horizontal-abduction', true),
  -- Lateral raises (shoulder abduction)
  ('lateral-raise-machine',         'shoulder-abduction', true),
  ('cable-lateral-raise',           'shoulder-abduction', true),
  -- Shoulder elevation / shrug
  ('dumbbell-or-barbell-shrug',     'shoulder-elevation', true),
  -- Curls (elbow flexion)
  ('incline-dumbbell-curl',         'elbow-flexion',    true),
  ('ez-bar-preacher-curl',          'elbow-flexion',    true),
  ('ez-bar-curl',                   'elbow-flexion',    true),
  ('hammer-curl',                   'elbow-flexion',    true),
  -- Lower body: knee extension / squat patterns
  ('leg-press',                     'knee-extension',   true),
  ('smith-hack-squat',              'knee-extension',   true),
  ('leg-extension',                 'knee-extension',   true),
  ('bulgarian-split-squat',         'knee-extension',   true),
  ('bulgarian-split-squat',         'hip-extension',    false),
  -- Lower body: knee flexion
  ('leg-curl',                      'knee-flexion',     true),
  -- Lower body: hip extension / hinge
  ('hip-thrust',                    'hip-extension',    true),
  -- Calves
  ('standing-calf-raise',           'calf-plantarflexion', true),
  ('seated-calf-raise',             'calf-plantarflexion', true),
  -- Core
  ('pallof-press',                  'anti-rotation',    true),
  ('weighted-dead-bug',             'anti-extension',   true),
  ('cable-crunch',                  'core-flexion',     true),
  ('hanging-knee-raise',            'core-flexion',     true),
  -- Wrist
  ('wrist-curl',                    'wrist-flexion',    true),
  ('reverse-wrist-curl',            'wrist-extension',  true),
  -- Cardio
  ('incline-treadmill-walk',        'locomotion',       true)
) AS v(slug, mp, is_primary)
JOIN public.exercises e ON e.slug = v.slug;

-- ══════════════════════════════════════════════════════════════════════════════
-- exercise_equipment
-- ══════════════════════════════════════════════════════════════════════════════
INSERT INTO public.exercise_equipment (exercise_id, equipment_id, is_required)
SELECT e.id, v.eq, v.is_required
FROM (VALUES
  -- incline-smith-press
  ('incline-smith-press',           'smith-machine', true),
  ('incline-smith-press',           'bench',          true),
  -- flat-machine-chest-press
  ('flat-machine-chest-press',      'machine',        true),
  -- lateral-raise-machine
  ('lateral-raise-machine',         'machine',        true),
  -- pec-deck
  ('pec-deck',                      'machine',        true),
  -- overhead-cable-triceps-extension
  ('overhead-cable-triceps-extension','cable',        true),
  -- rope-pushdown
  ('rope-pushdown',                 'cable',          true),
  -- pallof-press
  ('pallof-press',                  'cable',          true),
  -- wide-grip-lat-pulldown
  ('wide-grip-lat-pulldown',        'cable',          true),
  -- chest-supported-row
  ('chest-supported-row',           'machine',        true),
  -- straight-arm-pulldown
  ('straight-arm-pulldown',         'cable',          true),
  -- rear-delt-fly
  ('rear-delt-fly',                 'machine',        true),
  -- face-pull
  ('face-pull',                     'cable',          true),
  -- incline-dumbbell-curl
  ('incline-dumbbell-curl',         'dumbbell',       true),
  ('incline-dumbbell-curl',         'bench',          true),
  -- hanging-knee-raise
  ('hanging-knee-raise',            'pull-up-bar',    true),
  -- cable-crunch
  ('cable-crunch',                  'cable',          true),
  -- leg-press
  ('leg-press',                     'machine',        true),
  -- smith-hack-squat
  ('smith-hack-squat',              'smith-machine',  true),
  -- leg-curl
  ('leg-curl',                      'machine',        true),
  -- bulgarian-split-squat
  ('bulgarian-split-squat',         'dumbbell',       true),
  ('bulgarian-split-squat',         'bench',          true),
  -- leg-extension
  ('leg-extension',                 'machine',        true),
  -- standing-calf-raise
  ('standing-calf-raise',           'machine',        true),
  -- seated-dumbbell-shoulder-press
  ('seated-dumbbell-shoulder-press','dumbbell',       true),
  ('seated-dumbbell-shoulder-press','bench',          true),
  -- cable-lateral-raise
  ('cable-lateral-raise',           'cable',          true),
  -- rear-delt-cable-fly
  ('rear-delt-cable-fly',           'cable',          true),
  -- triceps-press-machine
  ('triceps-press-machine',         'machine',        true),
  -- ez-bar-preacher-curl
  ('ez-bar-preacher-curl',          'ez-bar',         true),
  ('ez-bar-preacher-curl',          'preacher-bench', true),
  -- hammer-curl
  ('hammer-curl',                   'dumbbell',       true),
  -- incline-dumbbell-press
  ('incline-dumbbell-press',        'dumbbell',       true),
  ('incline-dumbbell-press',        'bench',          true),
  -- neutral-grip-lat-pulldown
  ('neutral-grip-lat-pulldown',     'cable',          true),
  -- cable-chest-fly
  ('cable-chest-fly',               'cable',          true),
  -- hip-thrust
  ('hip-thrust',                    'barbell',        true),
  ('hip-thrust',                    'bench',          true),
  ('hip-thrust',                    'weight-plates',  true),
  -- machine-shoulder-press
  ('machine-shoulder-press',        'machine',        true),
  -- pull-ups
  ('pull-ups',                      'pull-up-bar',    true),
  ('pull-ups',                      'weight-belt',    false),  -- optional for weighted
  -- ez-bar-curl
  ('ez-bar-curl',                   'ez-bar',         true),
  -- incline-machine-press
  ('incline-machine-press',         'machine',        true),
  -- weighted-chest-dips
  ('weighted-chest-dips',           'dip-bars',       true),
  ('weighted-chest-dips',           'weight-belt',    false),  -- optional for bodyweight version
  -- push-ups (no equipment required — bodyweight)
  -- incline-treadmill-walk
  ('incline-treadmill-walk',        'treadmill',      true),
  -- weighted-dead-bug
  ('weighted-dead-bug',             'dumbbell',       false),  -- optional (can be done bodyweight)
  -- wide-grip-chest-supported-row
  ('wide-grip-chest-supported-row', 'machine',        true),
  -- seated-calf-raise
  ('seated-calf-raise',             'machine',        true),
  -- dumbbell-or-barbell-shrug (either works — both optional)
  ('dumbbell-or-barbell-shrug',     'dumbbell',       false),
  ('dumbbell-or-barbell-shrug',     'barbell',        false),
  -- reverse-wrist-curl
  ('reverse-wrist-curl',            'barbell',        false),  -- can use dumbbell too
  ('reverse-wrist-curl',            'dumbbell',       false),
  -- wrist-curl
  ('wrist-curl',                    'barbell',        false),
  ('wrist-curl',                    'dumbbell',       false)
) AS v(slug, eq, is_required)
JOIN public.exercises e ON e.slug = v.slug;

COMMIT;

-- ── Verification queries (run to confirm completeness) ──────────────────────
-- SELECT e.slug, count(em.muscle_group_id) muscle_count
-- FROM exercises e LEFT JOIN exercise_muscles em ON em.exercise_id = e.id
-- GROUP BY e.slug HAVING count(em.muscle_group_id) = 0;
-- 
-- SELECT e.slug, count(emv.movement_pattern_id) pattern_count
-- FROM exercises e LEFT JOIN exercise_movements emv ON emv.exercise_id = e.id
-- GROUP BY e.slug HAVING count(emv.movement_pattern_id) = 0;
