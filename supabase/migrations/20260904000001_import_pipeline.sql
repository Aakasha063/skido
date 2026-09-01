-- 6. Import pipeline
-- 20260904_001 Create exercise_imports staging table

CREATE TABLE public.exercise_imports (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  raw_data            JSONB NOT NULL,
  candidate_slug      TEXT,
  matched_exercise_id UUID REFERENCES public.exercises(id),
  dedup_confidence    TEXT CHECK (dedup_confidence IN ('definite','probable','possible','none')),
  dedup_reason        TEXT,
  status              TEXT NOT NULL CHECK (status IN ('pending','normalized','deduplicated','mapped','validated','accepted','rejected')),
  validation_errors   JSONB,
  imported_by         TEXT,
  reviewed_by         TEXT,
  reviewed_at         TIMESTAMPTZ,
  created_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.exercise_imports TO authenticated;
GRANT ALL ON public.exercise_imports TO service_role;
ALTER TABLE public.exercise_imports ENABLE ROW LEVEL SECURITY;
-- For now, restrict to admins or service role. If any authenticated user can import, change this policy.
CREATE POLICY "exercise_imports readable" ON public.exercise_imports FOR SELECT TO authenticated, anon USING (true);
CREATE POLICY "exercise_imports modifiable by admin" ON public.exercise_imports 
  FOR ALL TO authenticated USING (auth.jwt() ->> 'role' = 'service_role' OR auth.uid() IN (SELECT id FROM public.profiles WHERE false /* add admin check later */));

CREATE TRIGGER trg_ex_imp_updated BEFORE UPDATE ON public.exercise_imports FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
