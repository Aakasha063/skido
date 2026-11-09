import { createFileRoute, useRouter } from "@tanstack/react-router";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { useState } from "react";
import { toast } from "sonner";
import { AppShell } from "@/components/AppShell";
import {
  ACCENT,
  Field,
  Icon,
  LINE,
  MUTED,
  PageSpinner,
  Sheet,
  SubHeader,
} from "@/components/sk/ui";
import {
  fetchSessionCardio,
  fetchSessionDetail,
  fetchSessionPRs,
  logSet,
  type SetRow,
} from "@/lib/api";
import { epley1RM, fmtDuration } from "@/lib/format";
import { fmtDate, fmtVolume, fmtW, splitTitle } from "@/lib/skido";

const MAX_WEIGHT_KG = 300;

export const Route = createFileRoute("/history_/$id")({
  head: () => ({
    meta: [
      { title: "Session Detail — Skido" },
      {
        name: "description",
        content:
          "Full breakdown of a logged training session: every set, weight, reps, RIR, volume, cardio and PRs.",
      },
      { property: "og:title", content: "Session Detail — Skido" },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary_large_image" },
    ],
  }),
  component: () => (
    <AppShell tab="progress">
      <SessionDetail />
    </AppShell>
  ),
});

type Detail = NonNullable<Awaited<ReturnType<typeof fetchSessionDetail>>>;

function SessionDetail() {
  const { id } = Route.useParams();
  const qc = useQueryClient();
  const router = useRouter();
  const { data, isLoading } = useQuery({
    queryKey: ["session-detail", id],
    queryFn: () => fetchSessionDetail(id),
  });
  const { data: cardio } = useQuery({
    queryKey: ["session-cardio", id],
    queryFn: () => fetchSessionCardio(id),
  });
  const { data: prs } = useQuery({
    queryKey: ["session-prs", id],
    queryFn: () => fetchSessionPRs(id),
  });

  const [editing, setEditing] = useState<{ set: SetRow; cardio: boolean } | null>(null);
  const [editWeight, setEditWeight] = useState("");
  const [editReps, setEditReps] = useState("");

  const back = () =>
    window.history.length > 1
      ? router.history.back()
      : router.navigate({ to: "/progress", search: { seg: "history" } });

  if (isLoading) return <PageSpinner />;
  if (!data) {
    return (
      <>
        <SubHeader eyebrow="History" title="Session not found" onBack={back} />
        <p style={{ margin: 0, fontSize: 14, color: MUTED }}>
          This session may have been discarded.
        </p>
      </>
    );
  }

  const { session, exSessions, sets } = data;
  const working = sets.filter((s) => !s.is_warmup);
  const volume = fmtVolume(working.reduce((sum, s) => sum + (s.weight_kg ?? 0) * (s.reps ?? 0), 0));
  const t = splitTitle(session.title);

  const chips = [
    session.status !== "completed" ? session.status.replace("_", " ") : null,
    session.mood ? `Felt ${session.mood.toLowerCase()}` : null,
    session.energy ? `Energy ${session.energy}/5` : null,
    session.difficulty ? `Difficulty ${session.difficulty}/5` : null,
  ].filter(Boolean) as string[];

  function openEdit(set: SetRow, isCardio: boolean) {
    setEditing({ set, cardio: isCardio });
    setEditWeight(set.weight_kg != null ? String(set.weight_kg) : "");
    setEditReps(set.reps != null ? String(set.reps) : "");
  }

  function saveEdit() {
    if (!editing) return;
    const { set, cardio: isCardio } = editing;
    const weight = isCardio
      ? null
      : editWeight
        ? Math.min(Number(editWeight), MAX_WEIGHT_KG)
        : null;
    const reps = editReps ? Number(editReps) : null;
    if (reps === null || (!isCardio && weight === null)) {
      toast.error(isCardio ? "Please enter minutes" : "Please enter weight and reps");
      return;
    }
    // Update the cache straight away; reconcile from the server only if the save fails.
    qc.setQueryData<Detail>(["session-detail", id], (old) =>
      old
        ? {
            ...old,
            sets: old.sets.map((s) => (s.id === set.id ? { ...s, weight_kg: weight, reps } : s)),
          }
        : old,
    );
    setEditing(null);
    toast.success("Set updated");
    logSet({
      userId: set.user_id,
      exerciseSessionId: set.exercise_session_id,
      exerciseId: set.exercise_id,
      setNumber: set.set_number,
      weight,
      reps,
      rir: set.rir,
      isWarmup: set.is_warmup,
      existingId: set.id,
    }).catch((e: unknown) => {
      toast.error(e instanceof Error ? e.message : "Failed to update set");
      qc.invalidateQueries({ queryKey: ["session-detail", id] });
    });
  }

  return (
    <div className="sk-fade">
      <SubHeader
        eyebrow={fmtDate(session.session_date, { weekday: "long", day: "numeric", month: "long" })}
        title={[t.day, t.focus].filter(Boolean).join(" · ")}
        onBack={back}
      />

      <div className="sk-surface sk-grid2" style={{ marginBottom: 16 }}>
        {[
          ["Duration", fmtDuration(session.duration_seconds)],
          ["Working sets", String(working.length)],
          ["Volume", `${volume.value} ${volume.unit}`],
          ["Records", String(prs?.length ?? 0)],
        ].map(([label, value]) => (
          <div key={label}>
            <p className="sk-cap" style={{ margin: 0 }}>
              {label}
            </p>
            <p className="sk-num" style={{ margin: "8px 0 0", fontSize: 24, fontWeight: 400 }}>
              {value}
            </p>
          </div>
        ))}
      </div>

      {chips.length > 0 && (
        <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginBottom: 16 }}>
          {chips.map((c) => (
            <span
              key={c}
              className="sk-pill"
              style={{
                textTransform: c.includes("_") || c === "in progress" ? "capitalize" : undefined,
              }}
            >
              {c}
            </span>
          ))}
        </div>
      )}

      {(prs ?? []).length > 0 && (
        <div
          style={{
            marginBottom: 16,
            padding: "16px 18px",
            borderRadius: 20,
            border: "1px solid rgba(198,244,50,0.22)",
            background: "rgba(198,244,50,0.05)",
          }}
        >
          <p className="sk-cap" style={{ margin: 0, color: ACCENT }}>
            Personal records
          </p>
          {prs!.map((p) => (
            <p key={p.id} style={{ margin: "8px 0 0", fontSize: 14 }}>
              <span style={{ fontWeight: 500 }}>
                {(p.exercises as { name: string } | null)?.name ?? "Exercise"}
              </span>{" "}
              <span style={{ color: MUTED }}>
                ·{" "}
                {p.record_type === "volume"
                  ? `best volume ${Math.round(Number(p.volume_kg ?? 0))} kg`
                  : `est. 1RM ${fmtW(Number(p.estimated_1rm))} kg (${fmtW(Number(p.weight_kg))} × ${p.reps})`}
              </span>
            </p>
          ))}
        </div>
      )}

      {exSessions.length === 0 && (
        <p
          style={{
            margin: 0,
            padding: 24,
            borderRadius: 20,
            border: "1px dashed rgba(255,255,255,0.1)",
            textAlign: "center",
            fontSize: 13,
            lineHeight: 1.5,
            color: "rgba(255,255,255,0.56)",
          }}
        >
          Set-by-set detail wasn't recorded for this session.
        </p>
      )}

      {exSessions.map((es) => {
        const exSets = sets
          .filter((s) => s.exercise_session_id === es.id)
          .sort((a, b) => a.set_number - b.set_number);
        if (exSets.length === 0) return null;
        const isCardio = es.exercises?.category === "cardio";
        const best = Math.max(
          0,
          ...exSets
            .filter((s) => !s.is_warmup && s.weight_kg && s.reps)
            .map((s) => epley1RM(s.weight_kg!, s.reps!)),
        );
        const meta = isCardio
          ? "Cardio"
          : [
              es.exercises?.primary_muscle ?? es.exercises?.category,
              es.target_rep_range ? `target ${es.target_rep_range}` : null,
              best ? `e1RM ${fmtW(Math.round(best * 10) / 10)} kg` : null,
            ]
              .filter(Boolean)
              .join(" · ");
        return (
          <section
            key={es.id}
            className="sk-surface"
            style={{ borderRadius: 20, padding: "16px 18px", marginBottom: 10 }}
          >
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "baseline",
                gap: 10,
              }}
            >
              <p style={{ margin: 0, fontSize: 14.5, fontWeight: 500 }}>
                {es.exercises?.name ?? "Exercise"}
              </p>
              <span className="sk-cap" style={{ textAlign: "right" }}>
                {meta}
              </span>
            </div>
            {isCardio ? (
              exSets.map((s) => (
                <button
                  key={s.id}
                  type="button"
                  className="sk-row-btn"
                  onClick={() => openEdit(s, true)}
                  style={{ padding: "10px 0 0", fontSize: 13.5 }}
                >
                  <span style={{ flex: 1 }}>Logged: {s.reps ?? "—"} minutes</span>
                  <Icon name="edit" size={13} color="rgba(255,255,255,0.46)" />
                </button>
              ))
            ) : (
              <div role="table" style={{ marginTop: 12 }}>
                <div
                  role="row"
                  style={{
                    display: "grid",
                    gridTemplateColumns: "40px repeat(3, minmax(0, 1fr)) 20px",
                    fontSize: 11,
                    color: "rgba(255,255,255,0.52)",
                    paddingBottom: 6,
                    borderBottom: LINE,
                  }}
                >
                  <span role="columnheader">Set</span>
                  <span role="columnheader">Weight</span>
                  <span role="columnheader">Reps</span>
                  <span role="columnheader">RIR</span>
                  <span />
                </div>
                {exSets.map((s) => (
                  <button
                    key={s.id}
                    type="button"
                    role="row"
                    onClick={() => openEdit(s, false)}
                    aria-label={`Edit set ${s.set_number}`}
                    className="sk-num"
                    style={{
                      display: "grid",
                      gridTemplateColumns: "40px repeat(3, minmax(0, 1fr)) 20px",
                      width: "100%",
                      textAlign: "left",
                      fontSize: 13.5,
                      padding: "8px 0",
                      letterSpacing: 0,
                      border: "none",
                      borderBottom: "1px solid rgba(255,255,255,0.04)",
                      background: "transparent",
                      color: "inherit",
                      cursor: "pointer",
                      fontFamily: "inherit",
                    }}
                  >
                    <span role="cell" style={{ color: "rgba(255,255,255,0.52)" }}>
                      {s.is_warmup ? "W" : s.set_number}
                    </span>
                    <span role="cell">
                      {s.weight_kg != null ? `${fmtW(s.weight_kg)} kg` : "BW"}
                    </span>
                    <span role="cell">{s.reps ?? "—"}</span>
                    <span role="cell" style={{ color: MUTED }}>
                      {s.rir ?? "—"}
                    </span>
                    <Icon name="edit" size={12} color="rgba(255,255,255,0.32)" />
                  </button>
                ))}
              </div>
            )}
          </section>
        );
      })}

      {(cardio ?? []).length > 0 && (
        <p style={{ margin: "14px 0 0", fontSize: 13, lineHeight: 1.6, color: MUTED }}>
          Cardio —{" "}
          {cardio!
            .map((c) =>
              [
                c.cardio_type,
                c.duration_minutes ? `${fmtW(Number(c.duration_minutes))} min` : null,
                c.incline_percent ? `${c.incline_percent}% incline` : null,
                c.speed_kph ? `${c.speed_kph} km/h` : null,
              ]
                .filter(Boolean)
                .join(" · "),
            )
            .join(", ")}
        </p>
      )}

      {session.notes && (
        <div style={{ marginTop: 16 }}>
          <p className="sk-cap" style={{ margin: "0 0 6px" }}>
            Notes
          </p>
          <p style={{ margin: 0, fontSize: 14, lineHeight: 1.55, color: "rgba(255,255,255,0.82)" }}>
            {session.notes}
          </p>
        </div>
      )}

      <Sheet
        open={!!editing}
        onClose={() => setEditing(null)}
        title={editing ? `Edit set ${editing.set.set_number}` : "Edit set"}
        text="Fix a typo in what you logged."
      >
        <div style={{ display: "flex", gap: 10, marginBottom: 20 }}>
          {!editing?.cardio && (
            <Field
              label="Weight (kg)"
              inputMode="decimal"
              value={editWeight}
              onChange={(e) => setEditWeight(e.target.value)}
              style={{ flex: 1 }}
            />
          )}
          <Field
            label={editing?.cardio ? "Minutes" : "Reps"}
            inputMode="numeric"
            value={editReps}
            onChange={(e) => setEditReps(e.target.value)}
            style={{ flex: 1 }}
          />
        </div>
        <button type="button" className="sk-btn sk-btn-light" onClick={saveEdit}>
          Save changes
        </button>
      </Sheet>
    </div>
  );
}
