import { useState, type CSSProperties } from "react";
import { ACCENT, Icon } from "@/components/sk/ui";
import type { WorkoutExercise } from "@/lib/api";
import { suggestNextSet } from "@/lib/progression";
import { fmtW } from "@/lib/skido";
import {
  MAX_WEIGHT_KG,
  isBodyweight,
  type DeckCard,
  type LoggedValues,
  type PrevPerformance,
} from "@/lib/workoutDeck";

type Props = {
  card: DeckCard<WorkoutExercise>;
  defaults: LoggedValues;
  /** Values the user already chose for this card (kept across undo). */
  initial: Partial<LoggedValues> | undefined;
  previous: PrevPerformance | undefined;
  /** Status of every set of this exercise, for the progress pips. */
  pips: ("logged" | "skipped" | "current" | "todo")[];
  flipped: boolean;
  onFlip: () => void;
  onReplace: () => void;
  onChange: (values: LoggedValues) => void;
};

const clamp = (v: number, a: number, b: number) => Math.max(a, Math.min(b, v));
const track = (p: number) =>
  `linear-gradient(90deg, rgba(255,255,255,0.92) ${p}%, rgba(255,255,255,0.1) ${p}%)`;

export function SetCard({
  card,
  defaults,
  initial,
  previous,
  pips,
  flipped,
  onFlip,
  onReplace,
  onChange,
}: Props) {
  const { we } = card;
  const ex = we.exercises;
  const bw = isBodyweight(we);
  const [wOverride, setWOverride] = useState<number | null>(initial?.weight ?? null);
  const [rOverride, setROverride] = useState<number | null>(initial?.reps ?? null);
  const w = wOverride ?? defaults.weight ?? 0;
  const r = rOverride ?? defaults.reps;

  const setW = (v: number) => {
    const next = clamp(Math.round(v * 10) / 10, 0, MAX_WEIGHT_KG);
    setWOverride(next);
    onChange({ weight: next, reps: r });
  };
  const setR = (v: number) => {
    const next = clamp(Math.round(v), 0, 600);
    setROverride(next);
    onChange({ weight: card.isCardio ? null : w, reps: next });
  };

  const prevSets = previous?.sets ?? [];
  const sug = suggestNextSet({
    prevSets,
    setNumber: card.setNumber,
    repMin: we.rep_min,
    repMax: we.rep_max,
    isCompound: ex.is_compound,
  });
  const sugLabel = card.isCardio ? "Steady pace" : sug.label;
  const sugReason = card.isCardio
    ? (we.notes ?? "Moderate intensity — you should be able to talk in short sentences.")
    : we.notes && sug.label === "First time"
      ? `${sug.reason} ${we.notes.replace(/\.$/, "")}.`
      : sug.reason;
  const target = card.isCardio
    ? we.rep_range
    : `${we.rep_range}${/^\d+(\s*-\s*\d+)?$/.test(we.rep_range.trim()) ? " reps" : ""}${we.rir_target ? ` · ${we.rir_target} RIR` : ""}`;

  return (
    <div className={`wk-flip${flipped ? " is-flipped" : ""}`}>
      {/* FRONT */}
      <section
        className="wk-face wk-front"
        aria-label={`${ex.name}${card.isCardio ? "" : `, set ${card.setNumber} of ${card.totalSets}`}`}
        inert={flipped || undefined}
      >
        <div aria-hidden="true" className="wk-tint is-log" />
        <div aria-hidden="true" className="wk-tint is-skip" />
        <div aria-hidden="true" className="wk-stamp is-log">
          <Icon name="check" size={13} stroke={3} /> Log set
        </div>
        <div aria-hidden="true" className="wk-stamp is-skip">
          Skip
        </div>

        <div className="wk-front-head">
          {ex.primary_muscle && <span className="sk-pill">{ex.primary_muscle}</span>}
          {ex.equipment && (
            <span
              className="sk-pill"
              style={{ background: "transparent", border: "1px solid rgba(255,255,255,0.08)" }}
            >
              {ex.equipment}
            </span>
          )}
          {card.supersetLabel && (
            <span className="sk-pill is-accent">Superset {card.supersetLabel}</span>
          )}
          <span style={{ flex: 1 }} />
          <button
            type="button"
            className="sk-icon-btn"
            onClick={onReplace}
            aria-label={`Swap ${ex.name} for another exercise`}
            style={{ width: 34, height: 34 }}
          >
            <Icon name="swap" size={14} />
          </button>
          <button
            type="button"
            className="sk-icon-btn"
            onClick={onFlip}
            aria-label="How to do this exercise"
            style={{ width: 34, height: 34 }}
          >
            <Icon name="info" size={15} />
          </button>
        </div>

        <h2 className="wk-name">{ex.name}</h2>
        <div
          style={{
            position: "relative",
            display: "flex",
            alignItems: "center",
            gap: 12,
            marginTop: 10,
            flexWrap: "wrap",
          }}
        >
          {!card.isCardio && (
            <>
              <div style={{ display: "flex", gap: 4 }} aria-hidden="true">
                {pips.map((p, i) => (
                  <span
                    key={i}
                    style={{
                      width: p === "current" ? 18 : 6,
                      height: 4,
                      borderRadius: 999,
                      transition: "all .35s cubic-bezier(.2,.8,.2,1)",
                      background:
                        p === "current"
                          ? "#FFFFFF"
                          : p === "logged"
                            ? "rgba(198,244,50,0.75)"
                            : p === "skipped"
                              ? "rgba(255,77,79,0.75)"
                              : "rgba(255,255,255,0.12)",
                    }}
                  />
                ))}
              </div>
              <span style={{ fontSize: 13, color: "rgba(255,255,255,0.78)" }}>
                Set {card.setNumber} of {card.totalSets}
              </span>
            </>
          )}
          <span style={{ fontSize: 13, color: "rgba(255,255,255,0.56)" }}>{target}</span>
        </div>

        <p
          style={{
            position: "relative",
            margin: "18px 0 0",
            fontSize: 13,
            lineHeight: 1.55,
            color: "rgba(255,255,255,0.62)",
            display: "-webkit-box",
            WebkitLineClamp: 3,
            WebkitBoxOrient: "vertical",
            overflow: "hidden",
          }}
        >
          <span style={{ color: "rgba(255,255,255,0.92)", fontWeight: 500 }}>{sugLabel}</span> —{" "}
          {sugReason}
        </p>

        {card.isCardio ? (
          <div style={{ position: "relative", marginTop: "auto" }}>
            <Stepper
              label="Duration"
              unit="min"
              value={r}
              display={String(r)}
              onMinus={() => setR(Math.max(0, r - 1))}
              onPlus={() => setR(r + 1)}
              minusLabel="One minute less"
              plusLabel="One minute more"
              big
            />
            <input
              className="sk-rng"
              type="range"
              min={0}
              max={Math.max(60, r)}
              step={1}
              value={r}
              onChange={(e) => setR(Number(e.target.value))}
              aria-label="Duration in minutes"
              style={{ background: track((r / Math.max(60, r)) * 100) }}
            />
            <p style={{ margin: "18px 0 0", fontSize: 12.5, color: "rgba(255,255,255,0.56)" }}>
              Log the minutes you actually did.
            </p>
          </div>
        ) : (
          <LiftControls
            card={card}
            w={w}
            r={r}
            bw={bw}
            defaults={defaults}
            sugWeight={sug.weight}
            prevSets={prevSets}
            setW={setW}
            setR={setR}
          />
        )}
      </section>

      {/* BACK */}
      <section className="wk-face wk-back" aria-label="How to do it" inert={!flipped || undefined}>
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
            marginBottom: 16,
          }}
        >
          <span className="sk-eyebrow">Technique</span>
          <button
            type="button"
            className="sk-icon-btn sk-text-pill"
            onClick={onFlip}
            style={{ fontSize: 13 }}
          >
            <Icon name="back" size={13} /> Back to set
          </button>
        </div>
        <h2
          style={{
            margin: "0 0 18px",
            fontSize: 22,
            lineHeight: 1.2,
            fontWeight: 600,
            letterSpacing: "-0.03em",
          }}
        >
          {ex.name}
        </h2>
        <div className="wk-back-scroll">
          {flipped && ex.gif_url && (
            <div
              style={{
                borderRadius: 16,
                background: "#fff",
                display: "flex",
                justifyContent: "center",
                overflow: "hidden",
              }}
            >
              <img
                src={ex.gif_url}
                alt={`${ex.name} demonstration`}
                loading="lazy"
                decoding="async"
                style={{ maxHeight: 160, maxWidth: "100%", objectFit: "contain" }}
              />
            </div>
          )}
          {(
            [
              ["Setup", ex.setup],
              ["Execution", ex.execution],
              ["Cues", ex.cues],
              ["Avoid", ex.common_mistakes],
              ["Back", ex.lower_back_notes ? [ex.lower_back_notes] : null],
            ] as const
          )
            .filter(([, items]) => items && items.length)
            .map(([title, items]) => (
              <div key={title}>
                <h3
                  className="sk-cap"
                  style={{ margin: "0 0 8px", color: "rgba(255,255,255,0.78)" }}
                >
                  {title}
                </h3>
                <ul
                  style={{
                    margin: 0,
                    paddingLeft: 16,
                    display: "flex",
                    flexDirection: "column",
                    gap: 5,
                  }}
                >
                  {items!.map((li, i) => (
                    <li
                      key={i}
                      style={{ fontSize: 13.5, lineHeight: 1.5, color: "rgba(255,255,255,0.72)" }}
                    >
                      {li}
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          {(ex.should_feel || ex.breathing) && (
            <div
              style={{
                padding: "14px 16px",
                borderRadius: 16,
                background: "rgba(255,255,255,0.03)",
                border: "1px solid rgba(255,255,255,0.06)",
              }}
            >
              {ex.should_feel && (
                <p
                  style={{
                    margin: 0,
                    fontSize: 13,
                    lineHeight: 1.55,
                    color: "rgba(255,255,255,0.72)",
                  }}
                >
                  <span style={{ color: "rgba(255,255,255,0.92)", fontWeight: 500 }}>Feel it</span>{" "}
                  — {ex.should_feel}
                </p>
              )}
              {ex.breathing && (
                <p
                  style={{
                    margin: ex.should_feel ? "8px 0 0" : 0,
                    fontSize: 13,
                    lineHeight: 1.55,
                    color: "rgba(255,255,255,0.72)",
                  }}
                >
                  <span style={{ color: "rgba(255,255,255,0.92)", fontWeight: 500 }}>Breathe</span>{" "}
                  — {ex.breathing}
                </p>
              )}
            </div>
          )}
        </div>
      </section>
    </div>
  );
}

function LiftControls(props: {
  card: DeckCard<WorkoutExercise>;
  w: number;
  r: number;
  bw: boolean;
  defaults: LoggedValues;
  sugWeight: number | null;
  prevSets: { set_number: number; weight_kg: number | null; reps: number | null }[];
  setW: (v: number) => void;
  setR: (v: number) => void;
}) {
  const { card, w, r, bw, defaults, sugWeight, prevSets, setW, setR } = props;
  const { we } = card;
  const step = bw ? 2.5 : w >= 40 ? 2.5 : 1;
  const prevMax = Math.max(0, ...prevSets.map((s) => s.weight_kg ?? 0));
  const base = Math.max(defaults.weight ?? 0, sugWeight ?? 0, prevMax);
  const wMax = bw
    ? Math.max(60, Math.ceil(w / 10) * 10)
    : Math.max(20, Math.ceil((base * 1.6) / 10) * 10, Math.ceil(w / 10) * 10);
  const rMax = Math.max(20, (we.rep_max ?? 15) + 10, r);
  const zMin = we.rep_min ?? 0;
  const zMax = we.rep_max ?? zMin;
  const inZone = we.rep_min != null && r >= zMin && r <= zMax;
  const zoneText =
    we.rep_min == null
      ? "Stop about one rep before failure"
      : inZone
        ? `In your target range · ${we.rep_range}`
        : r < zMin
          ? `Below target range · ${we.rep_range}`
          : "Above target range — consider adding weight";
  const showBW = bw && !w;

  return (
    <div
      style={{
        position: "relative",
        marginTop: "auto",
        display: "flex",
        flexDirection: "column",
        gap: 26,
      }}
    >
      <div>
        <Stepper
          label={bw ? "Added weight" : "Weight"}
          unit={showBW ? "" : "kg"}
          value={w}
          display={showBW ? "BW" : fmtW(w)}
          onMinus={() => setW(Math.max(0, w - step))}
          onPlus={() => setW(w + step)}
          minusLabel={`${fmtW(step)} kilograms less`}
          plusLabel={`${fmtW(step)} kilograms more`}
        />
        <input
          className="sk-rng"
          type="range"
          min={0}
          max={wMax}
          step={step}
          value={w}
          onChange={(e) => setW(Number(e.target.value))}
          aria-label={bw ? "Added weight" : "Weight"}
          aria-valuetext={showBW ? "Bodyweight" : `${fmtW(w)} kilograms`}
          style={{ background: track(clamp((w / wMax) * 100, 0, 100)) }}
        />
      </div>
      <div>
        <Stepper
          label="Reps"
          unit="reps"
          value={r}
          display={String(r)}
          onMinus={() => setR(Math.max(0, r - 1))}
          onPlus={() => setR(r + 1)}
          minusLabel="One rep less"
          plusLabel="One rep more"
        />
        <div style={{ position: "relative" }}>
          {we.rep_min != null && (
            <span
              aria-hidden="true"
              style={{
                position: "absolute",
                left: `${Math.round((zMin / rMax) * 1000) / 10}%`,
                width: `${Math.max(3, Math.round(((zMax - zMin) / rMax) * 1000) / 10)}%`,
                top: -6,
                height: 16,
                borderRadius: 999,
                background: "rgba(255,255,255,0.05)",
                border: "1px solid rgba(255,255,255,0.08)",
                pointerEvents: "none",
              }}
            />
          )}
          <input
            className="sk-rng"
            type="range"
            min={0}
            max={rMax}
            step={1}
            value={r}
            onChange={(e) => setR(Number(e.target.value))}
            aria-label="Reps"
            style={{ position: "relative", background: track(clamp((r / rMax) * 100, 0, 100)) }}
          />
        </div>
        <p
          style={{
            margin: "10px 0 0",
            fontSize: 11.5,
            color: inZone ? ACCENT : "rgba(255,255,255,0.56)",
            transition: "color .2s",
          }}
        >
          {zoneText}
        </p>
      </div>
      <div
        style={{
          display: "flex",
          alignItems: "center",
          gap: 6,
          flexWrap: "wrap",
          paddingTop: 16,
          borderTop: "1px solid rgba(255,255,255,0.06)",
        }}
      >
        <span className="sk-cap" style={{ marginRight: 4 }}>
          Last time
        </span>
        {prevSets.length ? (
          prevSets.map((s) => {
            const cur = s.set_number === card.setNumber;
            return (
              <span
                key={s.set_number}
                className="sk-num"
                style={{
                  fontSize: 12,
                  letterSpacing: 0,
                  padding: "3px 8px",
                  borderRadius: 8,
                  background: cur ? "rgba(255,255,255,0.09)" : "transparent",
                  color: cur ? "rgba(255,255,255,0.94)" : "rgba(255,255,255,0.56)",
                }}
              >
                {s.weight_kg ? fmtW(s.weight_kg) : "BW"} × {s.reps ?? "—"}
              </span>
            );
          })
        ) : (
          <span style={{ fontSize: 12, color: "rgba(255,255,255,0.56)" }}>
            First time — no history yet
          </span>
        )}
      </div>
    </div>
  );
}

function Stepper(props: {
  label: string;
  unit: string;
  value: number;
  display: string;
  onMinus: () => void;
  onPlus: () => void;
  minusLabel: string;
  plusLabel: string;
  big?: boolean;
}) {
  const numStyle: CSSProperties = { fontSize: props.big ? 44 : 40, lineHeight: 1, fontWeight: 400 };
  return (
    <div
      style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
        marginBottom: 16,
      }}
    >
      <span className="sk-cap">{props.label}</span>
      <div style={{ display: "flex", alignItems: "center", gap: props.big ? 14 : 12 }}>
        <button
          type="button"
          className="sk-step"
          onClick={props.onMinus}
          aria-label={props.minusLabel}
        >
          <Icon name="minus" size={14} />
        </button>
        <span style={{ minWidth: props.big ? 96 : 108, textAlign: "center", whiteSpace: "nowrap" }}>
          <span className="sk-num" style={numStyle}>
            {props.display}
          </span>
          {props.unit && (
            <span style={{ fontSize: 14, color: "rgba(255,255,255,0.56)", marginLeft: 4 }}>
              {props.unit}
            </span>
          )}
        </span>
        <button
          type="button"
          className="sk-step"
          onClick={props.onPlus}
          aria-label={props.plusLabel}
        >
          <Icon name="plus" size={14} />
        </button>
      </div>
    </div>
  );
}
