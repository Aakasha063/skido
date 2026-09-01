-- 4. Progression rules
-- 20260902_018 Create progression_rules table + seed
CREATE TABLE public.progression_rules (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT NOT NULL,
  rule_type   TEXT NOT NULL CHECK (rule_type IN
    ('double_progression','load_progression','rep_progression','set_progression',
     'rpe_progression','volume_progression','time_progression','distance_progression')),
  version     INTEGER NOT NULL DEFAULT 1,
  config      JSONB NOT NULL DEFAULT '{}',
  description TEXT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT ON public.progression_rules TO authenticated, anon;
GRANT ALL ON public.progression_rules TO service_role;
ALTER TABLE public.progression_rules ENABLE ROW LEVEL SECURITY;
CREATE POLICY "progression_rules readable" ON public.progression_rules FOR SELECT TO authenticated, anon USING (true);

INSERT INTO public.progression_rules (name, rule_type, version, config, description) VALUES
(
  'Double Progression — Standard',
  'double_progression', 1,
  '{"trigger": "all_sets_at_rep_max", "reset_to": "rep_min",
    "compound_increment_kg": 2.5, "isolation_increment_kg": 1.25,
    "deload_trigger": "3_consecutive_failures"}',
  'Work every set to the rep ceiling. When all sets reach rep_max, add load and restart near rep_min.'
),
(
  'Load Progression — Strength',
  'load_progression', 1,
  '{"load_increase_pct": 2.5, "rpe_ceiling": 9.5, "frequency": "weekly"}',
  'Add a fixed percentage to the bar each week. If RPE exceeds ceiling, hold load.'
),
(
  'Rep Progression — Bodyweight',
  'rep_progression', 1,
  '{"rep_increment": 1, "trigger": "all_sets_at_rep_max", "max_reps": 20}',
  'Add 1 rep per set when all sets hit rep_max. Progress to weighted variant beyond max_reps.'
),
(
  'Set Progression — Volume Block',
  'set_progression', 1,
  '{"set_increment": 1, "max_sets": 5, "frequency": "weekly", "deload_after_weeks": 4}',
  'Add one working set per week up to max_sets, then deload.'
),
(
  'Time Progression — Cardio',
  'time_progression', 1,
  '{"time_increment_minutes": 2, "max_minutes": 45, "frequency": "weekly"}',
  'Add 2 minutes per week up to max session duration.'
),
(
  'RPE Progression — Advanced',
  'rpe_progression', 1,
  '{"rpe_ceiling": 9.0, "load_increase_on_rpe_below": 8.0, "load_decrease_on_rpe_above": 9.5, "load_step_pct": 2.5}',
  'Autoregulate load based on actual RPE relative to targets.'
);
