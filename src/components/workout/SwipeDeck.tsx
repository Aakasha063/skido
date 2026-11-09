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
  /**
   * Called when an overlay marked `data-swipe-surface` (the rest timer) is swiped away.
   * Swiping that overlay only dismisses it: the card under it is hidden, so it is never
   * logged or skipped by the same gesture.
   */
  onSurfaceDismiss?: () => void;
  disabled?: boolean;
  /** Rendered above the cards inside the stage (toast, PR sheen, rest overlay). */
  overlay?: ReactNode;
};

type Exiting<T> = { key: string; item: T; dir: SwipeDirection; x: number; y: number; rot: number };
type Gesture = {
  id: number;
  x: number;
  y: number;
  dx: number;
  dy: number;
  lastX: number;
  lastT: number;
  vx: number;
  /** Becomes true once the movement is clearly horizontal; until then taps behave normally. */
  active: boolean;
  /** Set when the press began on an overlay (rest timer): the gesture moves that, not the card. */
  surface: HTMLElement | null;
};

const FLY_MS = 300;
const THRESHOLD = 110;
/** Horizontal travel before a press turns into a swipe — small enough to feel instant, big enough that taps stay taps. */
const SLOP = 8;
/** Gestures that must never become a card swipe (slider thumbs, text fields, the technique side's scroller). */
const NEVER_SWIPE = "input, select, textarea, [data-no-swipe]";
const clamp = (v: number, a: number, b: number) => Math.max(a, Math.min(b, v));

function SwipeDeckInner<T>(
  { items, getKey, renderCard, onSwipe, onSurfaceDismiss, disabled, overlay }: Props<T>,
  ref: Ref<SwipeDeckHandle>,
) {
  const rootRef = useRef<HTMLDivElement>(null);
  const topRef = useRef<HTMLDivElement>(null);
  const gesture = useRef<Gesture | null>(null);
  const suppressClickUntil = useRef(0);
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
      el.classList.remove("is-dragging");
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
    if (disabled || top === undefined || e.button > 0 || gesture.current) return;
    const target = e.target as HTMLElement;
    // Only presses on the top card or an overlay above it (rest timer) can swipe.
    const surface = target.closest<HTMLElement>("[data-swipe-surface]");
    if (!surface && !target.closest(".wk-card:not(.is-exiting)")) return;
    if (target.closest(NEVER_SWIPE)) return;
    gesture.current = {
      surface,
      id: e.pointerId,
      x: e.clientX,
      y: e.clientY,
      dx: 0,
      dy: 0,
      lastX: e.clientX,
      lastT: e.timeStamp,
      vx: 0,
      active: false,
    };
  }

  function onPointerMove(e: React.PointerEvent<HTMLDivElement>) {
    const g = gesture.current;
    if (!g || g.id !== e.pointerId) return;
    g.dx = e.clientX - g.x;
    g.dy = e.clientY - g.y;
    const dt = e.timeStamp - g.lastT;
    if (dt > 0) g.vx = 0.7 * ((e.clientX - g.lastX) / dt) + 0.3 * g.vx;
    g.lastX = e.clientX;
    g.lastT = e.timeStamp;

    if (!g.active) {
      const ax = Math.abs(g.dx);
      const ay = Math.abs(g.dy);
      if (ay > SLOP && ay > ax) {
        // A vertical gesture: leave it to the page (scrolling).
        gesture.current = null;
        return;
      }
      if (ax < SLOP || ax < ay) return;
      // Clearly horizontal: from here on this press is a swipe, wherever it started.
      g.active = true;
      try {
        rootRef.current?.setPointerCapture(e.pointerId);
      } catch {
        // pointer already gone
      }
      const moving = g.surface ?? topRef.current;
      if (moving) {
        moving.classList.add("is-dragging");
        moving.style.transition = "none";
      }
      if (!g.surface) rootRef.current?.classList.add("is-dragging");
    }

    if (g.surface) {
      // The rest timer slides away on its own; the card under it stays put.
      g.surface.style.transform = `translateX(${g.dx}px)`;
      g.surface.style.opacity = String(1 - clamp(Math.abs(g.dx) / 320, 0, 0.6));
      return;
    }
    const el = topRef.current;
    if (el) el.style.transform = `translate(${g.dx}px, ${g.dy * 0.12}px) rotate(${g.dx / 32}deg)`;
    paint(g.dx);
  }

  function onPointerEnd(e: React.PointerEvent<HTMLDivElement>, cancelled: boolean) {
    const g = gesture.current;
    if (!g || g.id !== e.pointerId) return;
    gesture.current = null;
    if (!g.active) return; // a tap: let the button / slider / overlay handle it normally

    // The press was a swipe, so the click that may follow must not press a button.
    suppressClickUntil.current = performance.now() + 250;
    const flung =
      Math.abs(g.vx) > 0.6 && Math.abs(g.dx) > 40 && Math.sign(g.vx) === Math.sign(g.dx);

    if (g.surface) {
      const s = g.surface;
      s.classList.remove("is-dragging");
      s.style.transition = "transform .2s ease-out, opacity .2s ease-out";
      if (!cancelled && (Math.abs(g.dx) > THRESHOLD * 0.6 || flung)) {
        s.style.transform = `translateX(${g.dx > 0 ? 110 : -110}%)`;
        s.style.opacity = "0";
        timers.current.push(setTimeout(() => onSurfaceDismiss?.(), 180));
      } else {
        s.style.transform = "";
        s.style.opacity = "";
      }
      return;
    }

    rootRef.current?.classList.remove("is-dragging");
    const el = topRef.current;
    if (el) {
      el.classList.remove("is-dragging");
      el.style.transition = "";
    }
    if (!cancelled && (Math.abs(g.dx) > THRESHOLD || flung)) {
      commit(g.dx > 0 ? "right" : "left", { x: g.dx, y: g.dy * 0.12, rot: g.dx / 32 });
      return;
    }
    if (el) el.style.transform = "";
    paint(0);
  }

  const plates = Math.min(2, Math.max(0, items.length - 1));
  const exitingShown = exiting.filter((x) => x.key !== topKey);
  const cards: { key: string; item: T; exit?: Exiting<T> }[] = [
    ...(top !== undefined && topKey !== null ? [{ key: topKey, item: top }] : []),
    ...exitingShown.map((x) => ({ key: x.key, item: x.item, exit: x })),
  ];

  return (
    <div
      ref={rootRef}
      className="wk-stage"
      onPointerDown={onPointerDown}
      onPointerMove={onPointerMove}
      onPointerUp={(e) => onPointerEnd(e, false)}
      onPointerCancel={(e) => onPointerEnd(e, true)}
      onClickCapture={(e) => {
        // Swallow only the one click a drag can produce, so a real tap right after still works.
        if (performance.now() < suppressClickUntil.current) {
          suppressClickUntil.current = 0;
          e.preventDefault();
          e.stopPropagation();
        }
      }}
    >
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
