-- Phase 0: Normalize free-text casing in exercises table
-- Safe UPDATE-only migration — no drops, no schema changes.

UPDATE public.exercises SET primary_muscle = 'Traps'    WHERE primary_muscle = 'traps';
UPDATE public.exercises SET primary_muscle = 'Forearms' WHERE primary_muscle = 'forearms';
UPDATE public.exercises SET primary_muscle = 'Core'     WHERE primary_muscle = 'core';

-- Fix inconsistent equipment values (for display; canonical truth moves to exercise_equipment junction)
UPDATE public.exercises SET equipment = 'Dumbbell / Barbell' WHERE equipment = 'dumbbell/barbell';
UPDATE public.exercises SET equipment = 'Barbell'            WHERE equipment = 'barbell';

-- Fix category casing
UPDATE public.exercises SET category = 'accessory' WHERE lower(category) = 'accessory';
