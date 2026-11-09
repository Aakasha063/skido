/**
 * Pure logic behind the swipe-card workout session: which cards exist and in what
 * order, what values each card's sliders start at, and the slider ranges.
 * Kept free of React and Supabase so it can be unit tested.
 */
import { suggestNextSet, type PrevSet } from "./progression";

/** The subset of a planned exercise row the deck needs. */
export type DeckExercise = {
  id: string;
  exercise_id: string;
  sets: number;
  rep_range: string;
  rep_min: number | null;
  rep_max: number | null;
  rir_target: string | null;
  rest_seconds: number | null;
  block: string | null;
  notes: string | null;
  exercises: {
    name: string;
    category: string | null;
    equipment: string | null;
    is_compound: boolean;
    gif_url: string | null;
  };
};

export type DeckCard<E extends DeckExercise = DeckExercise> = {
  key: string;
  we: E;
  setNumber: number;
  totalSets: number;
  /** 0-based position of this exercise within the day. */
  exerciseIndex: number;
  exerciseCount: number;
  isCardio: boolean;
  /** "A1" / "A2" when this card belongs to an interleaved superset. */
  supersetLabel: string | null;
};

export type LoggedValues = { weight: number | null; reps: number };

export const MAX_WEIGHT_KG = 300;
export const WEIGHT_STEP = 2.5;

export const cardKey = (workoutExerciseId: string, setNumber: number) =>
  `${workoutExerciseId}:${setNumber}`;

export function isCardio(we: DeckExercise) {
  return we.exercises?.category === "cardio";
}

export function isBodyweight(we: DeckExercise) {
  return (we.exercises?.equipment ?? "").toLowerCase() === "bodyweight";
}

function setsFor(we: DeckExercise) {
  return isCardio(we) ? 1 : Math.max(1, we.sets);
}

function isSupersetMember(we: DeckExercise) {
  return !!we.block && /superset/i.test(we.notes ?? "");
}

/**
 * One card per set, exercise by exercise. Consecutive exercises that share a block
 * and are described as a superset are interleaved (A1 set 1, A2 set 1, A1 set 2, ...)
 * so the deck follows the order the sets are actually performed in.
 */
export function buildDeck<E extends DeckExercise>(exercises: E[]): DeckCard<E>[] {
  const deck: DeckCard<E>[] = [];
  const exerciseCount = exercises.length;
  let supersetCount = 0;
  let i = 0;

  const push = (we: E, exerciseIndex: number, setNumber: number, supersetLabel: string | null) => {
    deck.push({
      key: cardKey(we.id, setNumber),
      we,
      setNumber,
      totalSets: setsFor(we),
      exerciseIndex,
      exerciseCount,
      isCardio: isCardio(we),
      supersetLabel,
    });
  };

  while (i < exerciseCount) {
    const first = exercises[i]!;
    const group = [i];
    if (isSupersetMember(first)) {
      let j = i + 1;
      while (
        j < exerciseCount &&
        exercises[j]!.block === first.block &&
        isSupersetMember(exercises[j]!)
      ) {
        group.push(j);
        j++;
      }
    }

    if (group.length > 1) {
      const letter = String.fromCharCode(65 + (supersetCount % 26));
      supersetCount++;
      const maxSets = Math.max(...group.map((idx) => setsFor(exercises[idx]!)));
      for (let s = 1; s <= maxSets; s++) {
        group.forEach((idx, g) => {
          const we = exercises[idx]!;
          if (s <= setsFor(we)) push(we, idx, s, `${letter}${g + 1}`);
        });
      }
    } else {
      for (let s = 1; s <= setsFor(first); s++) push(first, i, s, null);
    }
    i += group.length;
  }
  return deck;
}

/** "Week 1 reference load: 60 kg." / "Starting weight: ~150 kg" → 60 / 150. */
export function parseReferenceLoad(notes: string | null | undefined): number | null {
  if (!notes) return null;
  const m =
    notes.match(/reference load:\s*(\d+(?:\.\d+)?)/i) ??
    notes.match(/starting weight:\s*~?\s*(\d+(?:\.\d+)?)/i);
  return m ? Number(m[1]) : null;
}

/** "15 min" → 15, "10-15 min" → 10; otherwise "About 26 minutes" in the notes → 26. */
export function parseTargetMinutes(
  repRange: string,
  notes: string | null | undefined,
): number | null {
  const whole = repRange.trim().match(/^(\d+)(?:\s*-\s*\d+)?\s*min(?:s|utes)?\.?$/i);
  if (whole) return Number(whole[1]);
  const fromNotes = (notes ?? "").match(/(\d+)\s*minutes/i);
  return fromNotes ? Number(fromNotes[1]) : null;
}

/**
 * Starting slider values for a card, in priority order:
 *  1. the set you just did of this exercise in this session (keep the same load),
 *  2. the progression suggestion from your last session,
 *  3. the plan's reference load / rep range,
 *  4. zero load and the bottom of the rep range.
 */
export function cardDefaults(
  card: DeckCard,
  ctx: { log: Record<string, LoggedValues>; prevSets: PrevSet[] | undefined },
): LoggedValues {
  const { we } = card;
  if (card.isCardio) {
    return { weight: null, reps: parseTargetMinutes(we.rep_range, we.notes) ?? 15 };
  }

  for (let s = card.setNumber - 1; s >= 1; s--) {
    const prior = ctx.log[cardKey(we.id, s)];
    if (prior) return { weight: prior.weight ?? 0, reps: prior.reps };
  }

  const prevSets = ctx.prevSets ?? [];
  const hasHistory = prevSets.some((s) => (s.reps ?? 0) > 0);
  const suggestion = hasHistory
    ? suggestNextSet({
        prevSets,
        setNumber: card.setNumber,
        repMin: we.rep_min,
        repMax: we.rep_max,
        isCompound: we.exercises.is_compound,
      })
    : null;

  const weight = isBodyweight(we)
    ? (suggestion?.weight ?? 0)
    : (suggestion?.weight ?? parseReferenceLoad(we.notes) ?? 20);
  const reps = suggestion?.reps ?? we.rep_min ?? we.rep_max ?? 12;
  return { weight: Math.min(weight, MAX_WEIGHT_KG), reps };
}

/** Slider max for the weight, fixed when the card is created so the thumb doesn't jump. */
export function weightSliderMax(base: number) {
  const target = Math.max(base * 2, base + 40, 40);
  return Math.min(MAX_WEIGHT_KG, Math.ceil(target / 10) * 10);
}

export function repsSliderMax(card: DeckCard, base: number) {
  if (card.isCardio) return Math.min(180, Math.max(90, Math.ceil((base * 2) / 10) * 10));
  return Math.min(50, Math.max(20, (card.we.rep_max ?? 12) * 2, base + 5));
}

export type PrevPerformance = { performedAt: string; sets: PrevSet[] };

/**
 * From recent sets across many exercises (newest first), pick each exercise's most
 * recent session — ignoring sets that belong to the session being run right now.
 */
export function groupPreviousPerformance(
  rows: {
    exercise_id: string;
    exercise_session_id: string;
    set_number: number;
    weight_kg: number | null;
    reps: number | null;
    performed_at: string;
  }[],
  excludeExerciseSessionIds: Set<string>,
): Record<string, PrevPerformance> {
  const latestGroup = new Map<string, string>();
  const out: Record<string, PrevPerformance> = {};
  for (const r of rows) {
    if (excludeExerciseSessionIds.has(r.exercise_session_id)) continue;
    const group = latestGroup.get(r.exercise_id);
    if (group === undefined) {
      latestGroup.set(r.exercise_id, r.exercise_session_id);
      out[r.exercise_id] = { performedAt: r.performed_at, sets: [] };
    } else if (group !== r.exercise_session_id) {
      continue;
    }
    const entry = out[r.exercise_id]!;
    entry.sets.push({ set_number: r.set_number, weight_kg: r.weight_kg, reps: r.reps });
    if (r.performed_at < entry.performedAt) entry.performedAt = r.performed_at;
  }
  for (const entry of Object.values(out)) entry.sets.sort((a, b) => a.set_number - b.set_number);
  return out;
}
