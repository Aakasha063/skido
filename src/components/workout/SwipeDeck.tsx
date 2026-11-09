import {
  forwardRef,
  useCallback,
  useEffect,
  useImperativeHandle,
  useLayoutEffect,
  useRef,
  useState,
  type CSSProperties,
  type ReactNode,
  type Ref,
} from "react";

export type SwipeDirection = "left" | "right";
export type SwipeDeckHandle = { swipe: (dir: SwipeDirection) => void };

type Props<T> = {
  /** Cards still to play; items[0] is the top card. Only the top card's content renders. */
  items: T[];
  getKey: (item: T) => string;
  renderCard: (item: T) => ReactNode;
  /** Called the moment a card is released past the threshold — the next card is live immediately. */
  onSwipe: (item: T, dir: SwipeDirection) => void;
  disabled?: boolean;
  /** Rendered above the cards inside the stage (toast, PR sheen, rest overlay). */
  overlay?: ReactNode;
};

type Exiting<T> = { key: string; item: T; dir: SwipeDirection; x: number; y: number; rot: number };

const FLY_MS = 300;
const THRESHOLD = 110;
const IGNORE_DRAG_FROM = "input, button, a, select, textarea, label, [data-no-swipe]";
const clamp = (v: number, a: number, b: number) => Math.max(a, Math.min(b, v));

function SwipeDeckInner<T>(
  { items, getKey, renderCard, onSwipe, disabled, overlay }: Props<T>,
  ref: Ref<SwipeDeckHandle>,
) {
  const rootRef = useRef<HTMLDivElement>(null);
  const topRef = useRef<HTMLDivElement>(null);
  const drag = useRef<{
    id: number;
    x: number;
    y: number;
    dx: number;
    dy: number;
    lastX: number;
    lastT: number;
    vx: number;
  } | null>(null);
  const timers = useRef<ReturnType<typeof setTimeout>[]>([]);
  const [exiting, setExiting] = useState<Exiting<T>[]>([]);

  const top = items[0];
  const topKey = top === undefined ? null : getKey(top);

  useEffect(() => () => timers.current.forEach(clearTimeout), []);

  /** Drive the stamps, card edge, back-plate lift and stage glow from CSS variables — no re-render per pointer move. */
  const paint = (dx: number) => {
    const root = rootRef.current;
    if (!root) return;
    root.style.setProperty("--log", clamp((dx - 20) / 90, 0, 1).toFixed(3));
    root.style.setProperty("--skip", clamp((-dx - 20) / 90, 0, 1).toFixed(3));
    root.style.setProperty("--lift", (clamp(Math.abs(dx) / 200, 0, 1) * 0.5).toFixed(3));
  };

  // A newly surfaced top card must not inherit a transform from an earlier drag.
  useLayoutEffect(() => {
    const el = topRef.current;
    if (el) {
      el.style.transform = "";
      el.style.transition = "";
    }
    paint(0);
  }, [topKey]);

  const commit = useCallback(
    (dir: SwipeDirection, from: { x: number; y: number; rot: number }) => {
      if (top === undefined || topKey === null) return;
      setExiting((prev) => [
        ...prev.filter((e) => e.key !== topKey),
        { key: topKey, item: top, dir, ...from },
      ]);
      onSwipe(top, dir);
      timers.current.push(
        setTimeout(() => setExiting((prev) => prev.filter((e) => e.key !== topKey)), FLY_MS),
      );
    },
    [top, topKey, onSwipe],
  );

  useImperativeHandle(
    ref,
    () => ({
      swipe: (dir) => {
        if (disabled || top === undefined) return;
        commit(dir, { x: 0, y: 0, rot: 0 });
      },
    }),
    [commit, disabled, top],
  );

  function onPointerDown(e: React.PointerEvent<HTMLDivElement>) {
    if (disabled || e.button > 0) return;
    if ((e.target as HTMLElement).closest(IGNORE_DRAG_FROM)) return;
    try {
      e.currentTarget.setPointerCapture(e.pointerId);
    } catch {
      // pointer may already be released
    }
    drag.current = {
      id: e.pointerId,
      x: e.clientX,
      y: e.clientY,
      dx: 0,
      dy: 0,
      lastX: e.clientX,
      lastT: e.timeStamp,
      vx: 0,
    };
    rootRef.current?.classList.add("is-dragging");
    e.currentTarget.style.transition = "none";
  }

  function onPointerMove(e: React.PointerEvent<HTMLDivElement>) {
    const d = drag.current;
    if (!d || d.id !== e.pointerId) return;
    d.dx = e.clientX - d.x;
    d.dy = e.clientY - d.y;
    const dt = e.timeStamp - d.lastT;
    if (dt > 0) d.vx = 0.7 * ((e.clientX - d.lastX) / dt) + 0.3 * d.vx;
    d.lastX = e.clientX;
    d.lastT = e.timeStamp;
    e.currentTarget.style.transform = `translate(${d.dx}px, ${d.dy * 0.12}px) rotate(${d.dx / 32}deg)`;
    paint(d.dx);
  }

  function endDrag(e: React.PointerEvent<HTMLDivElement>, cancelled: boolean) {
    const d = drag.current;
    if (!d || d.id !== e.pointerId) return;
    drag.current = null;
    rootRef.current?.classList.remove("is-dragging");
    const el = e.currentTarget;
    el.style.transition = "";
    const flung =
      Math.abs(d.vx) > 0.6 && Math.abs(d.dx) > 40 && Math.sign(d.vx) === Math.sign(d.dx);
    if (!cancelled && (Math.abs(d.dx) > THRESHOLD || flung)) {
      commit(d.dx > 0 ? "right" : "left", { x: d.dx, y: d.dy * 0.12, rot: d.dx / 32 });
      return;
    }
    el.style.transform = "";
    paint(0);
  }

  const plates = Math.min(2, Math.max(0, items.length - 1));
  const exitingShown = exiting.filter((x) => x.key !== topKey);
  const cards: { key: string; item: T; exit?: Exiting<T> }[] = [
    ...(top !== undefined && topKey !== null ? [{ key: topKey, item: top }] : []),
    ...exitingShown.map((x) => ({ key: x.key, item: x.item, exit: x })),
  ];

  return (
    <div ref={rootRef} className="wk-stage">
      <div className="wk-glow is-log" aria-hidden="true" />
      <div className="wk-glow is-skip" aria-hidden="true" />
      {Array.from({ length: plates }, (_, i) => (
        <div
          key={`plate-${i + 1}`}
          aria-hidden="true"
          className="wk-plate sk-surface"
          data-depth={i + 1}
        />
      ))}
      {/* One keyed list, so a card keeps its state (slider values) while it flies out. */}
      {cards.map(({ key, item, exit }) => {
        const isTop = !exit;
        const style = exit
          ? ({
              "--fx": `${exit.x}px`,
              "--fy": `${exit.y}px`,
              "--fr": `${exit.rot}deg`,
              "--tx": exit.dir === "right" ? "130%" : "-130%",
              "--tr": exit.dir === "right" ? "12deg" : "-12deg",
            } as CSSProperties)
          : undefined;
        return (
          <div
            key={key}
            ref={isTop ? topRef : undefined}
            className={`wk-card${exit ? " is-exiting" : ""}`}
            data-dir={exit?.dir}
            style={style}
            aria-hidden={!isTop || undefined}
            onPointerDown={isTop ? onPointerDown : undefined}
            onPointerMove={isTop ? onPointerMove : undefined}
            onPointerUp={isTop ? (e) => endDrag(e, false) : undefined}
            onPointerCancel={isTop ? (e) => endDrag(e, true) : undefined}
          >
            {renderCard(item)}
          </div>
        );
      })}
      {overlay}
    </div>
  );
}

export const SwipeDeck = forwardRef(SwipeDeckInner) as <T>(
  props: Props<T> & { ref?: Ref<SwipeDeckHandle> },
) => ReturnType<typeof SwipeDeckInner>;
