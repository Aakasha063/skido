-- Phase 1a: Taxonomy tables
-- All additive — zero impact on existing tables or user data.

-- ── muscle_groups ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.muscle_groups (
  id          TEXT PRIMARY KEY,  -- human-readable slug e.g. 'lats', 'chest-upper'
  name        TEXT NOT NULL,
  body_region TEXT NOT NULL CHECK (body_region IN ('upper-body','lower-body','core','cardio')),
  parent_id   TEXT REFERENCES public.muscle_groups(id),
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.muscle_groups TO authenticated, anon;
GRANT ALL ON public.muscle_groups TO service_role;
ALTER TABLE public.muscle_groups ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "muscle_groups readable" ON public.muscle_groups FOR SELECT TO authenticated, anon USING (true);

-- ── movement_patterns ──────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.movement_patterns (
  id          TEXT PRIMARY KEY,
  name        TEXT NOT NULL,
  description TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.movement_patterns TO authenticated, anon;
GRANT ALL ON public.movement_patterns TO service_role;
ALTER TABLE public.movement_patterns ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "movement_patterns readable" ON public.movement_patterns FOR SELECT TO authenticated, anon USING (true);

-- ── equipment_items ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.equipment_items (
  id       TEXT PRIMARY KEY,
  name     TEXT NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('free-weights','machine','cable','cardio','bodyweight','accessory')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.equipment_items TO authenticated, anon;
GRANT ALL ON public.equipment_items TO service_role;
ALTER TABLE public.equipment_items ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "equipment_items readable" ON public.equipment_items FOR SELECT TO authenticated, anon USING (true);

-- ── exercise_muscles (junction) ────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.exercise_muscles (
  exercise_id     UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  muscle_group_id TEXT NOT NULL REFERENCES public.muscle_groups(id),
  role            TEXT NOT NULL CHECK (role IN ('primary','secondary','tertiary')),
  PRIMARY KEY (exercise_id, muscle_group_id)
);
GRANT SELECT ON public.exercise_muscles TO authenticated, anon;
GRANT ALL ON public.exercise_muscles TO service_role;
ALTER TABLE public.exercise_muscles ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "exercise_muscles readable" ON public.exercise_muscles FOR SELECT TO authenticated, anon USING (true);
-- CREATE INDEX idx_exercise_muscles_muscle ON public.exercise_muscles(muscle_group_id);
-- CREATE INDEX idx_exercise_muscles_exercise ON public.exercise_muscles(exercise_id);

-- ── exercise_movements (junction) ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.exercise_movements (
  exercise_id         UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  movement_pattern_id TEXT NOT NULL REFERENCES public.movement_patterns(id),
  is_primary          BOOLEAN NOT NULL DEFAULT true,
  PRIMARY KEY (exercise_id, movement_pattern_id)
);
GRANT SELECT ON public.exercise_movements TO authenticated, anon;
GRANT ALL ON public.exercise_movements TO service_role;
ALTER TABLE public.exercise_movements ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "exercise_movements readable" ON public.exercise_movements FOR SELECT TO authenticated, anon USING (true);
-- CREATE INDEX idx_exercise_movements_pattern ON public.exercise_movements(movement_pattern_id);
-- CREATE INDEX idx_exercise_movements_exercise ON public.exercise_movements(exercise_id);

-- ── exercise_equipment (junction) ──────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.exercise_equipment (
  exercise_id  UUID NOT NULL REFERENCES public.exercises(id) ON DELETE CASCADE,
  equipment_id TEXT NOT NULL REFERENCES public.equipment_items(id),
  is_required  BOOLEAN NOT NULL DEFAULT true,  -- false = optional / either-or alternative
  PRIMARY KEY (exercise_id, equipment_id)
);
GRANT SELECT ON public.exercise_equipment TO authenticated, anon;
GRANT ALL ON public.exercise_equipment TO service_role;
ALTER TABLE public.exercise_equipment ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "exercise_equipment readable" ON public.exercise_equipment FOR SELECT TO authenticated, anon USING (true);
-- CREATE INDEX idx_exercise_equipment_equip ON public.exercise_equipment(equipment_id);
-- CREATE INDEX idx_exercise_equipment_exercise ON public.exercise_equipment(exercise_id);

-- ── add updated_at to exercises (was missing) ──────────────────────────────────
ALTER TABLE public.exercises ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT now();
ALTER TABLE public.exercises ADD COLUMN IF NOT EXISTS status TEXT NOT NULL DEFAULT 'active'
  CHECK (status IN ('active','archived','deprecated'));
-- CREATE TRIGGER trg_exercises_updated
--   BEFORE UPDATE ON public.exercises
--   FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
