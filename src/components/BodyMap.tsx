import React, { useState } from 'react';
import { MUSCLES, INERT, MuscleSlug, MUSCLE_DISPLAY_NAMES } from '@/lib/muscles';
import BODY_PATHS from '@/lib/body-paths';

interface BodyMapProps {
  levels?: Partial<Record<MuscleSlug, number>>; // 0 to 4
  selectedMuscle?: MuscleSlug | null;
  onSelectMuscle?: (muscle: MuscleSlug, name: string) => void;
  viewMode?: 'both' | 'front' | 'back';
  size?: 'sm' | 'md' | 'lg';
}

const LEVEL_COLORS: Record<number, string> = {
  0: 'oklch(0.2 0.005 250)', // Dark unworked muscle
  1: 'oklch(0.4 0.08 110)',  // Level 1 low
  2: 'oklch(0.6 0.15 110)',  // Level 2 medium
  3: 'oklch(0.78 0.22 110)', // Level 3 high
  4: 'oklch(0.92 0.25 110)', // Level 4 max
};

export function BodyMap({
  levels = {},
  selectedMuscle,
  onSelectMuscle,
  viewMode: initialViewMode = 'both',
  size = 'md',
}: BodyMapProps) {
  const [hovered, setHovered] = useState<MuscleSlug | null>(null);
  const [activeSide, setActiveSide] = useState<'front' | 'back' | 'both'>(
    size === 'sm' ? 'front' : initialViewMode
  );

  const paths = (BODY_PATHS as any)?.default || BODY_PATHS;
  const frontView = paths?.body?.front;
  const backView = paths?.body?.back;

  if (!frontView || !backView) {
    return (
      <div style={{ height: 160, display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'oklch(0.5 0.01 250)', fontSize: 13 }}>
        Loading Muscle Model...
      </div>
    );
  }

  const activeMuscle = hovered || selectedMuscle;
  const maxW = size === 'sm' ? 120 : size === 'lg' ? 240 : 160;

  function renderSvgView(view: any, isBack = false) {
    return (
      <svg
        viewBox={view.vb}
        style={{
          width: '100%',
          maxWidth: maxW,
          height: 'auto',
          aspectRatio: '1 / 1.55',
          overflow: 'visible',
          filter: 'drop-shadow(0 4px 10px rgba(0,0,0,0.5))',
        }}
      >
        {/* Inert base silhouette (head, feet, hands, neck) */}
        {INERT.map((slug) =>
          (view.p[slug] || []).map((d: string, i: number) => (
            <path
              key={`inert-${slug}-${i}`}
              d={d}
              fill="oklch(0.15 0.004 250)"
              stroke="oklch(0.22 0.005 250)"
              strokeWidth="1"
            />
          ))
        )}

        {/* Interactive Muscle Groups */}
        {MUSCLES.map((slug) => {
          const musclePaths = view.p[slug] || [];
          if (musclePaths.length === 0) return null;

          const level = levels[slug] || 0;
          const isSelected = selectedMuscle === slug;
          const isHovered = hovered === slug;
          const isHighlighted = isSelected || isHovered;

          let fill = LEVEL_COLORS[level] || LEVEL_COLORS[0];
          if (isSelected) {
            fill = 'oklch(0.92 0.25 110)'; // Electric lime highlight
          } else if (isHovered) {
            fill = 'oklch(0.78 0.22 110)';
          }

          return musclePaths.map((d: string, i: number) => (
            <path
              key={`muscle-${slug}-${i}`}
              d={d}
              fill={fill}
              stroke={isHighlighted ? 'oklch(0.95 0.2 110)' : 'oklch(0.28 0.006 250)'}
              strokeWidth={isHighlighted ? '1.5' : '0.8'}
              style={{
                cursor: onSelectMuscle ? 'pointer' : 'default',
                transition: 'all 0.15s ease',
              }}
              onMouseEnter={() => setHovered(slug)}
              onMouseLeave={() => setHovered(null)}
              onClick={() => {
                if (onSelectMuscle) {
                  onSelectMuscle(slug, MUSCLE_DISPLAY_NAMES[slug] || slug);
                }
              }}
            />
          ));
        })}
      </svg>
    );
  }

  return (
    <div
      style={{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        background: 'oklch(0.08 0.004 250)',
        border: '1px solid oklch(0.2 0.005 250)',
        borderRadius: 12,
        padding: '12px 10px',
        width: '100%',
        boxSizing: 'border-box',
      }}
    >
      {/* Top Bar: Active Label & Front/Back Switcher */}
      <div
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          width: '100%',
          marginBottom: 10,
          gap: 8,
        }}
      >
        <div style={{ minWidth: 0, flex: 1 }}>
          {activeMuscle ? (
            <span
              style={{
                fontSize: 12,
                fontWeight: 700,
                color: 'oklch(0.92 0.25 110)',
                background: 'oklch(0.92 0.25 110 / 15%)',
                padding: '2px 8px',
                borderRadius: 6,
                display: 'inline-block',
                whiteSpace: 'nowrap',
                overflow: 'hidden',
                textOverflow: 'ellipsis',
                maxWidth: '100%',
              }}
            >
              {MUSCLE_DISPLAY_NAMES[activeMuscle]}
            </span>
          ) : (
            <span style={{ fontSize: 11, color: 'oklch(0.55 0.01 250)' }}>
              {onSelectMuscle ? 'Tap a muscle to filter' : 'Muscle Workload'}
            </span>
          )}
        </div>

        {/* View Switcher Chips for Mobile */}
        <div style={{ display: 'flex', gap: 4, flexShrink: 0 }}>
          {(['front', 'back', 'both'] as const).map((side) => {
            const isCurr = activeSide === side;
            return (
              <button
                key={side}
                onClick={() => setActiveSide(side)}
                style={{
                  fontSize: 10,
                  fontWeight: 700,
                  textTransform: 'capitalize',
                  padding: '2px 7px',
                  borderRadius: 4,
                  border: 'none',
                  background: isCurr ? 'oklch(0.92 0.25 110)' : 'oklch(0.16 0.005 250)',
                  color: isCurr ? 'oklch(0.07 0.01 110)' : 'oklch(0.65 0.01 250)',
                  cursor: 'pointer',
                }}
              >
                {side}
              </button>
            );
          })}
        </div>
      </div>

      {/* SVG Figures */}
      <div
        style={{
          display: 'flex',
          gap: 16,
          justifyContent: 'center',
          alignItems: 'center',
          width: '100%',
        }}
      >
        {(activeSide === 'both' || activeSide === 'front') && (
          <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', flex: 1, maxWidth: maxW }}>
            <span style={{ fontSize: 9.5, fontWeight: 700, color: 'oklch(0.45 0.006 250)', textTransform: 'uppercase', marginBottom: 2 }}>
              Front
            </span>
            {renderSvgView(frontView, false)}
          </div>
        )}

        {(activeSide === 'both' || activeSide === 'back') && (
          <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', flex: 1, maxWidth: maxW }}>
            <span style={{ fontSize: 9.5, fontWeight: 700, color: 'oklch(0.45 0.006 250)', textTransform: 'uppercase', marginBottom: 2 }}>
              Back
            </span>
            {renderSvgView(backView, true)}
          </div>
        )}
      </div>
    </div>
  );
}
