import { useEffect, useRef, useState } from "react";
import { mmss } from "@/lib/format";
import {
  showWorkoutNotification,
  triggerHapticVibration,
  requestNotificationPermission,
} from "@/lib/notifications";

interface RestTimerProps {
  seconds: number;
  exerciseName?: string;
  onDismiss: () => void;
}

export function RestTimer({ seconds, exerciseName, onDismiss }: RestTimerProps) {
  // Use timestamp-based countdown so locking the screen doesn't pause the timer
  const [endTime, setEndTime] = useState<number>(() => Date.now() + seconds * 1000);
  const [remaining, setRemaining] = useState<number>(seconds);
  const totalSeconds = useRef(seconds);
  const hasAlerted = useRef(false);

  useEffect(() => {
    const target = Date.now() + seconds * 1000;
    setEndTime(target);
    totalSeconds.current = seconds;
    setRemaining(seconds);
    hasAlerted.current = false;

    // Ask for notification permission if not yet requested
    requestNotificationPermission();
  }, [seconds]);

  useEffect(() => {
    function updateCountdown() {
      const now = Date.now();
      const diff = Math.max(0, Math.ceil((endTime - now) / 1000));
      setRemaining(diff);

      if (diff <= 0 && !hasAlerted.current) {
        hasAlerted.current = true;
        triggerHapticVibration([300, 150, 300]);

        // Send completion notification for lock screen
        showWorkoutNotification({
          title: "🔔 Rest Time Over!",
          body: exerciseName ? `Time for your next set of ${exerciseName}!` : "Time to start your next set!",
          tag: "rest-timer-finish",
        });

        // Auto dismiss after 1 second
        setTimeout(onDismiss, 1000);
      }
    }

    // Initial update
    updateCountdown();

    const interval = setInterval(updateCountdown, 500);

    // Instant update when screen turns on or user returns from lock screen
    function onVisibilityChange() {
      updateCountdown();

      // If user locked screen while timer is running, send lock-screen notification status
      if (document.visibilityState === "hidden" && remaining > 0) {
        showWorkoutNotification({
          title: `⏳ Rest Timer: ${mmss(remaining)}`,
          body: exerciseName ? `Next: ${exerciseName}` : "Active Workout Session",
          tag: "active-workout",
        });
      }
    }

    document.addEventListener("visibilitychange", onVisibilityChange);
    window.addEventListener("focus", updateCountdown);

    return () => {
      clearInterval(interval);
      document.removeEventListener("visibilitychange", onVisibilityChange);
      window.removeEventListener("focus", updateCountdown);
    };
  }, [endTime, exerciseName, onDismiss, remaining]);

  function addTime(extraSeconds: number) {
    setEndTime((prev) => prev + extraSeconds * 1000);
    setRemaining((prev) => prev + extraSeconds);
    totalSeconds.current += extraSeconds;
    hasAlerted.current = false;
  }

  const done = remaining === 0;
  const pct = totalSeconds.current > 0 ? 1 - remaining / totalSeconds.current : 1;
  const dashOffset = 100.5 * (1 - Math.min(1, Math.max(0, pct)));

  return (
    // Positioned above the workout bottom bar
    <div style={{ position: "fixed", left: 0, right: 0, bottom: 76, zIndex: 40, padding: "0 14px" }}>
      <div
        style={{
          margin: "0 auto",
          maxWidth: 420,
          display: "flex",
          alignItems: "center",
          gap: 14,
          borderRadius: 12,
          border: "1px solid oklch(0.27 0.005 250)",
          background: "oklch(0.135 0.005 250 / 97%)",
          backdropFilter: "blur(8px)",
          WebkitBackdropFilter: "blur(8px)",
          padding: "10px 14px",
          boxShadow: "0 8px 24px rgba(0,0,0,0.5)",
        }}
      >
        {/* SVG progress ring */}
        <div style={{ position: "relative", width: 44, height: 44, flexShrink: 0 }}>
          <svg width="44" height="44" viewBox="0 0 36 36" style={{ transform: "rotate(-90deg)" }}>
            <circle cx="18" cy="18" r="16" fill="none" stroke="oklch(0.25 0.005 250)" strokeWidth="3" />
            <circle
              cx="18"
              cy="18"
              r="16"
              fill="none"
              stroke={done ? "oklch(0.78 0.19 145)" : "oklch(0.92 0.25 110)"}
              strokeWidth="3"
              strokeLinecap="round"
              strokeDasharray="100.5"
              strokeDashoffset={dashOffset}
              style={{ transition: "stroke-dashoffset 0.5s linear" }}
            />
          </svg>
        </div>

        {/* Label */}
        <div style={{ minWidth: 0, flex: 1 }}>
          <p
            style={{
              margin: 0,
              fontSize: 19,
              fontWeight: 700,
              lineHeight: 1,
              fontVariantNumeric: "tabular-nums",
              color: done ? "oklch(0.78 0.19 145)" : "white",
            }}
          >
            {mmss(remaining)}
          </p>
          <p style={{ margin: "3px 0 0", fontSize: 11.5, color: "oklch(0.63 0.006 250)", whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>
            {done ? "Rest complete — next set" : exerciseName ? `Rest before ${exerciseName}` : "Resting"}
          </p>
        </div>

        {/* Controls — +30s and Skip */}
        <div style={{ display: "flex", alignItems: "center", gap: 6, flexShrink: 0 }}>
          <button
            onClick={() => addTime(30)}
            style={{
              height: 32,
              padding: "0 10px",
              borderRadius: 6,
              border: "1px solid oklch(0.27 0.005 250)",
              background: "oklch(0.18 0.005 250)",
              color: "white",
              fontSize: 12,
              fontWeight: 600,
              cursor: "pointer",
            }}
          >
            +30s
          </button>
          <button
            onClick={onDismiss}
            style={{
              height: 32,
              padding: "0 10px",
              borderRadius: 6,
              border: "none",
              background: "oklch(0.24 0.005 250)",
              color: "oklch(0.8 0.01 250)",
              fontSize: 12,
              fontWeight: 600,
              cursor: "pointer",
            }}
          >
            Skip
          </button>
        </div>
      </div>
    </div>
  );
}