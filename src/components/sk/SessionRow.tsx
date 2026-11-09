import { Link } from "@tanstack/react-router";
import { Chevron } from "@/components/sk/ui";
import { fmtDuration } from "@/lib/format";
import { splitTitle } from "@/lib/skido";

export type SessionRowData = {
  id: string;
  session_date: string;
  title: string | null;
  duration_seconds: number | null;
  working_sets: number;
  pr_count: number;
};

/** One finished session in a list: date block, title, duration · sets, PR pill. */
export function SessionRow({ s }: { s: SessionRowData }) {
  const dt = new Date(`${s.session_date}T00:00`);
  const t = splitTitle(s.title);
  return (
    <Link to="/history/$id" params={{ id: s.id }} className="sk-row-btn">
      <div style={{ width: 40, flexShrink: 0, textAlign: "center" }}>
        <p className="sk-num" style={{ margin: 0, fontSize: 17, fontWeight: 500, lineHeight: 1 }}>
          {dt.getDate()}
        </p>
        <p
          style={{
            margin: "3px 0 0",
            fontSize: 10.5,
            color: "rgba(255,255,255,0.56)",
            textTransform: "uppercase",
            letterSpacing: ".08em",
          }}
        >
          {dt.toLocaleDateString("en-GB", { month: "short" })}
        </p>
      </div>
      <div style={{ flex: 1, minWidth: 0 }}>
        <p
          style={{
            margin: 0,
            fontSize: 14,
            fontWeight: 500,
            whiteSpace: "nowrap",
            overflow: "hidden",
            textOverflow: "ellipsis",
          }}
        >
          {[t.day, t.focus].filter(Boolean).join(" · ")}
        </p>
        <p style={{ margin: "3px 0 0", fontSize: 12.5, color: "rgba(255,255,255,0.62)" }}>
          {fmtDuration(s.duration_seconds)} · {s.working_sets} sets
        </p>
      </div>
      {s.pr_count > 0 && (
        <span className="sk-pill is-accent">
          {s.pr_count} PR{s.pr_count > 1 ? "s" : ""}
        </span>
      )}
      <Chevron />
    </Link>
  );
}
