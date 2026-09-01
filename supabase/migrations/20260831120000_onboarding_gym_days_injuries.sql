-- Add gym_days_per_week and past_injuries to profiles table
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS gym_days_per_week integer,
  ADD COLUMN IF NOT EXISTS past_injuries text;
