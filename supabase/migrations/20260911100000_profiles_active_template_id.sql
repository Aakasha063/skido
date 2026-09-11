-- Track which curated workout_templates plan each profile is currently on,
-- so multiple curated plans (not just the single legacy V-Taper block) can
-- be shown/assigned per user.
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS active_template_id UUID REFERENCES public.workout_templates(id);

-- Backfill existing profiles onto the pre-existing plan so nothing changes
-- for users who already onboarded before multi-plan support existed.
UPDATE public.profiles
SET active_template_id = (SELECT id FROM public.workout_templates WHERE slug = 'v-taper-fat-loss')
WHERE active_template_id IS NULL;
