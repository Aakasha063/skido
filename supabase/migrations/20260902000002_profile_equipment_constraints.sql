-- 2. Profile equipment + constraints
-- 20260902_006 Create constraint_types table + seed (8 types)
CREATE TABLE public.constraint_types (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  body_region TEXT,
  description TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.constraint_types TO authenticated, anon;
GRANT ALL ON public.constraint_types TO service_role;
ALTER TABLE public.constraint_types ENABLE ROW LEVEL SECURITY;
CREATE POLICY "constraint_types readable" ON public.constraint_types FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.constraint_types (id, name, body_region, description) VALUES
  ('knee',       'Knee',                  'lower-body', 'Knee joint pain, injury, or instability'),
  ('lower-back', 'Lower Back',            'core',       'Lumbar spine pain, disc issues, or instability'),
  ('shoulder',   'Shoulder',              'upper-body', 'Shoulder impingement, rotator cuff, AC joint, or instability'),
  ('elbow',      'Elbow',                 'upper-body', 'Elbow tendinopathy, golfer''s/tennis elbow, or joint pain'),
  ('wrist',      'Wrist',                 'upper-body', 'Wrist pain, carpal tunnel, or limited range of motion'),
  ('hip',        'Hip',                   'lower-body', 'Hip flexor, labrum, or joint limitation'),
  ('neck',       'Neck / Cervical Spine', 'upper-body', 'Cervical pain, disc issue, or nerve impingement'),
  ('ankle',      'Ankle',                 'lower-body', 'Ankle sprain, instability, or limited dorsiflexion');

-- 20260902_007 Create profile_constraints table
CREATE TABLE public.profile_constraints (
  id                 UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  profile_id         UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  constraint_type_id TEXT NOT NULL REFERENCES public.constraint_types(id),
  severity           TEXT NOT NULL CHECK (severity IN ('mild','moderate','severe')),
  notes              TEXT,
  active             BOOLEAN NOT NULL DEFAULT true,
  onset_date         DATE,
  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (profile_id, constraint_type_id)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.profile_constraints TO authenticated;
GRANT ALL ON public.profile_constraints TO service_role;
ALTER TABLE public.profile_constraints ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own profile constraints" ON public.profile_constraints
  FOR ALL TO authenticated USING (auth.uid() = profile_id) WITH CHECK (auth.uid() = profile_id);

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = now(); 
   RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER trg_profile_constraints_updated
  BEFORE UPDATE ON public.profile_constraints
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- 20260902_008 Create profile_equipment table
CREATE TABLE public.profile_equipment (
  profile_id   UUID NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  equipment_id TEXT NOT NULL REFERENCES public.equipment_items(id) ON DELETE CASCADE,
  PRIMARY KEY (profile_id, equipment_id)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.profile_equipment TO authenticated;
GRANT ALL ON public.profile_equipment TO service_role;
ALTER TABLE public.profile_equipment ENABLE ROW LEVEL SECURITY;
CREATE POLICY "own profile equipment" ON public.profile_equipment
  FOR ALL TO authenticated USING (auth.uid() = profile_id) WITH CHECK (auth.uid() = profile_id);
