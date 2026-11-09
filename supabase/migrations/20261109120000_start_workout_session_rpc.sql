-- Starts (or resumes) the caller's session for a workout day in ONE round trip:
-- finds a recent in-progress session for the day (abandoning one older than 18h),
-- creates the session if needed, makes sure every planned exercise (with the user's
-- permanent swaps applied) has an exercise_sessions row, and returns the session with
-- its exercise sessions and any sets already logged.
--
-- Replaces three sequential client requests (each with its own CORS preflight), which
-- took ~4s on a real connection before the first set could be saved.
-- SECURITY INVOKER: every read/write goes through the caller's row-level security.
CREATE OR REPLACE FUNCTION public.start_workout_session(
  p_day_id uuid,
  p_session_date date,
  p_title text
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path = public
AS $$
DECLARE
  v_user uuid := auth.uid();
  v_existing record;
  v_session_id uuid;
BEGIN
  IF v_user IS NULL THEN
    RAISE EXCEPTION 'Not signed in';
  END IF;

  SELECT id, started_at, session_date
    INTO v_existing
    FROM workout_sessions
   WHERE user_id = v_user AND day_id = p_day_id AND status = 'in_progress'
   ORDER BY started_at DESC
   LIMIT 1;

  IF FOUND THEN
    IF v_existing.started_at > now() - interval '18 hours' THEN
      v_session_id := v_existing.id;
      IF v_existing.session_date <> p_session_date THEN
        -- A session spanning midnight: re-date it so it counts toward the current week.
        UPDATE workout_sessions
           SET session_date = p_session_date, started_at = now()
         WHERE id = v_session_id;
      END IF;
    ELSE
      UPDATE workout_sessions SET status = 'abandoned' WHERE id = v_existing.id;
    END IF;
  END IF;

  IF v_session_id IS NULL THEN
    INSERT INTO workout_sessions (user_id, day_id, title, status, session_date)
    VALUES (v_user, p_day_id, p_title, 'in_progress', p_session_date)
    RETURNING id INTO v_session_id;
  END IF;

  INSERT INTO exercise_sessions
    (user_id, session_id, exercise_id, workout_exercise_id, position, target_sets, target_rep_range)
  SELECT v_user, v_session_id, COALESCE(r.replacement_exercise_id, we.exercise_id), we.id,
         we.position, we.sets, we.rep_range
    FROM workout_exercises we
    LEFT JOIN user_exercise_replacements r
      ON r.workout_exercise_id = we.id AND r.user_id = v_user
   WHERE we.day_id = p_day_id
     AND NOT EXISTS (
       SELECT 1 FROM exercise_sessions es
        WHERE es.session_id = v_session_id AND es.workout_exercise_id = we.id
     );

  RETURN (
    SELECT jsonb_build_object(
      'id', s.id,
      'status', s.status,
      'started_at', s.started_at,
      'session_date', s.session_date,
      'duration_seconds', s.duration_seconds,
      'day_id', s.day_id,
      'exercise_sessions', COALESCE((
        SELECT jsonb_agg(jsonb_build_object(
          'id', es.id,
          'workout_exercise_id', es.workout_exercise_id,
          'exercise_id', es.exercise_id,
          'sets', COALESCE((
            SELECT jsonb_agg(jsonb_build_object(
              'id', st.id,
              'set_number', st.set_number,
              'weight_kg', st.weight_kg,
              'reps', st.reps,
              'performed_at', st.performed_at,
              'is_warmup', st.is_warmup
            ) ORDER BY st.set_number)
            FROM sets st WHERE st.exercise_session_id = es.id
          ), '[]'::jsonb)
        ) ORDER BY es.position)
        FROM exercise_sessions es WHERE es.session_id = s.id
      ), '[]'::jsonb)
    )
    FROM workout_sessions s
   WHERE s.id = v_session_id
  );
END;
$$;

REVOKE EXECUTE ON FUNCTION public.start_workout_session(uuid, date, text) FROM PUBLIC, anon;
GRANT EXECUTE ON FUNCTION public.start_workout_session(uuid, date, text) TO authenticated;
