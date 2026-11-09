import * as SliderPrimitive from "@radix-ui/react-slider";
import { Info, Repeat2 } from "lucide-react";
import { useState } from "react";
import type { WorkoutExercise } from "@/lib/api";
import {
  MAX_WEIGHT_KG,
  WEIGHT_STEP,
  isBodyweight,
  parseReferenceLoad,
  repsSliderMax,
  weightSliderMax,
  type DeckCard,
  type LoggedValues,
  type PrevPerformance,
} from "@/lib/workoutDeck";

type Props = {
  card: DeckCard<WorkoutExercise>;
  depth: number;
  defaults: LoggedValues;
  /** Values the user already chose for this card (kept across undo). */
  initial: Partial<LoggedValues> | undefined;
  previous: PrevPerformance | undefined;
  onChange: (values: LoggedValues) => void;
  onInfo: () => void;
  onReplace: () => void;
};

const fmtNum = (v: number) => (Number.isInteger(v) ? String(v) : v.toFixed(1));

export function SetCard({
  card,
  depth,
  defaults,
  initial,
  previous,
  onChange,
  onInfo,
  onReplace,
}: Props) {
  const { we } = card;
  const ex = we.exercises;
  const [weightOverride, setWeightOverride] = useState<number | null>(initial?.weight ?? null);
  const [repsOverride, setRepsOverride] = useState<number | null>(initial?.reps ?? null);
  const weight = weightOverride ?? defaults.weight ?? 0;
  const reps = repsOverride ?? defaults.reps;

  const setWeight = (w: number) => {
    setWeightOverride(w);
    onChange({ weight: w, reps });
  };
  const setReps = (r: number) => {
    setRepsOverride(r);
    onChange({ weight: card.isCardio ? null : weight, reps: r });
  };

  const repsLabel = /^\d+(\s*-\s*\d+)?$/.test(we.rep_range.trim())
    ? `${we.rep_range} reps`
    : we.rep_range;
  const target = card.isCardio
    ? we.rep_range
    : [repsLabel, we.rir_target && `RIR ${we.rir_target}`, we.rest_note && `rest ${we.rest_note}`]
        .filter(Boolean)
        .join(" · ");

  const last = previous?.sets.length
    ? card.isCardio
      ? `${previous.sets[0]!.reps ?? "—"} min`
      : previous.sets
          .map((s) => `${s.weight_kg == null ? "—" : fmtNum(s.weight_kg)}×${s.reps ?? "—"}`)
          .join("  ·  ")
    : null;
  const lastDate = previous
    ? new Date(previous.performedAt).toLocaleDateString(undefined, {
        month: "short",
        day: "numeric",
      })
    : null;

  const showGif = !!ex.gif_url && depth <= 1;

  return (
    <div className="wk-set-card" inert={depth > 0 || undefined}>
      <div className={`wk-hero${ex.gif_url ? "" : " is-empty"}`}>
        {showGif && <img src={ex.gif_url!} alt="" decoding="async" draggable={false} />}
      </div>

      <div className="wk-body">
        <div className="wk-meta-row">
          <span className="wk-chip">
            Exercise {card.exerciseIndex + 1}/{card.exerciseCount}
          </span>
          {!card.isCardio && (
            <span className="wk-chip is-accent">
              Set {card.setNumber} of {card.totalSets}
            </span>
          )}
          {card.supersetLabel && <span className="wk-chip">Superset {card.supersetLabel}</span>}
          <span className="wk-meta-actions">
            <button
              type="button"
              className="wk-icon-btn"
              onClick={onReplace}
              aria-label={`Swap ${ex.name}`}
            >
              <Repeat2 size={17} />
            </button>
            <button
              type="button"
              className="wk-icon-btn"
              onClick={onInfo}
              aria-label={`How to do ${ex.name}`}
            >
              <Info size={17} />
            </button>
          </span>
        </div>

        <div>
          <h2 className="wk-title">{ex.name}</h2>
          <p className="wk-target">{target}</p>
          <p className="wk-last">
            {last ? (
              <>
                <span>Last · {lastDate}</span> {last}
              </>
            ) : card.isCardio ? (
              "First time — go at a steady, sustainable pace"
            ) : parseReferenceLoad(we.notes) != null ? (
              "First time — starting from the plan's suggested load"
            ) : (
              "First time — pick a load you can control"
            )}
          </p>
        </div>

        {card.isCardio ? (
          <ValueControl
            label="Minutes"
            unit="min"
            value={reps}
            min={1}
            sliderMax={repsSliderMax(card, defaults.reps)}
            limit={600}
            step={1}
            onChange={setReps}
          />
        ) : (
          <>
            <ValueControl
              label={isBodyweight(we) ? "Added weight" : "Weight"}
              unit="kg"
              value={weight}
              min={0}
              sliderMax={weightSliderMax(defaults.weight ?? 0)}
              limit={MAX_WEIGHT_KG}
              step={WEIGHT_STEP}
              onChange={setWeight}
            />
            <ValueControl
              label="Reps"
              unit="reps"
              value={reps}
              min={1}
              sliderMax={repsSliderMax(card, defaults.reps)}
              limit={100}
              step={1}
              onChange={setReps}
            />
          </>
        )}

        {we.notes && <p className="wk-note">{we.notes}</p>}
      </div>
    </div>
  );
}

function ValueControl(props: {
  label: string;
  unit: string;
  value: number;
  min: number;
  sliderMax: number;
  limit: number;
  step: number;
  onChange: (v: number) => void;
}) {
  const { label, unit, value, min, sliderMax, limit, step, onChange } = props;
  const [editing, setEditing] = useState(false);
  const [draft, setDraft] = useState("");
  const clamp = (v: number) => Math.min(limit, Math.max(min, Number(v.toFixed(2))));
  const max = Math.max(sliderMax, value);

  function commitDraft() {
    setEditing(false);
    const n = Number(draft.replace(",", "."));
    if (draft.trim() !== "" && Number.isFinite(n)) onChange(clamp(n));
  }

  return (
    <div className="wk-value" data-no-swipe>
      <div className="wk-value-head">
        <span className="wk-value-label">{label}</span>
        {editing ? (
          <input
            className="wk-value-input"
            autoFocus
            inputMode={Number.isInteger(step) ? "numeric" : "decimal"}
            value={draft}
            onChange={(e) => setDraft(e.target.value)}
            onBlur={commitDraft}
            onKeyDown={(e) => {
              if (e.key === "Enter") e.currentTarget.blur();
              if (e.key === "Escape") setEditing(false);
            }}
            aria-label={label}
          />
        ) : (
          <button
            type="button"
            className="wk-value-num"
            onClick={() => {
              setDraft(fmtNum(value));
              setEditing(true);
            }}
            aria-label={`${label} ${fmtNum(value)} ${unit}, tap to type a value`}
          >
            {fmtNum(value)}
            <small>{unit}</small>
          </button>
        )}
      </div>
      <div className="wk-value-row">
        <button
          type="button"
          className="wk-step"
          onClick={() => onChange(clamp(value - step))}
          aria-label={`Decrease ${label.toLowerCase()}`}
        >
          −
        </button>
        <SliderPrimitive.Root
          className="wk-slider"
          min={min}
          max={max}
          step={step}
          value={[Math.min(value, max)]}
          onValueChange={([v]) => v !== undefined && onChange(clamp(v))}
        >
          <SliderPrimitive.Track className="wk-slider-track">
            <SliderPrimitive.Range className="wk-slider-range" />
          </SliderPrimitive.Track>
          <SliderPrimitive.Thumb className="wk-slider-thumb" aria-label={label} />
        </SliderPrimitive.Root>
        <button
          type="button"
          className="wk-step"
          onClick={() => onChange(clamp(value + step))}
          aria-label={`Increase ${label.toLowerCase()}`}
        >
          +
        </button>
      </div>
    </div>
  );
}
