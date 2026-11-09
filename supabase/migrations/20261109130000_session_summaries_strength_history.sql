-- Read-only summaries for the redesigned screens, so each screen needs one request
-- instead of downloading raw sets. SECURITY INVOKER: rows come through the caller's RLS.

CREATE INDEX IF NOT EXISTS idx_prs_session ON public.personal_records (session_id);

-- Sessions (newest first, abandoned ones excluded) with their working-set count,
-- training volume and number of personal records.
CREATE OR REPLACE FUNCTION public.get_session_summaries(p_limit integer DEFAULT 300)
RETURNS TABLE (
  id uuid,
  day_id uuid,
  title text,
  session_date date,
  status text,
  started_at timestamptz,
  finished_at timestamptz,
  duration_seconds integer,
  mood text,
  energy smallint,
  difficulty smallint,
  working_sets integer,
  volume numeric,
  pr_count integer
)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT s.id, s.day_id, s.title, s.session_date, s.status, s.started_at, s.finished_at,
         s.duration_seconds, s.mood, s.energy, s.difficulty,
         COALESCE(agg.working_sets, 0)::integer,
         COALESCE(agg.volume, 0),
         COALESCE(pr.n, 0)::integer
    FROM workout_sessions s
    LEFT JOIN LATERAL (
      SELECT count(*) AS working_sets,
             sum(COALESCE(st.weight_kg, 0) * COALESCE(st.reps, 0)) AS volume
        FROM exercise_sessions es
        JOIN sets st ON st.exercise_session_id = es.id
       WHERE es.session_id = s.id AND NOT st.is_warmup
    ) agg ON true
    LEFT JOIN LATERAL (
      SELECT count(*) AS n FROM personal_records p WHERE p.session_id = s.id
    ) pr ON true
   WHERE s.user_id = auth.uid() AND s.status <> 'abandoned'
   ORDER BY s.session_date DESC, s.started_at DESC
   LIMIT p_limit;
$$;

-- Best estimated 1RM (Epley) per exercise per session date, for the strength charts.
CREATE OR REPLACE FUNCTION public.get_strength_history()
RETURNS TABLE (
  exercise_id uuid,
  exercise_name text,
  session_date date,
  best_e1rm numeric,
  best_weight numeric,
  best_reps integer
)
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT DISTINCT ON (st.exercise_id, ws.session_date)
         st.exercise_id, e.name, ws.session_date,
         round((st.weight_kg * (1 + st.reps / 30.0))::numeric, 1),
         st.weight_kg, st.reps
    FROM sets st
    JOIN exercise_sessions es ON es.id = st.exercise_session_id
    JOIN workout_sessions ws ON ws.id = es.session_id
    JOIN exercises e ON e.id = st.exercise_id
   WHERE st.user_id = auth.uid()
     AND ws.status <> 'abandoned'
     AND NOT st.is_warmup
     AND COALESCE(st.weight_kg, 0) > 0
     AND COALESCE(st.reps, 0) > 0
   ORDER BY st.exercise_id, ws.session_date, (st.weight_kg * (1 + st.reps / 30.0)) DESC;
$$;

REVOKE EXECUTE ON FUNCTION public.get_session_summaries(integer) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_session_summaries(integer) TO authenticated;
REVOKE EXECUTE ON FUNCTION public.get_strength_history() FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.get_strength_history() TO authenticated;
