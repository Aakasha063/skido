-- Curated plan: Toned Physique Plan
-- Plan type: curated. Audience: female. Primary goal: hypertrophy / physique.
-- Secondary goal: general-fitness. Days: 5. Split: lower-body emphasis + upper-body.
-- Experience: beginner -> intermediate.

INSERT INTO public.workout_templates (id, slug, name, description, notes)
VALUES (
  'f7429435-c527-472e-85c1-cbc61074e4a1',
  'toned-physique-plan',
  'Toned Physique Plan',
  'A 5-day split prioritizing glutes, quads and hamstrings, with upper-body accessory days for a balanced, toned look. Hypertrophy-focused, beginner to intermediate.',
  'Plan type: curated. Audience: female. Primary goal: hypertrophy / physique. Secondary goal: general fitness. Days: 5. Split: lower-body emphasis + upper-body. Experience: beginner to intermediate. Compounds: ~1-2 RIR, rest 90 sec-3 min. Isolation: ~0-1 RIR on the final set, rest 60-90 sec. Double progression: work to the top of the rep range across all sets, then add weight and restart near the bottom.'
);

INSERT INTO public.workout_days
  (id, template_id, slug, day_of_week, name, focus, is_optional, is_rest, estimated_minutes_min, estimated_minutes_max, cardio_note, sort_order)
VALUES
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', 'f7429435-c527-472e-85c1-cbc61074e4a1', 'toned-day1-lower-a', 1, 'Lower A', 'Glutes + Quads', false, false, NULL, NULL, NULL, 1),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', 'f7429435-c527-472e-85c1-cbc61074e4a1', 'toned-day2-upper-a', 2, 'Upper A', 'Back + Shoulders + Arms', false, false, NULL, NULL, NULL, 2),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', 'f7429435-c527-472e-85c1-cbc61074e4a1', 'toned-day3-lower-b', 3, 'Lower B', 'Hamstrings + Glutes', false, false, NULL, NULL, NULL, 3),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', 'f7429435-c527-472e-85c1-cbc61074e4a1', 'toned-day4-upper-b', 4, 'Upper B', 'Chest + Back + Shoulders + Core', false, false, NULL, NULL, NULL, 4),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', 'f7429435-c527-472e-85c1-cbc61074e4a1', 'toned-day5-full-body', 5, 'Full Body', 'Full Body + Conditioning', false, false, NULL, NULL, 'Moderate cardio 15-25 min', 5);

-- Day 1 -- Lower A: Glutes + Quads
INSERT INTO public.workout_exercises (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, notes) VALUES
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', 'a825cb21-65e7-47f3-bae6-7191a696551d', 1, 3, '8-12', 8, 12, '1-2', '2-3 min', 150, 'Alt: Barbell Back Squat'),
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', 'fbf0ad46-e549-4dcf-9b5f-f102b4657ba0', 2, 3, '8-12', 8, 12, '1-2', '2 min', 120, NULL),
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', '91e90c0f-9b65-4614-acd1-299bcdc83fc3', 3, 2, '8-12 / leg', 8, 12, '1-2', '90 sec', 90, NULL),
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', '80e0900f-c21a-40c7-a20f-632769eab30b', 4, 2, '10-15', 10, 15, '0-1', '90 sec', 90, NULL),
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', '8525ccdd-f1ce-4868-921b-1ea953365500', 5, 2, '12-15', 12, 15, '0-1', '60-90 sec', 75, NULL),
  ('2f2356c8-e97d-4484-bb9e-a68393f72860', '8adae13f-fcf8-4de3-9dd3-317e4efa4e88', 6, 2, '12-20', 12, 20, '0-1', '60 sec', 60, NULL);

-- Day 2 -- Upper A: Back + Shoulders + Arms
INSERT INTO public.workout_exercises (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, notes) VALUES
  ('565621c4-ed52-497c-97c6-f27177f3f5de', '9851fd78-07da-4a45-ad50-077b1396b1be', 1, 3, '8-12', 8, 12, '1-2', '2 min', 120, NULL),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', '5836226f-a527-420b-80c1-e3863dc704a9', 2, 3, '8-12', 8, 12, '1-2', '2 min', 120, NULL),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', '83e1b344-15b8-44a8-89b2-96224eab7c3c', 3, 3, '12-20', 12, 20, '0-1', '60 sec', 60, NULL),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', '7f86b3b1-d33e-464c-8c04-86a5f61de0f1', 4, 2, '12-20', 12, 20, '0-1', '60 sec', 60, NULL),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', 'ee7b9455-5a14-44d4-a584-3099ed79551d', 5, 2, '10-15', 10, 15, '0-1', '60-90 sec', 75, NULL),
  ('565621c4-ed52-497c-97c6-f27177f3f5de', '82a225f6-fa7b-422f-802a-b5251a299c8f', 6, 2, '10-15', 10, 15, '0-1', '60-90 sec', 75, NULL);

-- Day 3 -- Lower B: Hamstrings + Glutes
INSERT INTO public.workout_exercises (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, notes) VALUES
  ('ed812078-89b0-44f3-a457-2ac67baf5461', '2826f86a-1f06-460f-85d0-f5e2815aa5e7', 1, 3, '8-12', 8, 12, '1-2', '2-3 min', 150, 'Alt: Dumbbell Romanian Deadlift'),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', 'e569aa3e-04d6-482c-80d7-cb766eeeddc1', 2, 2, '8-12 / leg', 8, 12, '1-2', '90 sec', 90, 'Reverse Lunge'),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', 'c73065c9-cfc2-4b47-b96e-a2ea51271b7a', 3, 3, '10-15', 10, 15, '0-1', '60-90 sec', 75, NULL),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', 'c6264b0b-b7c0-4ecc-9265-12131451155c', 4, 2, '10-15', 10, 15, '0-1', '60-90 sec', 75, 'Alt: Barbell Hip Thrust'),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', 'bbe285b7-1251-4f22-bc7f-af81aaf85fc7', 5, 2, '15-20', 15, 20, '0-1', '60 sec', 60, NULL),
  ('ed812078-89b0-44f3-a457-2ac67baf5461', '8adae13f-fcf8-4de3-9dd3-317e4efa4e88', 6, 2, '12-20', 12, 20, '0-1', '60 sec', 60, NULL);

-- Day 4 -- Upper B: Chest + Back + Shoulders + Core
INSERT INTO public.workout_exercises (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, notes) VALUES
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', '9376909d-db6b-4531-af51-0579464279d7', 1, 3, '8-12', 8, 12, '1-2', '2-3 min', 150, NULL),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', 'd9dd877a-5600-49d8-b364-7ff9fe718ffb', 2, 2, '8-12', 8, 12, '1-2', '2 min', 120, 'Alt: Wide-Grip Lat Pulldown'),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', '5836226f-a527-420b-80c1-e3863dc704a9', 3, 2, '10-15', 10, 15, '0-1', '90 sec', 90, NULL),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', '83e1b344-15b8-44a8-89b2-96224eab7c3c', 4, 3, '12-20', 12, 20, '0-1', '60 sec', 60, NULL),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', 'dbe692d8-5484-4d52-9ab2-c23d4999fc19', 5, 2, '10-15', 10, 15, '0-1', '90 sec', 90, NULL),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', '57c25d2a-01b6-4136-875b-49e62770ea1d', 6, 3, '10-15', 10, 15, '0-1', '60 sec', 60, NULL),
  ('9eb9b4ed-e029-4f23-a917-968992b44f4a', '0410799e-5627-4e2f-959e-93a35a7c47fc', 7, 2, '30-60 sec', NULL, NULL, NULL, '45 sec', 45, 'Static hold: hold the bottom forearm-plank position for the full duration each set instead of performing reps.');

-- Day 5 -- Full Body + Conditioning
INSERT INTO public.workout_exercises (day_id, exercise_id, "position", sets, rep_range, rep_min, rep_max, rir_target, rest_note, rest_seconds, notes) VALUES
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', 'a825cb21-65e7-47f3-bae6-7191a696551d', 1, 2, '10-15', 10, 15, '1-2', '90 sec', 90, NULL),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', 'da4fa953-7965-4574-a737-8315b8c1a521', 2, 2, '10-15', 10, 15, '1-2', '90 sec', 90, NULL),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', '9376909d-db6b-4531-af51-0579464279d7', 3, 2, '10-15', 10, 15, '1-2', '90 sec', 90, NULL),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', 'd98bb38c-5c31-4ffe-b8cc-784ec94096f8', 4, 2, '10-15', 10, 15, '1-2', '90 sec', 90, 'Alt: Cable Seated Row'),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', '83e1b344-15b8-44a8-89b2-96224eab7c3c', 5, 2, '15-20', 15, 20, '0-1', '60 sec', 60, NULL),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', '96a23635-5b5b-4c12-a672-e4f75ed35cc6', 6, 2, '10-15', 10, 15, '0-1', '60 sec', 60, NULL),
  ('c0167c58-ba5d-4bb6-bf2c-dd1de42143d0', '982a0879-5e4f-42f4-b58f-5099de3507ce', 7, 1, '15-25 min', NULL, NULL, NULL, NULL, 0, 'Any moderate-intensity cardio modality (bike, elliptical, incline walk). Breathing harder but still able to speak in short sentences.');
