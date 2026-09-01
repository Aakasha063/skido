import React, { useRef, useEffect } from 'react';

export interface WorkoutActivity {
  date: string; // YYYY-MM-DD
  minutes?: number;
  workoutName?: string;
  volumeKg?: number;
}

interface HeatmapProps {
  activities?: WorkoutActivity[];
  onSelectDate?: (date: string) => void;
  weeksToShow?: number; // default 26 (6 months) or 52 (full year)
}

const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

export function Heatmap({ activities = [], onSelectDate, weeksToShow = 26 }: HeatmapProps) {
  const containerRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (containerRef.current) {
      containerRef.current.scrollLeft = containerRef.current.scrollWidth;
    }
  }, []);

  // Aggregate activities by date
  const aggMap: Record<string, { count: number; minutes: number; volumeKg: number; names: string[] }> = {};
  for (const act of activities) {
    if (!act.date) continue;
    if (!aggMap[act.date]) {
      aggMap[act.date] = { count: 0, minutes: 0, volumeKg: 0, names: [] };
    }
    aggMap[act.date]!.count += 1;
    aggMap[act.date]!.minutes += act.minutes || 45;
    aggMap[act.date]!.volumeKg += act.volumeKg || 0;
    if (act.workoutName) aggMap[act.date]!.names.push(act.workoutName);
  }

  // Calculate streaks
  const todayObj = new Date();
  const todayStr = todayObj.toISOString().split('T')[0]!;

  let currentStreak = 0;
  let maxStreak = 0;
  let tempStreak = 0;

  // Build weeks grid
  const today = new Date();
  today.setHours(12, 0, 0, 0);

  // End of current week (Sunday)
  const dayOfWeek = (today.getDay() + 6) % 7; // 0 = Mon, 6 = Sun
  const end = new Date(today);
  end.setDate(today.getDate() + (6 - dayOfWeek));

  const start = new Date(end);
  start.setDate(end.getDate() - weeksToShow * 7 + 1);

  const columns: { date: Date; dateStr: string; level: number; info?: any }[][] = [];
  const monthLabels: { label: string; weekIndex: number }[] = [];

  let lastMonth = -1;

  for (let w = 0; w < weeksToShow; w++) {
    const colStart = new Date(start);
    colStart.setDate(start.getDate() + w * 7);

    const m = colStart.getMonth();
    if (m !== lastMonth && colStart.getDate() <= 7) {
      monthLabels.push({ label: MONTHS[m]!, weekIndex: w });
      lastMonth = m;
    }

    const colDays: { date: Date; dateStr: string; level: number; info?: any }[] = [];
    for (let d = 0; d < 7; d++) {
      const curDate = new Date(colStart);
      curDate.setDate(colStart.getDate() + d);
      const curDateStr = curDate.toISOString().split('T')[0]!;

      const act = aggMap[curDateStr];
      let level = 0;
      if (act) {
        if (act.minutes >= 60) level = 4;
        else if (act.minutes >= 45) level = 3;
        else if (act.minutes >= 30) level = 2;
        else level = 1;
      }

      colDays.push({
        date: curDate,
        dateStr: curDateStr,
        level: curDate > today ? -1 : level, // -1 = future
        info: act,
      });
    }
    columns.push(colDays);
  }

  // Calculate streak from past days
  const allDaysSorted = Object.keys(aggMap).sort();
  let prevDate: Date | null = null;
  for (const dateKey of allDaysSorted) {
    const d = new Date(dateKey);
    if (prevDate) {
      const diffDays = Math.round((d.getTime() - prevDate.getTime()) / (1000 * 3600 * 24));
      if (diffDays === 1) {
        tempStreak++;
      } else if (diffDays > 1) {
        tempStreak = 1;
      }
    } else {
      tempStreak = 1;
    }
    maxStreak = Math.max(maxStreak, tempStreak);
    prevDate = d;
  }

  // Check if streak is active today or yesterday
  const yesterday = new Date(today);
  yesterday.setDate(today.getDate() - 1);
  const yesterdayStr = yesterday.toISOString().split('T')[0]!;
  if (aggMap[todayStr] || aggMap[yesterdayStr]) {
    currentStreak = tempStreak;
  }

  const LEVEL_BG: Record<number, string> = {
    [-1]: 'transparent',
    0: 'oklch(0.15 0.005 250)',
    1: 'oklch(0.38 0.1 110)',
    2: 'oklch(0.55 0.18 110)',
    3: 'oklch(0.75 0.22 110)',
    4: 'oklch(0.92 0.25 110)',
  };

  return (
    <div
      style={{
        background: 'oklch(0.1 0.004 250)',
        border: '1px solid oklch(0.22 0.005 250)',
        borderRadius: 16,
        padding: '20px',
      }}
    >
      {/* Header & Stats Banner */}
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 16 }}>
        <div>
          <h3 style={{ margin: 0, fontSize: 16, fontWeight: 700 }}>Training Consistency</h3>
          <p style={{ margin: '2px 0 0', fontSize: 12, color: 'oklch(0.63 0.006 250)' }}>
            {Object.keys(aggMap).length} active training days recorded
          </p>
        </div>

        <div style={{ display: 'flex', gap: 16 }}>
          <div style={{ textAlign: 'right' }}>
            <span style={{ fontSize: 10, color: 'oklch(0.5 0.01 250)', textTransform: 'uppercase', fontWeight: 600 }}>
              Current Streak
            </span>
            <div style={{ fontSize: 18, fontWeight: 800, color: 'oklch(0.92 0.25 110)' }}>
              🔥 {currentStreak} {currentStreak === 1 ? 'day' : 'days'}
            </div>
          </div>
          <div style={{ textAlign: 'right' }}>
            <span style={{ fontSize: 10, color: 'oklch(0.5 0.01 250)', textTransform: 'uppercase', fontWeight: 600 }}>
              Best Streak
            </span>
            <div style={{ fontSize: 18, fontWeight: 800, color: 'white' }}>
              ⭐ {maxStreak} {maxStreak === 1 ? 'day' : 'days'}
            </div>
          </div>
        </div>
      </div>

      {/* Grid Container */}
      <div
        ref={containerRef}
        style={{
          overflowX: 'auto',
          paddingBottom: 8,
        }}
      >
        <div style={{ display: 'inline-flex', flexDirection: 'column', gap: 4, minWidth: '100%' }}>
          {/* Month Labels */}
          <div style={{ display: 'flex', height: 16, marginLeft: 28 }}>
            {columns.map((_, i) => {
              const m = monthLabels.find((ml) => ml.weekIndex === i);
              return (
                <div
                  key={i}
                  style={{
                    width: 14,
                    marginRight: 3,
                    fontSize: 10,
                    fontWeight: 600,
                    color: 'oklch(0.5 0.01 250)',
                  }}
                >
                  {m ? m.label : ''}
                </div>
              );
            })}
          </div>

          {/* Grid with Day Labels */}
          <div style={{ display: 'flex', gap: 6, alignItems: 'flex-start' }}>
            {/* Day Labels (Mon, Wed, Fri) */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: 3, width: 22 }}>
              {DAYS.map((d, i) => (
                <div
                  key={d}
                  style={{
                    height: 14,
                    fontSize: 9,
                    fontWeight: 600,
                    color: i % 2 === 0 ? 'oklch(0.5 0.01 250)' : 'transparent',
                    lineHeight: '14px',
                  }}
                >
                  {d[0]}
                </div>
              ))}
            </div>

            {/* Columns */}
            <div style={{ display: 'flex', gap: 3 }}>
              {columns.map((col, cIdx) => (
                <div key={cIdx} style={{ display: 'flex', flexDirection: 'column', gap: 3 }}>
                  {col.map((cell, rIdx) => {
                    const isToday = cell.dateStr === todayStr;
                    const bg = LEVEL_BG[cell.level] || LEVEL_BG[0];
                    const tooltip = cell.info
                      ? `${cell.dateStr}: ${cell.info.count} workout (${cell.info.minutes} mins)`
                      : cell.dateStr;

                    return (
                      <div
                        key={rIdx}
                        title={tooltip}
                        onClick={() => cell.level > 0 && onSelectDate?.(cell.dateStr)}
                        style={{
                          width: 14,
                          height: 14,
                          borderRadius: 3,
                          background: bg,
                          border: isToday ? '1.5px solid #ffffff' : 'none',
                          cursor: cell.level > 0 ? 'pointer' : 'default',
                          transition: 'transform 0.15s, filter 0.15s',
                        }}
                      />
                    );
                  })}
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Legend */}
      <div
        style={{
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'flex-end',
          gap: 6,
          marginTop: 12,
          fontSize: 11,
          color: 'oklch(0.5 0.01 250)',
        }}
      >
        <span>Less</span>
        <div style={{ width: 10, height: 10, borderRadius: 2, background: LEVEL_BG[0] }} />
        <div style={{ width: 10, height: 10, borderRadius: 2, background: LEVEL_BG[1] }} />
        <div style={{ width: 10, height: 10, borderRadius: 2, background: LEVEL_BG[2] }} />
        <div style={{ width: 10, height: 10, borderRadius: 2, background: LEVEL_BG[3] }} />
        <div style={{ width: 10, height: 10, borderRadius: 2, background: LEVEL_BG[4] }} />
        <span>More</span>
      </div>
    </div>
  );
}
