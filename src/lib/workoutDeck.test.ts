import { describe, expect, it } from "vitest";
import {
  buildDeck,
  cardDefaults,
  cardKey,
  groupPreviousPerformance,
  parseReferenceLoad,
  parseTargetMinutes,
  weightSliderMax,
  type DeckExercise,
} from "./workoutDeck";

function ex(
  id: string,
  over: Partial<DeckExercise> = {},
  exOver: Partial<DeckExercise["exercises"]> = {},
): DeckExercise {
  return {
    id,
    exercise_id: `ex-${id}`,
    sets: 3,
    rep_range: "8-10",
    rep_min: 8,
    rep_max: 10,
    rir_target: "1-2",
    rest_seconds: 120,
    block: null,
    notes: null,
    ...over,
    exercises: {
      name: `Exercise ${id}`,
      category: "push",
      equipment: "Machine",
      is_compound: true,
      gif_url: null,
      ...exOver,
    },
  };
}

describe("buildDeck", () => {
  it("creates one card per set, exercise by exercise", () => {
    const deck = buildDeck([ex("a", { sets: 2 }), ex("b", { sets: 1 })]);
    expect(deck.map((c) => c.key)).toEqual(["a:1", "a:2", "b:1"]);
    expect(deck[1]).toMatchObject({
      setNumber: 2,
      totalSets: 2,
      exerciseIndex: 0,
      exerciseCount: 2,
    });
  });

  it("gives cardio a single card regardless of planned sets", () => {
    const deck = buildDeck([ex("walk", { sets: 3 }, { category: "cardio" })]);
    expect(deck.map((c) => c.key)).toEqual(["walk:1"]);
    expect(deck[0]!.isCardio).toBe(true);
  });

  it("interleaves a superset block", () => {
    const deck = buildDeck([
      ex("calf", { sets: 3 }),
      ex("curl", { sets: 2, block: "finisher", notes: "Arm finisher superset A1." }),
      ex("push", { sets: 2, block: "finisher", notes: "Arm finisher superset A2." }),
      ex("bike", { sets: 1 }, { category: "cardio" }),
    ]);
    expect(deck.map((c) => c.key)).toEqual([
      "calf:1",
      "calf:2",
      "calf:3",
      "curl:1",
      "push:1",
      "curl:2",
      "push:2",
      "bike:1",
    ]);
    expect(deck.filter((c) => c.supersetLabel).map((c) => c.supersetLabel)).toEqual([
      "A1",
      "A2",
      "A1",
      "A2",
    ]);
  });

  it("does not interleave exercises that merely share a block", () => {
    const deck = buildDeck([
      ex("shrug", { sets: 2, block: "accessory", notes: "Hold the top." }),
      ex("raise", { sets: 2, block: "accessory" }),
    ]);
    expect(deck.map((c) => c.key)).toEqual(["shrug:1", "shrug:2", "raise:1", "raise:2"]);
  });
});

describe("parsers", () => {
  it("reads reference loads from plan notes", () => {
    expect(parseReferenceLoad("Week 1 reference load: 60 kg.")).toBe(60);
    expect(parseReferenceLoad("Week 1 reference load: 32.5 kg per hand - verify")).toBe(32.5);
    expect(parseReferenceLoad("Week 1 reference load: 30-35 kg.")).toBe(30);
    expect(parseReferenceLoad("Starting weight: ~150 kg")).toBe(150);
    expect(parseReferenceLoad("Choose a controlled load.")).toBeNull();
  });

  it("reads cardio minutes", () => {
    expect(parseTargetMinutes("15 min", null)).toBe(15);
    expect(parseTargetMinutes("10-15 min", null)).toBe(10);
    expect(
      parseTargetMinutes(
        "5 min warm-up + 8 x (20s hard / 100s easy) + 5 min cooldown",
        "About 26 minutes in total",
      ),
    ).toBe(26);
    expect(parseTargetMinutes("Any duration", null)).toBeNull();
  });
});

describe("cardDefaults", () => {
  const [c1, c2] = buildDeck([ex("a", { notes: "Week 1 reference load: 60 kg." })]);

  it("falls back to the plan's reference load and the bottom of the rep range", () => {
    expect(cardDefaults(c1!, { log: {}, prevSets: [] })).toEqual({ weight: 60, reps: 8 });
  });

  it("prefers last session's progression suggestion over the reference load", () => {
    const prevSets = [{ set_number: 1, weight_kg: 50, reps: 9 }];
    expect(cardDefaults(c1!, { log: {}, prevSets })).toEqual({ weight: 50, reps: 10 });
  });

  it("carries the previous set of this session forward", () => {
    const log = { [cardKey("a", 1)]: { weight: 62.5, reps: 7 } };
    expect(
      cardDefaults(c2!, { log, prevSets: [{ set_number: 2, weight_kg: 50, reps: 9 }] }),
    ).toEqual({ weight: 62.5, reps: 7 });
  });

  it("defaults bodyweight work to zero added load", () => {
    const [card] = buildDeck([ex("bug", { notes: "Bodyweight." }, { equipment: "Bodyweight" })]);
    expect(cardDefaults(card!, { log: {}, prevSets: [] }).weight).toBe(0);
  });

  it("uses minutes for cardio", () => {
    const [card] = buildDeck([ex("walk", { rep_range: "15 min" }, { category: "cardio" })]);
    expect(cardDefaults(card!, { log: {}, prevSets: [] })).toEqual({ weight: null, reps: 15 });
  });
});

describe("weightSliderMax", () => {
  it("leaves headroom above the starting load and caps at 300", () => {
    expect(weightSliderMax(0)).toBe(40);
    expect(weightSliderMax(20)).toBe(60);
    expect(weightSliderMax(130)).toBe(260);
    expect(weightSliderMax(250)).toBe(300);
  });
});

describe("groupPreviousPerformance", () => {
  const row = (
    exercise_id: string,
    exercise_session_id: string,
    set_number: number,
    performed_at: string,
  ) => ({
    exercise_id,
    exercise_session_id,
    set_number,
    weight_kg: 50,
    reps: 8,
    performed_at,
  });

  it("keeps only each exercise's latest session, excluding the live one", () => {
    const rows = [
      row("bench", "live", 1, "2026-11-09T10:00:00Z"),
      row("bench", "s2", 2, "2026-11-05T10:05:00Z"),
      row("bench", "s2", 1, "2026-11-05T10:00:00Z"),
      row("bench", "s1", 1, "2026-11-01T10:00:00Z"),
      row("row", "s3", 1, "2026-11-04T10:00:00Z"),
    ];
    const out = groupPreviousPerformance(rows, new Set(["live"]));
    expect(out["bench"]!.sets.map((s) => s.set_number)).toEqual([1, 2]);
    expect(out["bench"]!.performedAt).toBe("2026-11-05T10:00:00Z");
    expect(out["row"]!.sets).toHaveLength(1);
  });
});
