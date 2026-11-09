import { useEffect, useRef, useState, type ReactNode } from "react";
import { Icon } from "@/components/sk/ui";

export type StatCard = {
  key: string;
  label: string;
  value: string;
  unit: string;
  sub: string;
  accent: string;
  glow: string;
  body?: ReactNode;
};

const THRESHOLD = 80;
const FLY_MS = 300;

/** The Home screen's swipeable deck of stat cards. Any swipe advances to the next card. */
export function StatDeck({ cards }: { cards: StatCard[] }) {
  const n = cards.length;
  const [idx, setIdx] = useState(0);
  const [snap, setSnap] = useState(0);
  const [fly, setFly] = useState<"left" | "right" | null>(null);
  const rootRef = useRef<HTMLDivElement>(null);
  const drag = useRef<{ id: number; x: number; y: number; dx: number } | null>(null);
  const timer = useRef<ReturnType<typeof setTimeout> | undefined>(undefined);

  useEffect(() => () => clearTimeout(timer.current), []);
  if (n === 0) return null;
  const i = ((idx % n) + n) % n;
  const top = cards[i]!;

  const lift = (v: number) => rootRef.current?.style.setProperty("--lift", v.toFixed(3));
  const jump = (delta: number) => {
    setIdx((x) => x + delta);
    setSnap((s) => s + 1);
    lift(0);
  };
  const flyNext = (dir: "left" | "right") => {
    setFly(dir);
    lift(0.5);
    clearTimeout(timer.current);
    timer.current = setTimeout(() => {
      setFly(null);
      jump(1);
    }, FLY_MS);
  };

  function onDown(e: React.PointerEvent<HTMLDivElement>) {
    if (fly || e.button > 0) return;
    try {
      e.currentTarget.setPointerCapture(e.pointerId);
    } catch {
      // ignore
    }
    drag.current = { id: e.pointerId, x: e.clientX, y: e.clientY, dx: 0 };
    e.currentTarget.style.transition = "none";
  }
  function onMove(e: React.PointerEvent<HTMLDivElement>) {
    const d = drag.current;
    if (!d || d.id !== e.pointerId) return;
    d.dx = e.clientX - d.x;
    const dy = e.clientY - d.y;
    e.currentTarget.style.transform = `translate(${d.dx}px, ${dy * 0.1}px) rotate(${d.dx / 30}deg)`;
    lift(Math.min(1, Math.abs(d.dx) / 160) * 0.5);
  }
  function onUp(e: React.PointerEvent<HTMLDivElement>) {
    const d = drag.current;
    if (!d || d.id !== e.pointerId) return;
    drag.current = null;
    const el = e.currentTarget;
    el.style.transition = "";
    if (Math.abs(d.dx) > THRESHOLD) {
      el.style.transform = "";
      flyNext(d.dx > 0 ? "right" : "left");
    } else {
      el.style.transform = "";
      lift(0);
    }
  }

  return (
    <section
      aria-label="Your numbers"
      className="sk-fade"
      style={{ animationDelay: ".05s", marginBottom: 28 }}
    >
      <div ref={rootRef} className="sk-deck">
        {[1, 2].map((k) => (
          <div key={k} aria-hidden="true" className="sk-surface sk-deck-plate" data-depth={k} />
        ))}
        <div
          key={`${i}-${snap}`}
          className={`sk-surface sk-deck-top${snap ? " sk-snap" : ""}`}
          data-fly={fly ?? undefined}
          aria-live="polite"
          onPointerDown={onDown}
          onPointerMove={onMove}
          onPointerUp={onUp}
          onPointerCancel={onUp}
        >
          <div
            aria-hidden="true"
            className="sk-deck-glow"
            style={{ background: `radial-gradient(circle, ${top.glow}, transparent 70%)` }}
          />
          <div
            style={{
              position: "relative",
              display: "flex",
              flexDirection: "column",
              height: "100%",
            }}
          >
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <span
                style={{
                  display: "flex",
                  alignItems: "center",
                  gap: 8,
                  fontSize: 13,
                  fontWeight: 500,
                  color: "rgba(255,255,255,0.78)",
                }}
              >
                <span style={{ width: 7, height: 7, borderRadius: 999, background: top.accent }} />
                {top.label}
              </span>
              <span className="sk-cap sk-num" style={{ letterSpacing: 0 }}>
                {i + 1} / {n}
              </span>
            </div>
            <div style={{ display: "flex", alignItems: "baseline", gap: 6, marginTop: 14 }}>
              <span className="sk-num" style={{ fontSize: 48, lineHeight: 1, fontWeight: 500 }}>
                {top.value}
              </span>
              <span style={{ fontSize: 16, color: "rgba(255,255,255,0.62)" }}>{top.unit}</span>
            </div>
            <p
              style={{
                margin: "8px 0 0",
                fontSize: 13.5,
                color: "rgba(255,255,255,0.62)",
                whiteSpace: "nowrap",
                overflow: "hidden",
                textOverflow: "ellipsis",
              }}
            >
              {top.sub}
            </p>
            <div style={{ marginTop: "auto" }}>{top.body}</div>
          </div>
        </div>
      </div>
      <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: 16 }}>
        <button
          type="button"
          className="sk-icon-btn"
          onClick={() => jump(-1)}
          aria-label="Previous card"
          style={{
            width: 30,
            height: 30,
            borderColor: "transparent",
            background: "transparent",
            color: "rgba(255,255,255,0.62)",
          }}
        >
          <Icon name="back" size={14} />
        </button>
        <div style={{ display: "flex", gap: 6 }}>
          {cards.map((c, k) => (
            <button
              key={c.key}
              type="button"
              onClick={() => jump((k - i + n) % n)}
              aria-label={`Show ${c.label}`}
              aria-current={k === i ? "true" : undefined}
              style={{
                width: k === i ? 18 : 5,
                height: 5,
                padding: 0,
                border: "none",
                borderRadius: 999,
                cursor: "pointer",
                background:
                  k === i ? "linear-gradient(90deg, #FFFFFF, #C6F432)" : "rgba(255,255,255,0.18)",
                transition: "width .35s cubic-bezier(.2,.8,.2,1), background .35s",
              }}
            />
          ))}
        </div>
        <button
          type="button"
          className="sk-icon-btn"
          onClick={() => flyNext("left")}
          aria-label="Next card"
          style={{
            width: 30,
            height: 30,
            borderColor: "transparent",
            background: "transparent",
            color: "rgba(255,255,255,0.62)",
          }}
        >
          <Icon name="next" size={14} />
        </button>
      </div>
    </section>
  );
}
