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
  /** Cards still to play; items[0] is the top card. */
  items: T[];
  getKey: (item: T) => string;
  renderCard: (item: T, state: { depth: number }) => ReactNode;
  /** Called the moment a card is released past the threshold — the next card is live immediately. */
  onSwipe: (item: T, dir: SwipeDirection) => void;
  /** Shown once every card has been swiped. */
  empty?: ReactNode;
  disabled?: boolean;
};

type Exiting<T> = { key: string; item: T; dir: SwipeDirection; x: number; y: number; rot: number };

const VISIBLE = 3;
const FLY_MS = 260;
const ROTATION_PER_PX = 0.06;
const IGNORE_DRAG_FROM = "[data-no-swipe], button, input, select, textarea, a";

function SwipeDeckInner<T>(
  { items, getKey, renderCard, onSwipe, empty, disabled }: Props<T>,
  ref: Ref<SwipeDeckHandle>,
) {
  const rootRef = useRef<HTMLDivElement>(null);
  const topRef = useRef<HTMLDivElement>(null);
  const drag = useRef<{
    pointerId: number;
    startX: number;
    startY: number;
    dx: number;
    dy: number;
    lastX: number;
    lastT: number;
    vx: number;
  } | null>(null);
  const timers = useRef<ReturnType<typeof setTimeout>[]>([]);
  const exitedDir = useRef(new Map<string, SwipeDirection>());
  const [exiting, setExiting] = useState<Exiting<T>[]>([]);
  const [returning, setReturning] = useState<{ key: string; dir: SwipeDirection } | null>(null);

  const top = items[0];
  const topKey = top === undefined ? null : getKey(top);

  useEffect(() => () => timers.current.forEach(clearTimeout), []);

  const later = (fn: () => void, ms: number) => {
    timers.current.push(setTimeout(fn, ms));
  };

  const setDragVars = (dx: number) => {
    const root = rootRef.current;
    const el = topRef.current;
    const threshold = thresholdFor(root);
    const signed = Math.max(-1, Math.min(1, dx / threshold));
    el?.style.setProperty("--drag", String(signed));
    root?.style.setProperty("--p", String(Math.abs(signed)));
  };

  // A card that becomes the top (deck advanced, or an undo brought it back) must not
  // keep a transform left over from an earlier drag. An undone card animates back in
  // from the side it was swiped to.
  useLayoutEffect(() => {
    const el = topRef.current;
    if (el) {
      el.style.transform = "";
      el.style.transition = "";
      el.style.setProperty("--drag", "0");
    }
    rootRef.current?.style.setProperty("--p", "0");
    if (topKey && exitedDir.current.has(topKey)) {
      const dir = exitedDir.current.get(topKey)!;
      exitedDir.current.delete(topKey);
      setReturning({ key: topKey, dir });
      later(() => setReturning((r) => (r?.key === topKey ? null : r)), FLY_MS + 40);
    }
  }, [topKey]);

  const commit = useCallback(
    (dir: SwipeDirection, from: { x: number; y: number; rot: number }) => {
      if (top === undefined || topKey === null) return;
      exitedDir.current.set(topKey, dir);
      setExiting((prev) => [
        ...prev.filter((e) => e.key !== topKey),
        { key: topKey, item: top, dir, ...from },
      ]);
      onSwipe(top, dir);
      later(() => setExiting((prev) => prev.filter((e) => e.key !== topKey)), FLY_MS);
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
    if (disabled || e.button !== 0) return;
    if ((e.target as HTMLElement).closest(IGNORE_DRAG_FROM)) return;
    e.currentTarget.setPointerCapture(e.pointerId);
    drag.current = {
      pointerId: e.pointerId,
      startX: e.clientX,
      startY: e.clientY,
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
    if (!d || d.pointerId !== e.pointerId) return;
    d.dx = e.clientX - d.startX;
    d.dy = e.clientY - d.startY;
    const dt = e.timeStamp - d.lastT;
    if (dt > 0) d.vx = 0.7 * ((e.clientX - d.lastX) / dt) + 0.3 * d.vx;
    d.lastX = e.clientX;
    d.lastT = e.timeStamp;
    e.currentTarget.style.transform = `translate3d(${d.dx}px, ${d.dy * 0.35}px, 0) rotate(${d.dx * ROTATION_PER_PX}deg)`;
    setDragVars(d.dx);
  }

  function endDrag(e: React.PointerEvent<HTMLDivElement>, cancelled: boolean) {
    const d = drag.current;
    if (!d || d.pointerId !== e.pointerId) return;
    drag.current = null;
    rootRef.current?.classList.remove("is-dragging");
    const el = e.currentTarget;
    el.style.transition = "";

    const threshold = thresholdFor(rootRef.current);
    const flung =
      Math.abs(d.vx) > 0.5 && Math.abs(d.dx) > 30 && Math.sign(d.vx) === Math.sign(d.dx);
    if (!cancelled && (Math.abs(d.dx) > threshold || flung)) {
      commit(d.dx > 0 ? "right" : "left", {
        x: d.dx,
        y: d.dy * 0.35,
        rot: d.dx * ROTATION_PER_PX,
      });
      return;
    }
    el.style.transform = "";
    setDragVars(0);
  }

  const visible = items.slice(0, VISIBLE);
  const visibleKeys = new Set(visible.map(getKey));
  const exitingShown = exiting.filter((x) => !visibleKeys.has(x.key));

  // One keyed list so a card keeps its component state (slider values) while it
  // goes from top-of-stack to flying out, or comes back on undo.
  const cards: { key: string; item: T; depth: number; exit?: Exiting<T> }[] = [
    ...visible.map((item, depth) => ({ key: getKey(item), item, depth })),
    ...exitingShown.map((x) => ({ key: x.key, item: x.item, depth: 0, exit: x })),
  ];

  return (
    <div ref={rootRef} className="wk-deck">
      {items.length === 0 && <div className="wk-deck-empty">{empty}</div>}
      {cards.map(({ key, item, depth, exit }) => {
        const isTop = !exit && depth === 0;
        const back = exit?.dir ?? (returning?.key === key ? returning.dir : null);
        const sign = back === "left" ? -1 : 1;
        const style = {
          zIndex: exit ? 20 : 10 - depth,
          "--tx": `${sign * 130}vw`,
          "--tr": `${sign * 24}deg`,
          ...(exit && {
            "--fx": `${exit.x}px`,
            "--fy": `${exit.y}px`,
            "--fr": `${exit.rot}deg`,
          }),
        } as CSSProperties;
        const className = [
          "wk-card",
          exit ? "is-exiting" : "",
          !exit && returning?.key === key ? "is-returning" : "",
        ].join(" ");
        return (
          <div
            key={key}
            ref={isTop ? topRef : undefined}
            className={className}
            data-depth={exit ? undefined : depth}
            data-dir={exit?.dir}
            style={style}
            aria-hidden={!isTop}
            onPointerDown={isTop ? onPointerDown : undefined}
            onPointerMove={isTop ? onPointerMove : undefined}
            onPointerUp={isTop ? (e) => endDrag(e, false) : undefined}
            onPointerCancel={isTop ? (e) => endDrag(e, true) : undefined}
          >
            <span className="wk-stamp wk-stamp-done" aria-hidden>
              DONE
            </span>
            <span className="wk-stamp wk-stamp-skip" aria-hidden>
              SKIP
            </span>
            {renderCard(item, { depth: exit ? 0 : depth })}
          </div>
        );
      })}
    </div>
  );
}

function thresholdFor(root: HTMLElement | null) {
  const width = root?.clientWidth ?? 360;
  return Math.min(120, width * 0.28);
}

export const SwipeDeck = forwardRef(SwipeDeckInner) as <T>(
  props: Props<T> & { ref?: Ref<SwipeDeckHandle> },
) => ReturnType<typeof SwipeDeckInner>;
