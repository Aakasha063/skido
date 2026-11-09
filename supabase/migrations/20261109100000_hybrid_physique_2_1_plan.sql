-- Curated plan: Hybrid Physique 2.1
-- Plan type: curated. Duration: 12 weeks. 5 training days + optional Saturday activity + Sunday rest.
-- Goal: overall hypertrophy, strength maintenance, fat loss and cardiovascular fitness.
--
-- Every lifting exercise maps to an existing library entry (looked up by slug below).
-- The library had no steady/interval bike, mobility, walking, swimming, outdoor cycling or
-- recreational-sport entries suitable for this plan's conditioning work, so those are added
-- first. They use category 'cardio' so the workout screen logs them as minutes.

-- ---------------------------------------------------------------------------
-- 1. New exercises
-- ---------------------------------------------------------------------------
INSERT INTO public.exercises
  (slug, name, primary_muscle, secondary_muscles, category, equipment, is_compound,
   setup, execution, breathing, cues, common_mistakes, should_feel,
   default_rest_seconds, default_rep_range, description, aliases, gif_url)
VALUES
  ('stationary-bike', 'Stationary Bike', 'Cardio', ARRAY['Quadriceps','Glutes','Hamstrings'], 'cardio', 'Stationary Bike', false,
   ARRAY['Set the saddle so your knee keeps a slight bend at the bottom of the pedal stroke.',
         'Set the handlebars so you can sit tall with relaxed shoulders.'],
   ARRAY['Pedal at an easy, steady cadence for the prescribed duration.',
         'Use light-to-moderate resistance so the effort stays conversational.'],
   'Breathe steadily and comfortably.',
   ARRAY['Easy effort - you should be able to hold a conversation.',
         'Smooth, even pedal strokes with a relaxed upper body.'],
   ARRAY['Saddle set too low, which loads the knees.',
         'Turning easy cycling into a hard effort - keep it recovery-friendly.'],
   'Light leg work and mildly elevated breathing that you could sustain for much longer.',
   0, '10 min',
   'Steady, low-intensity cycling on a stationary bike for aerobic conditioning and recovery.',
   ARRAY['easy cycling','stationary cycling','exercise bike'],
   '/exercises/0798-a8VDgLw.gif'),

  ('stationary-bike-hiit', 'Stationary Bike HIIT Intervals', 'Cardio', ARRAY['Quadriceps','Glutes','Hamstrings'], 'cardio', 'Stationary Bike', false,
   ARRAY['Set up the bike with a slight knee bend at the bottom of the pedal stroke.',
         'Warm up with 5 minutes of easy pedaling before the first interval.'],
   ARRAY['Hard interval: pedal hard for 20 seconds at about 8/10 effort, adding resistance as needed.',
         'Recovery interval: pedal easily for 100 seconds.',
         'Repeat for the prescribed number of rounds, then cool down with 5 minutes of easy pedaling.'],
   'Breathe hard but rhythmically during efforts; use the easy intervals to bring breathing back down.',
   ARRAY['Hard intervals around 8/10 effort - hard but repeatable, not an all-out sprint.',
         'Aim for a similar output on every hard interval.'],
   ARRAY['Skipping the warm-up.',
         'Going all-out in the first rounds and fading badly in later ones.',
         'Cutting the easy recovery intervals short.'],
   'Heavy breathing and leg burn during the hard efforts, settling during each recovery.',
   0, '8 x (20s hard / 100s easy)',
   'Short hard cycling efforts separated by easy pedaling, for cardiovascular fitness without heavy lifting.',
   ARRAY['bike hiit','bike sprints','cycling intervals'],
   '/exercises/2138-H1PESYI.gif'),

  ('mobility-routine', 'Mobility Routine', 'Full body', ARRAY['Hip Flexors','Glutes','Upper Back','Shoulders'], 'cardio', 'Bodyweight', false,
   ARRAY['Clear some floor space; a mat is optional.',
         'Move from one drill to the next without rushing.'],
   ARRAY['Work through gentle drills for the hips, thoracic spine, shoulders and ankles (for example hip flexor stretch, 90/90 hip switches, cat-cow, thoracic rotations, ankle rocks).',
         'Spend roughly 1-2 minutes per area, moving slowly through a comfortable range.',
         'Continue for the prescribed duration.'],
   'Slow, relaxed breathing; exhale as you ease into each position.',
   ARRAY['Gentle and controlled - never force end ranges.',
         'Stay in mild tension, not pain.'],
   ARRAY['Bouncing into stretches.',
         'Pushing into pain instead of mild tension.'],
   'A mild stretch and looser joints, never sharp pain.',
   0, '10 min',
   'A short, gentle full-body mobility sequence for the hips, spine, shoulders and ankles.',
   ARRAY['mobility','mobility flow','stretching'],
   NULL),

  ('brisk-walk', 'Brisk Walk', 'Cardio', ARRAY['Glutes','Calves'], 'cardio', 'Bodyweight', false,
   ARRAY['Wear comfortable shoes and pick a route or treadmill where you can keep a steady pace.'],
   ARRAY['Walk at a brisk pace - faster than a stroll, breathing noticeably harder but still able to talk.',
         'Keep the pace steady for the prescribed duration.'],
   'Breathe steadily; you should be able to speak in short sentences.',
   ARRAY['Swing your arms naturally and walk tall.',
         'Keep the pace brisk but conversational.'],
   ARRAY['Slowing to a stroll partway through.'],
   'Elevated breathing and warm legs at a pace you could hold for the full session.',
   0, '30-40 min',
   'Steady brisk walking, outdoors or on a treadmill, for low-impact aerobic activity.',
   ARRAY['walking','brisk walking','power walk'],
   NULL),

  ('swimming', 'Swimming', 'Cardio', ARRAY['Lats','Shoulders','Core'], 'cardio', 'Pool', false,
   ARRAY['Choose a stroke you can swim comfortably and continuously.'],
   ARRAY['Swim at an easy-to-moderate pace, resting at the wall as needed.',
         'Continue for the chosen duration.'],
   'Exhale steadily into the water and breathe in a relaxed rhythm.',
   ARRAY['Keep it recreational - smooth, relaxed strokes.'],
   ARRAY['Swimming hard enough to compromise recovery for the next training week.'],
   'Elevated breathing and a light full-body workout.',
   0, NULL,
   'Recreational swimming as a low-impact optional activity.',
   ARRAY['swim','pool swim'],
   NULL),

  ('outdoor-cycling', 'Outdoor Cycling', 'Cardio', ARRAY['Quadriceps','Glutes'], 'cardio', 'Bicycle', false,
   ARRAY['Check your bike and wear a helmet.'],
   ARRAY['Ride at a relaxed, recreational pace for the chosen duration.'],
   'Breathe steadily and comfortably.',
   ARRAY['Keep the effort easy to moderate - this is active recovery, not a race.'],
   ARRAY['Turning a recreational ride into a hard training session.'],
   'Light leg work and mildly elevated breathing.',
   0, NULL,
   'Recreational cycling outdoors as an optional low-intensity activity.',
   ARRAY['cycling','bike ride','recreational cycling'],
   NULL),

  ('recreational-sports', 'Recreational Sports', 'Cardio', ARRAY[]::text[], 'cardio', 'Bodyweight', false,
   ARRAY['Warm up briefly before playing.'],
   ARRAY['Play a recreational sport (for example football, badminton, tennis or basketball) at an enjoyable intensity.'],
   'Breathe naturally; take breaks as needed.',
   ARRAY['Keep it fun and recreational.'],
   ARRAY['Playing so hard that it compromises recovery for the next training week.'],
   'Enjoyable activity with intermittently elevated breathing.',
   0, NULL,
   'Any recreational sport as an optional active day.',
   ARRAY['sports','recreational sport'],
   NULL);

-- Taxonomy links, mirroring Incline Treadmill Walk (cardiovascular-system primary, locomotion pattern).
INSERT INTO public.exercise_muscles (exercise_id, muscle_id, role)
SELECT e.id, m.muscle_id, m.role
FROM (VALUES
  ('stationary-bike', 'cardiovascular-system', 'primary'),
  ('stationary-bike', 'quadriceps', 'secondary'),
  ('stationary-bike', 'gluteus-maximus', 'secondary'),
  ('stationary-bike-hiit', 'cardiovascular-system', 'primary'),
  ('stationary-bike-hiit', 'quadriceps', 'secondary'),
  ('stationary-bike-hiit', 'gluteus-maximus', 'secondary'),
  ('stationary-bike-hiit', 'hamstrings', 'secondary'),
  ('brisk-walk', 'cardiovascular-system', 'primary'),
  ('brisk-walk', 'gluteus-maximus', 'secondary'),
  ('brisk-walk', 'gastrocnemius', 'secondary'),
  ('swimming', 'cardiovascular-system', 'primary'),
  ('swimming', 'latissimus-dorsi', 'secondary'),
  ('swimming', 'anterior-deltoid', 'secondary'),
  ('outdoor-cycling', 'cardiovascular-system', 'primary'),
  ('outdoor-cycling', 'quadriceps', 'secondary'),
  ('outdoor-cycling', 'gluteus-maximus', 'secondary'),
  ('recreational-sports', 'cardiovascular-system', 'primary')
) AS m(slug, muscle_id, role)
JOIN public.exercises e ON e.slug = m.slug;

INSERT INTO public.exercise_movements (exercise_id, movement_pattern_id, is_primary)
SELECT e.id, 'locomotion', true
FROM public.exercises e
WHERE e.slug IN ('stationary-bike', 'stationary-bike-hiit', 'brisk-walk', 'swimming', 'outdoor-cycling', 'recreational-sports');

-- ---------------------------------------------------------------------------
-- 2. Template
-- ---------------------------------------------------------------------------
INSERT INTO public.workout_templates (slug, name, description, notes)
VALUES (
  'hybrid-physique-2-1',
  'Hybrid Physique 2.1',
  '12-week, 5-day upper/lower plan for hypertrophy and strength maintenance, with incline walks, easy cycling and weekly bike HIIT for fat loss and cardiovascular fitness. Optional Saturday activity, Sunday rest.',
  $notes$Plan type: curated. Duration: 12 weeks. Goal: overall hypertrophy, strength maintenance, fat loss and cardiovascular fitness. Training: 5 days per week (Mon Upper A strength; Tue Lower A + core; Wed bike HIIT + mobility; Thu Upper B hypertrophy; Fri Lower B + core + arm finisher). Saturday: optional activity. Sunday: rest.

WEEKLY DIRECT WORKING SETS: Chest 9. Back 12. Front delts 3 + indirect pressing. Side delts 9. Rear delts 5. Biceps 6. Triceps 6. Quadriceps 8. Hamstrings 6. Glutes 5-6. Calves 7. Core 10. Compound exercises also stimulate secondary muscles.

CARDIO TARGETS (weekly): Incline treadmill 2 sessions. Easy cycling 2 sessions. Bike HIIT 1 session. Optional Saturday activity 1 session. Daily steps: gradually build towards 8,000-10,000.

NUTRITION TARGETS (starting): Calories 2,400 kcal. Protein 150-175 g. Fat approximately 60-75 g. Carbohydrates: remaining calories. Creatine 3-5 g/day, if tolerated. 2,400 kcal is a starting estimate, not a confirmed maintenance calculation.

WEEK 1 LOAD-SETTING RULE: The listed reference loads are starting points, not targets to force. Choose a load that lets you complete the prescribed reps with good technique. Keep approximately 1-2 reps in reserve on compound exercises. If a listed weight prevents you reaching the rep range, reduce it. Record the actual load, reps and any adjustments in your training log. Confirm whether dumbbell numbers are per hand and whether machine numbers refer to the machine's displayed stack weight. The 35 kg shoulder press, 32.5 kg incline dumbbell press and 55 kg rear-delt fly need particular verification against your usual equipment and logging convention.

PROGRESSION RULE: You do not need to increase weight every week. Maintaining the same loads and reps while bodyweight and waist circumference decrease is a successful outcome. Increase weight only when you can complete the top of the rep range with good technique and appropriate reps in reserve.

FAT-LOSS TRACKING: 1) Weigh every morning after using the bathroom and before eating. 2) Calculate your seven-day average. 3) Measure waist circumference at the navel once weekly. 4) Take progress photos every two weeks under consistent conditions. Target weight loss: approximately 0.2-0.4 kg per week. If weight loss is below 0.15 kg/week for two consecutive weeks, with good adherence, reduce calories by 100-150. If weight loss exceeds 0.5 kg/week consistently or strength and recovery deteriorate, add 100-150 calories.

12-WEEK WIN CONDITION: Maintain your Week 1 working loads and reps on key exercises. Reduce waist circumference. Improve abdominal definition. Preserve muscle size and strength. Improve cardiovascular conditioning. Maintain consistent training and recovery.$notes$
);

-- ---------------------------------------------------------------------------
-- 3. Days
-- ---------------------------------------------------------------------------
INSERT INTO public.workout_days
  (template_id, slug, day_of_week, name, focus, is_optional, is_rest, cardio_note, notes, sort_order)
SELECT t.id, d.slug, d.dow, d.name, d.focus, d.is_optional, d.is_rest, d.cardio_note, d.notes, d.sort_order
FROM public.workout_templates t
CROSS JOIN (VALUES
  ('hp21-mon-upper-a',     1::smallint, 'Upper A',                  'Upper Body A (Strength)',             false, false, 'Incline treadmill 15 min', NULL, 1),
  ('hp21-tue-lower-a',     2::smallint, 'Lower A',                  'Lower Body A + Core',                 false, false, 'Easy cycling 10 min', NULL, 2),
  ('hp21-wed-bike-hiit',   3::smallint, 'Bike HIIT',                'Bike HIIT + Mobility',                false, false, 'Bike HIIT: 5 min warm-up, 8 x (20s hard / 100s easy), 5 min cooldown', 'Keep hard intervals around 8/10 effort. No heavy lifting. Finish with 10 minutes of mobility.', 3),
  ('hp21-thu-upper-b',     4::smallint, 'Upper B',                  'Upper Body B (Hypertrophy)',          false, false, 'Incline treadmill 15 min', NULL, 4),
  ('hp21-fri-lower-b',     5::smallint, 'Lower B',                  'Lower Body B + Core + Arm Finisher',  false, false, 'Easy cycling 10-15 min', NULL, 5),
  ('hp21-sat-brisk-walk',  6::smallint, 'Saturday - Brisk Walk',    'Brisk Walk',                          true,  false, 'Brisk walking 30-40 min', 'Optional activity - choose one.', 6),
  ('hp21-sat-swimming',    6::smallint, 'Saturday - Swimming',      'Swimming',                            true,  false, 'Recreational swimming', 'Optional activity - choose one.', 7),
  ('hp21-sat-cycling',     6::smallint, 'Saturday - Cycling',       'Recreational Cycling',                true,  false, 'Recreational cycling', 'Optional activity - choose one.', 8),
  ('hp21-sat-sports',      6::smallint, 'Saturday - Sports',        'Recreational Sports',                 true,  false, 'Recreational sports', 'Optional activity - choose one.', 9),
  ('hp21-sat-mobility',    6::smallint, 'Saturday - Mobility',      'Gentle Mobility',                     true,  false, 'Gentle mobility', 'Optional activity - choose one.', 10),
  ('hp21-sun-rest',        0::smallint, 'Sunday',                   'Rest',                                false, true,  'Rest. Prioritize recovery and sleep.', 'Prioritize recovery and sleep.', 11)
) AS d(slug, dow, name, focus, is_optional, is_rest, cardio_note, notes, sort_order)
WHERE t.slug = 'hybrid-physique-2-1';

-- ---------------------------------------------------------------------------
-- 4. Exercises per day
--    Rest periods and isolation RIR follow the app's existing curated-plan conventions;
--    compound RIR (1-2) comes from the plan's Week 1 load-setting rule.
-- ---------------------------------------------------------------------------
INSERT INTO public.workout_exercises
  (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, block, notes)
SELECT d.id, e.id, x.pos, x.sets, x.rep_range, x.rep_min, x.rep_max, x.rir, x.rest_note, x.rest_seconds, x.block, x.notes
FROM (VALUES
  -- Monday: Upper Body A (Strength)
  ('hp21-mon-upper-a', 'incline-smith-press',            1, 3, '6-8',   6,  8,  '1-2', '2-3 min',   150, NULL, 'Week 1 reference load: 60 kg.'),
  ('hp21-mon-upper-a', 'wide-grip-lat-pulldown',         2, 3, '8-10',  8,  10, '1-2', '2 min',     120, NULL, 'Lat pulldown. Week 1 reference load: 86 kg.'),
  ('hp21-mon-upper-a', 'dumbbell-bench-press',           3, 3, '8-10',  8,  10, '1-2', '2 min',     120, NULL, 'Flat dumbbell press. Week 1 reference load: 30 kg per hand.'),
  ('hp21-mon-upper-a', 'chest-supported-row',            4, 3, '8-10',  8,  10, '1-2', '2 min',     120, NULL, 'Week 1 reference load: 30-35 kg.'),
  ('hp21-mon-upper-a', 'seated-dumbbell-shoulder-press', 5, 3, '8-10',  8,  10, '1-2', '2 min',     120, NULL, 'Week 1 reference load: 35 kg - verify against your usual equipment and logging convention (per hand or total).'),
  ('hp21-mon-upper-a', 'cable-lateral-raise',            6, 3, '12-15', 12, 15, '0-1', '60-90 sec', 75,  NULL, 'Week 1 reference load: 20 kg.'),
  ('hp21-mon-upper-a', 'rear-delt-cable-fly',            7, 2, '15',    15, 15, '0-1', '60 sec',    60,  NULL, 'Week 1 reference load: 55 kg - verify against your usual equipment and logging convention.'),
  ('hp21-mon-upper-a', 'rope-pushdown',                  8, 2, '12',    12, 12, '0-1', '60 sec',    60,  NULL, 'Rope triceps pushdown. Choose a controlled load.'),
  ('hp21-mon-upper-a', 'dumbbell-biceps-curl',           9, 2, '12',    12, 12, '0-1', '60 sec',    60,  NULL, 'Choose a controlled load.'),
  ('hp21-mon-upper-a', 'incline-treadmill-walk',        10, 1, '15 min', NULL, NULL, NULL, NULL,    0,   NULL, NULL),

  -- Tuesday: Lower Body A + Core
  ('hp21-tue-lower-a', 'smith-hack-squat',               1, 3, '8-10',  8,  10, '1-2', '2-3 min',   150, NULL, 'Week 1 reference load: 35-50 kg.'),
  ('hp21-tue-lower-a', 'leg-press',                      2, 3, '10-12', 10, 12, '1-2', '2 min',     120, NULL, 'Week 1 reference load: 130 kg.'),
  ('hp21-tue-lower-a', 'lever-seated-leg-curl',          3, 3, '10-12', 10, 12, '0-1', '90 sec',    90,  NULL, 'Seated leg curl. Week 1 reference load: 95 kg.'),
  ('hp21-tue-lower-a', 'leg-extension',                  4, 2, '12-15', 12, 15, '0-1', '60-90 sec', 75,  NULL, 'Week 1 reference load: 77.5 kg.'),
  ('hp21-tue-lower-a', 'standing-calf-raise',            5, 4, '12-15', 12, 15, '0-1', '60-90 sec', 75,  NULL, 'Week 1 reference load: 30 kg.'),
  ('hp21-tue-lower-a', 'dead-bug',                       6, 3, '10 / side', 10, 10, NULL, '60 sec', 60,  NULL, 'Bodyweight.'),
  ('hp21-tue-lower-a', 'pallof-press',                   7, 2, '12 / side', 12, 12, NULL, '60 sec', 60,  NULL, 'Use a controlled load.'),
  ('hp21-tue-lower-a', 'stationary-bike',                8, 1, '10 min', NULL, NULL, NULL, NULL,    0,   NULL, 'Easy cycling.'),

  -- Wednesday: Bike HIIT + Mobility
  ('hp21-wed-bike-hiit', 'stationary-bike-hiit',         1, 1, '5 min warm-up + 8 x (20s hard / 100s easy) + 5 min cooldown', NULL, NULL, NULL, NULL, 0, NULL, 'Keep hard intervals around 8/10 effort. About 26 minutes in total, including warm-up and cooldown.'),
  ('hp21-wed-bike-hiit', 'mobility-routine',             2, 1, '10 min', NULL, NULL, NULL, NULL,    0,   NULL, 'No heavy lifting today.'),

  -- Thursday: Upper Body B (Hypertrophy)
  ('hp21-thu-upper-b', 'incline-dumbbell-press',         1, 3, '10-12', 10, 12, '1-2', '2 min',     120, NULL, 'Week 1 reference load: 32.5 kg per hand - verify against your usual equipment and logging convention.'),
  ('hp21-thu-upper-b', 'neutral-grip-lat-pulldown',      2, 3, '10-12', 10, 12, '1-2', '2 min',     120, NULL, 'Choose a controlled load.'),
  ('hp21-thu-upper-b', 'cable-seated-row',               3, 3, '10-12', 10, 12, '1-2', '2 min',     120, NULL, 'Seated cable row. Choose a controlled load.'),
  ('hp21-thu-upper-b', 'lateral-raise-machine',          4, 3, '15-20', 15, 20, '0-1', '60-90 sec', 75,  NULL, 'Machine lateral raise. Week 1 reference load: 64 kg.'),
  ('hp21-thu-upper-b', 'cable-lateral-raise',            5, 3, '12-15', 12, 15, '0-1', '60-90 sec', 75,  NULL, 'Week 1 reference load: 20 kg.'),
  ('hp21-thu-upper-b', 'rear-delt-fly',                  6, 3, '15-20', 15, 20, '0-1', '60 sec',    60,  NULL, 'Week 1 reference load: 55 kg - verify against your usual equipment and logging convention.'),
  ('hp21-thu-upper-b', 'ez-bar-curl',                    7, 2, '10-12', 10, 12, '0-1', '60-90 sec', 75,  NULL, 'Choose a controlled load.'),
  ('hp21-thu-upper-b', 'overhead-cable-triceps-extension', 8, 2, '12',  12, 12, '0-1', '60-90 sec', 75,  NULL, 'Choose a controlled load.'),
  ('hp21-thu-upper-b', 'incline-treadmill-walk',         9, 1, '15 min', NULL, NULL, NULL, NULL,    0,   NULL, NULL),

  -- Friday: Lower Body B + Core + Arm Finisher
  ('hp21-fri-lower-b', 'bulgarian-split-squat',          1, 2, '10 / leg', 10, 10, '1-2', '90 sec', 90,  NULL, 'Week 1 reference load: 15 kg - verify against your usual equipment and logging convention.'),
  ('hp21-fri-lower-b', 'hip-thrust',                     2, 3, '10-12', 10, 12, '1-2', '2 min',     120, NULL, 'Week 1 reference load: 70-80 kg.'),
  ('hp21-fri-lower-b', 'lever-lying-leg-curl',           3, 3, '12',    12, 12, '0-1', '90 sec',    90,  NULL, 'Lying leg curl. Choose a controlled load.'),
  ('hp21-fri-lower-b', 'seated-calf-raise',              4, 3, '15',    15, 15, '0-1', '60 sec',    60,  NULL, 'Choose a controlled load.'),
  ('hp21-fri-lower-b', 'pallof-press',                   5, 3, '12 / side', 12, 12, NULL, '60 sec', 60,  NULL, 'Use a controlled load.'),
  ('hp21-fri-lower-b', 'dead-bug',                       6, 2, '10 / side', 10, 10, NULL, '60 sec', 60,  NULL, 'Bodyweight.'),
  ('hp21-fri-lower-b', 'cable-curl',                     7, 2, '12',    12, 12, '0-1', '0 sec',     0,   'finisher', 'Arm finisher superset A1. Perform A1 -> immediately A2, then rest 60-90 sec. Repeat twice.'),
  ('hp21-fri-lower-b', 'rope-pushdown',                  8, 2, '12',    12, 12, '0-1', '60-90 sec', 75,  'finisher', 'Arm finisher superset A2. Rest 60-90 sec after each round.'),
  ('hp21-fri-lower-b', 'stationary-bike',                9, 1, '10-15 min', NULL, NULL, NULL, NULL, 0,   NULL, 'Easy cycling.'),

  -- Saturday: optional activity (choose one)
  ('hp21-sat-brisk-walk', 'brisk-walk',                  1, 1, '30-40 min',    NULL, NULL, NULL, NULL, 0, NULL, NULL),
  ('hp21-sat-swimming',   'swimming',                    1, 1, 'Any duration', NULL, NULL, NULL, NULL, 0, NULL, 'Keep it easy to moderate.'),
  ('hp21-sat-cycling',    'outdoor-cycling',             1, 1, 'Any duration', NULL, NULL, NULL, NULL, 0, NULL, 'Keep it easy to moderate.'),
  ('hp21-sat-sports',     'recreational-sports',         1, 1, 'Any duration', NULL, NULL, NULL, NULL, 0, NULL, 'Keep it recreational.'),
  ('hp21-sat-mobility',   'mobility-routine',            1, 1, 'Any duration', NULL, NULL, NULL, NULL, 0, NULL, 'Gentle mobility.')
) AS x(day_slug, ex_slug, pos, sets, rep_range, rep_min, rep_max, rir, rest_note, rest_seconds, block, notes)
JOIN public.workout_days d ON d.slug = x.day_slug
LEFT JOIN public.exercises e ON e.slug = x.ex_slug;
-- LEFT JOIN on exercises: an unknown exercise slug yields NULL exercise_id, which violates
-- NOT NULL and aborts the migration instead of silently dropping the row.
