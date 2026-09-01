-- Migration to drop NOT NULL constraint on template_id for custom plans
ALTER TABLE public.workout_days ALTER COLUMN template_id DROP NOT NULL;
