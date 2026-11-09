/**
 * Shared building blocks for the Skido design (src/skido.css). Kept dependency-free:
 * icons are inline SVG paths and charts are plain polylines, so screens stay light.
 */
import { Link } from "@tanstack/react-router";
import { useEffect, useId, type CSSProperties, type ReactNode } from "react";
import { createPortal } from "react-dom";

export const ACCENT = "#C6F432";
export const LINE = "1px solid rgba(255,255,255,0.06)";
export const MUTED = "rgba(255,255,255,0.62)";
export const FAINT = "rgba(255,255,255,0.56)";

/* ───────────────────────── icons ───────────────────────── */

const PATHS = {
  back: "M15 6 9 12 15 18",
  next: "M9 6 15 12 9 18",
  down: "M6 9 12 15 18 9",
  close: "M6 6 18 18M18 6 6 18",
  check: "M5 12.5 10 17.5 19 7",
  plus: "M5 12h14M12 5v14",
  minus: "M5 12h14",
  undo: "M9 14 4 9 9 4M4 9h10a6 6 0 0 1 0 12h-3",
  skipEx: "M5 6l6 6-6 6M12 6l6 6-6 6",
  arrow: "M5 12h14M13 6l6 6-6 6",
  trophy: "M8 21h8M12 17v4M7 4h10v4a5 5 0 0 1-10 0V4z",
  trophyHandles:
    "M8 21h8M12 17v4M7 4h10v4a5 5 0 0 1-10 0V4zM7 6H4a3 3 0 0 0 3 5M17 6h3a3 3 0 0 1-3 5",
  edit: "M4 20h4L19 9l-4-4L4 16z",
  home: "M3 10.5 12 3l9 7.5V20a1 1 0 0 1-1 1h-5v-6h-6v6H4a1 1 0 0 1-1-1z",
  plan: "M4 5h16v15H4zM4 10h16M9 3v4M15 3v4",
  progress: "M3 17l6-6 4 4 8-8M15 7h6v6",
  profile: "M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM4 21c1.5-4 4.5-6 8-6s6.5 2 8 6",
  swap: "M17 1l4 4-4 4M3 11V9a4 4 0 0 1 4-4h14M7 23l-4-4 4-4M21 13v2a4 4 0 0 1-4 4H3",
} as const;

export type IconName = keyof typeof PATHS | "info" | "logo";

export function Icon({
  name,
  size = 16,
  stroke = 2,
  color = "currentColor",
  style,
}: {
  name: IconName;
  size?: number;
  stroke?: number | string;
  color?: string;
  style?: CSSProperties;
}) {
  if (name === "info") {
    return (
      <svg
        aria-hidden="true"
        width={size}
        height={size}
        viewBox="0 0 24 24"
        fill="none"
        stroke={color}
        strokeWidth={stroke}
        strokeLinecap="round"
        style={style}
      >
        <circle cx="12" cy="12" r="9" />
        <line x1="12" y1="11" x2="12" y2="16.5" />
        <circle cx="12" cy="7.6" r="0.5" fill={color} />
      </svg>
    );
  }
  if (name === "logo") {
    return (
      <svg
        aria-hidden="true"
        width={size}
        height={size}
        viewBox="0 0 24 24"
        fill="none"
        stroke={color}
        strokeWidth={stroke}
        strokeLinecap="round"
        style={style}
      >
        <circle cx="5" cy="12" r="2.6" />
        <circle cx="19" cy="12" r="2.6" />
        <line x1="7.6" y1="12" x2="16.4" y2="12" />
      </svg>
    );
  }
  return (
    <svg
      aria-hidden="true"
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke={color}
      strokeWidth={stroke}
      strokeLinecap="round"
      strokeLinejoin="round"
      style={style}
    >
      <path d={PATHS[name]} />
    </svg>
  );
}

export function Chevron() {
  return <Icon name="next" size={14} color="rgba(255,255,255,0.46)" style={{ flexShrink: 0 }} />;
}

/* ───────────────────────── layout ───────────────────────── */

export function Page({ children }: { children: ReactNode }) {
  return <div className="sk-page">{children}</div>;
}

export function PageSpinner() {
  return (
    <div
      style={{ display: "flex", minHeight: "60vh", alignItems: "center", justifyContent: "center" }}
    >
      <div className="sk-spinner" />
    </div>
  );
}

export function TabHeader({
  eyebrow,
  title,
  right,
}: {
  eyebrow: string;
  title: string;
  right?: ReactNode;
}) {
  return (
    <header
      className="sk-fade"
      style={{
        display: "flex",
        alignItems: "center",
        justifyContent: "space-between",
        gap: 12,
        marginBottom: 28,
      }}
    >
      <div style={{ minWidth: 0 }}>
        <p style={{ margin: 0, fontSize: 13, color: MUTED }}>{eyebrow}</p>
        <h1
          className="sk-lime-text"
          style={{
            margin: "4px 0 0",
            fontSize: 26,
            lineHeight: 1.15,
            fontWeight: 600,
            letterSpacing: "-0.03em",
          }}
        >
          {title}
        </h1>
      </div>
      {right}
    </header>
  );
}

export function SubHeader({
  eyebrow,
  title,
  onBack,
}: {
  eyebrow: string;
  title: string;
  onBack: () => void;
}) {
  return (
    <header style={{ display: "flex", alignItems: "center", gap: 12, marginBottom: 24 }}>
      <button
        type="button"
        className="sk-icon-btn"
        onClick={onBack}
        aria-label="Back"
        style={{ width: 40, height: 40, flexShrink: 0 }}
      >
        <Icon name="back" />
      </button>
      <div style={{ minWidth: 0 }}>
        <p className="sk-cap" style={{ margin: 0 }}>
          {eyebrow}
        </p>
        <h1
          style={{
            margin: "2px 0 0",
            fontSize: 20,
            fontWeight: 600,
            letterSpacing: "-0.025em",
            whiteSpace: "nowrap",
            overflow: "hidden",
            textOverflow: "ellipsis",
          }}
        >
          {title}
        </h1>
      </div>
    </header>
  );
}

export function SectionTitle({
  title,
  right,
  style,
}: {
  title: string;
  right?: ReactNode;
  style?: CSSProperties;
}) {
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        alignItems: "baseline",
        gap: 10,
        margin: "28px 0 12px",
        ...style,
      }}
    >
      <h2 className="sk-h-section">{title}</h2>
      {right}
    </div>
  );
}

/* ───────────────────────── controls ───────────────────────── */

export function Seg<T extends string>({
  options,
  value,
  onChange,
  label,
  radio = false,
  style,
  btnStyle,
}: {
  options: { value: T; label: string }[];
  value: T;
  onChange: (v: T) => void;
  label: string;
  radio?: boolean;
  style?: CSSProperties;
  btnStyle?: CSSProperties;
}) {
  return (
    <div
      className="sk-seg"
      role={radio ? "radiogroup" : "tablist"}
      aria-label={label}
      style={style}
    >
      {options.map((o) => (
        <button
          key={o.value}
          type="button"
          role={radio ? "radio" : "tab"}
          {...(radio
            ? { "aria-checked": o.value === value }
            : { "aria-selected": o.value === value })}
          className="sk-seg-btn"
          onClick={() => onChange(o.value)}
          style={btnStyle}
        >
          {o.label}
        </button>
      ))}
    </div>
  );
}

export function Chips<T extends string>({
  options,
  value,
  onChange,
}: {
  options: { value: T; label: string }[];
  value: T;
  onChange: (v: T) => void;
}) {
  return (
    <div className="sk-chips">
      {options.map((o) => (
        <button
          key={o.value}
          type="button"
          aria-pressed={o.value === value}
          className="sk-chip-btn"
          onClick={() => onChange(o.value)}
        >
          {o.label}
        </button>
      ))}
    </div>
  );
}

export function Choice({
  checked,
  onClick,
  label,
  hint,
  multi = false,
}: {
  checked: boolean;
  onClick: () => void;
  label: ReactNode;
  hint?: ReactNode;
  multi?: boolean;
}) {
  return (
    <button
      type="button"
      role={multi ? undefined : "radio"}
      {...(multi ? { "aria-pressed": checked } : { "aria-checked": checked })}
      className="sk-choice"
      onClick={onClick}
    >
      <span>
        {label}
        {hint && <small>{hint}</small>}
      </span>
      <span className="sk-dot" />
    </button>
  );
}

export function ChoiceGroup({ label, children }: { label: string; children: ReactNode }) {
  return (
    <div
      role="radiogroup"
      aria-label={label}
      style={{ display: "flex", flexDirection: "column", gap: 8 }}
    >
      {children}
    </div>
  );
}

type InputProps = React.InputHTMLAttributes<HTMLInputElement> & { label: string; id?: string };

export function Field({ label, id, style, ...rest }: InputProps) {
  const auto = useId();
  const fid = id ?? auto;
  return (
    <div className="sk-label" style={style}>
      <label htmlFor={fid} className="sk-cap">
        {label}
      </label>
      <input id={fid} className="sk-field" {...rest} />
    </div>
  );
}

export function SelectField({
  label,
  value,
  onChange,
  options,
  id,
}: {
  label: string;
  value: string;
  onChange: (v: string) => void;
  options: { value: string; label: string }[];
  id?: string;
}) {
  const auto = useId();
  const fid = id ?? auto;
  return (
    <div className="sk-label">
      <label htmlFor={fid} className="sk-cap">
        {label}
      </label>
      <div style={{ position: "relative" }}>
        <select
          id={fid}
          className="sk-field sk-sel"
          value={value}
          onChange={(e) => onChange(e.target.value)}
        >
          {options.map((o) => (
            <option key={o.value} value={o.value}>
              {o.label}
            </option>
          ))}
        </select>
        <Icon
          name="down"
          size={14}
          color={FAINT}
          style={{ position: "absolute", right: 16, top: 18, pointerEvents: "none" }}
        />
      </div>
    </div>
  );
}

/* ───────────────────────── sheets ───────────────────────── */

export function Sheet({
  open,
  title,
  text,
  onClose,
  children,
}: {
  open: boolean;
  title: string;
  text?: ReactNode;
  onClose: () => void;
  children: ReactNode;
}) {
  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => e.key === "Escape" && onClose();
    window.addEventListener("keydown", onKey);
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      window.removeEventListener("keydown", onKey);
      document.body.style.overflow = prev;
    };
  }, [open, onClose]);

  if (!open || typeof document === "undefined") return null;
  return createPortal(
    <>
      <div className="sk-backdrop" onClick={onClose} />
      <div role="dialog" aria-modal="true" aria-label={title} className="sk-sheet">
        <div className="sk-sheet-handle" />
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            marginBottom: 6,
          }}
        >
          <h2 style={{ margin: 0, fontSize: 19, fontWeight: 600, letterSpacing: "-0.02em" }}>
            {title}
          </h2>
          <button
            type="button"
            className="sk-icon-btn"
            onClick={onClose}
            aria-label="Close"
            style={{ width: 32, height: 32 }}
          >
            <Icon name="close" size={13} stroke={2.2} />
          </button>
        </div>
        {text ? (
          <p style={{ margin: "0 0 20px", fontSize: 13.5, lineHeight: 1.5, color: MUTED }}>
            {text}
          </p>
        ) : (
          <div style={{ height: 14 }} />
        )}
        {children}
      </div>
    </>,
    document.body,
  );
}

/* ───────────────────────── data display ───────────────────────── */

export function Stat({
  label,
  value,
  unit,
  note,
  noteColor,
}: {
  label: string;
  value: ReactNode;
  unit?: string | undefined;
  note?: string | undefined;
  noteColor?: string | undefined;
}) {
  return (
    <>
      <span className="sk-cap" style={{ display: "block" }}>
        {label}
      </span>
      <span style={{ display: "block", marginTop: 8 }}>
        <span className="sk-num" style={{ fontSize: 24, fontWeight: 400 }}>
          {value}
        </span>
        {unit && <span style={{ fontSize: 13, marginLeft: 3, color: FAINT }}>{unit}</span>}
      </span>
      {note && (
        <span style={{ display: "block", marginTop: 4, fontSize: 12, color: noteColor ?? FAINT }}>
          {note}
        </span>
      )}
    </>
  );
}

export function MiniStat({ value, label }: { value: ReactNode; label: string }) {
  return (
    <div>
      <p className="sk-num" style={{ margin: 0, fontSize: 18, fontWeight: 500 }}>
        {value}
      </p>
      <p className="sk-cap" style={{ margin: "2px 0 0" }}>
        {label}
      </p>
    </div>
  );
}

export function ProgressBar({ pct, style }: { pct: number; style?: CSSProperties }) {
  return (
    <div className="sk-track" style={style}>
      <div className="sk-bar" style={{ width: `${Math.max(0, Math.min(100, pct))}%` }} />
    </div>
  );
}

/** Polyline points for a small trend chart (same maths as the design's chartOf). */
export function chartOf(values: number[], w = 300, h = 120, pad = 10) {
  if (!values.length) return { line: "", area: "", lastX: 0, lastY: 0 };
  const lo = Math.min(...values);
  const hi = Math.max(...values);
  const pts = values.map((v, i) => [
    values.length === 1 ? w : Math.round((i / (values.length - 1)) * w),
    Math.round(pad + (1 - (v - lo) / (hi - lo || 1)) * (h - pad * 2)),
  ]);
  const line = pts.map((p) => p.join(",")).join(" ");
  return {
    line,
    area: `0,${h} ${line} ${w},${h}`,
    lastX: pts[pts.length - 1]![0]!,
    lastY: pts[pts.length - 1]![1]!,
  };
}

export function TrendChart({
  values,
  label,
  color = ACCENT,
  height = 140,
  grid = true,
}: {
  values: number[];
  label: string;
  color?: string;
  height?: number;
  grid?: boolean;
}) {
  const gid = useId().replace(/:/g, "");
  const c = chartOf(values);
  return (
    <svg
      role="img"
      aria-label={label}
      viewBox="0 0 300 120"
      preserveAspectRatio="none"
      style={{ width: "100%", height, display: "block", overflow: "visible" }}
    >
      <defs>
        <linearGradient id={gid} x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stopColor={color} stopOpacity="0.16" />
          <stop offset="1" stopColor={color} stopOpacity="0" />
        </linearGradient>
      </defs>
      {grid &&
        [30, 70, 110].map((y) => (
          <line
            key={y}
            x1="0"
            y1={y}
            x2="300"
            y2={y}
            stroke="rgba(255,255,255,0.05)"
            vectorEffect="non-scaling-stroke"
          />
        ))}
      <polyline points={c.area} fill={`url(#${gid})`} stroke="none" />
      <polyline
        points={c.line}
        fill="none"
        stroke={color}
        strokeWidth="1.75"
        strokeLinejoin="round"
        strokeLinecap="round"
        vectorEffect="non-scaling-stroke"
      />
    </svg>
  );
}

export function Spark({ values, label }: { values: number[]; label: string }) {
  const gid = useId().replace(/:/g, "");
  const c = chartOf(values, 300, 44, 4);
  return (
    <svg
      role="img"
      aria-label={label}
      viewBox="0 0 300 44"
      preserveAspectRatio="none"
      style={{ width: "100%", height: 44, display: "block", overflow: "visible" }}
    >
      <defs>
        <linearGradient id={gid} x1="0" y1="0" x2="0" y2="1">
          <stop offset="0" stopColor={ACCENT} stopOpacity="0.18" />
          <stop offset="1" stopColor={ACCENT} stopOpacity="0" />
        </linearGradient>
      </defs>
      <polyline points={c.area} fill={`url(#${gid})`} stroke="none" />
      <polyline
        points={c.line}
        fill="none"
        stroke={ACCENT}
        strokeWidth="1.5"
        strokeLinejoin="round"
        strokeLinecap="round"
        vectorEffect="non-scaling-stroke"
      />
      <circle cx={c.lastX} cy={c.lastY} r="3.5" fill={ACCENT} />
    </svg>
  );
}

export type BadgeView = {
  label: string;
  hint: string;
  earned: boolean;
  pct: number;
  sub: string;
};

export function BadgeGrid({ badges }: { badges: BadgeView[] }) {
  return (
    <div style={{ display: "grid", gridTemplateColumns: "repeat(3, minmax(0, 1fr))", gap: 8 }}>
      {badges.map((b) => (
        <div
          key={b.label}
          className="sk-surface"
          title={b.hint}
          style={{
            borderRadius: 18,
            padding: "16px 8px 14px",
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            textAlign: "center",
            opacity: b.earned ? 1 : 0.75,
          }}
        >
          <div style={{ position: "relative", width: 46, height: 46 }}>
            <svg
              aria-hidden="true"
              width="46"
              height="46"
              viewBox="0 0 46 46"
              style={{ transform: "rotate(-90deg)" }}
            >
              <circle
                cx="23"
                cy="23"
                r="20"
                fill="none"
                stroke="rgba(255,255,255,0.08)"
                strokeWidth="2.5"
              />
              <circle
                cx="23"
                cy="23"
                r="20"
                fill="none"
                stroke={b.earned ? ACCENT : "rgba(255,255,255,0.68)"}
                strokeWidth="2.5"
                strokeLinecap="round"
                strokeDasharray="125.7"
                strokeDashoffset={Math.round(125.7 * (1 - b.pct / 100) * 10) / 10}
              />
            </svg>
            <span
              style={{
                position: "absolute",
                inset: 0,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
              }}
            >
              {b.earned ? (
                <Icon name="check" size={16} stroke={2.4} color={ACCENT} />
              ) : (
                <span
                  className="sk-num"
                  style={{ fontSize: 11, color: "rgba(255,255,255,0.68)", letterSpacing: 0 }}
                >
                  {b.pct}%
                </span>
              )}
            </span>
          </div>
          <p style={{ margin: "10px 0 0", fontSize: 12.5, fontWeight: 500, lineHeight: 1.3 }}>
            {b.label}
          </p>
          <p style={{ margin: "3px 0 0", fontSize: 11, color: "rgba(255,255,255,0.52)" }}>
            {b.sub}
          </p>
        </div>
      ))}
    </div>
  );
}

/* ───────────────────────── avatar ───────────────────────── */

export function initialsOf(name: string | null | undefined, fallback = "?") {
  const src = (name ?? "").trim();
  if (!src) return fallback;
  const parts = src.includes("@") ? [src[0]!] : src.split(/\s+/).map((p) => p[0]!);
  return parts.slice(0, 2).join("").toUpperCase();
}

export function Avatar({
  name,
  image,
  color,
  size = 40,
  radius = 999,
  fontSize = 13,
  style,
}: {
  name: string | null | undefined;
  image?: string | null | undefined;
  color?: string | null | undefined;
  size?: number;
  radius?: number;
  fontSize?: number;
  style?: CSSProperties;
}) {
  return (
    <span
      aria-hidden="true"
      style={{
        width: size,
        height: size,
        borderRadius: radius,
        flexShrink: 0,
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
        fontSize,
        fontWeight: 500,
        color: "#151515",
        background: image
          ? `center / cover no-repeat url(${JSON.stringify(image)})`
          : (color ?? ACCENT),
        border: "1px solid rgba(255,255,255,0.1)",
        ...style,
      }}
    >
      {!image && initialsOf(name)}
    </span>
  );
}

/* ───────────────────────── tab bar ───────────────────────── */

const TABS = [
  { to: "/", label: "Home", icon: "home" },
  { to: "/plan", label: "Plan", icon: "plan" },
  { to: "/progress", label: "Progress", icon: "progress" },
  { to: "/profile", label: "Profile", icon: "profile" },
] as const;

export type TabKey = "home" | "plan" | "progress" | "profile";

export function TabBar({ active }: { active: TabKey | null }) {
  return (
    <div className="sk-tabbar">
      <div>
        <nav aria-label="Main">
          {TABS.map((t) => {
            const on = active === t.icon;
            return (
              <Link
                key={t.to}
                to={t.to}
                preload="intent"
                className="sk-tab-btn"
                aria-current={on ? "page" : undefined}
              >
                <Icon name={t.icon} size={20} stroke={on ? 2 : 1.7} />
                <span>{t.label}</span>
              </Link>
            );
          })}
        </nav>
      </div>
    </div>
  );
}
