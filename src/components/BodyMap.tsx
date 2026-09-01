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
  viewMode = 'both',
  size = 'md',
}: BodyMapProps) {
  const [hovered, setHovered] = useState<MuscleSlug | null>(null);

  const paths = (BODY_PATHS as any)?.default || BODY_PATHS;
  const frontView = paths?.body?.front;
  const backView = paths?.body?.back;

  if (!frontView || !backView) {
    return <div style={{ height: 200, display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'oklch(0.5 0.01 250)' }}>Loading Body Model...</div>;
  }

  const activeMuscle = hovered || selectedMuscle;
  const scale = size === 'sm' ? 140 : size === 'lg' ? 260 : 190;

  function renderSvgView(view: any, isBack = false) {
    return (
      <svg
        viewBox={view.vb}
        style={{
          width: scale,
          height: scale * 1.55,
          overflow: 'visible',
          filter: 'drop-shadow(0 4px 12px rgba(0,0,0,0.5))',
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

          let fill = LEVEL_COLORS[level] || LEVEL_COLORS[0];
          if (isSelected) fill = 'oklch(0.92 0.25 110)';
          else if (isHovered) fill = 'oklch(0.85 0.2 110)';

          return musclePaths.map((d: string, i: number) => (
            <path
              key={`muscle-${slug}-${i}`}
              d={d}
              fill={fill}
              stroke={isSelected || isHovered ? '#ffffff' : 'oklch(0.1 0.004 250)'}
              strokeWidth={isSelected || isHovered ? '2' : '1'}
              style={{
                cursor: onSelectMuscle ? 'pointer' : 'default',
                transition: 'fill 0.2s, stroke 0.2s, filter 0.2s',
                filter: isSelected ? 'drop-shadow(0 0 6px oklch(0.92 0.25 110 / 80%))' : undefined,
              }}
              onMouseEnter={() => setHovered(slug)}
              onMouseLeave={() => setHovered(null)}
              onClick={() => onSelectMuscle?.(slug, MUSCLE_DISPLAY_NAMES[slug])}
            />
          ));
        })}
      </svg>
    );
  }

  return (
    <div
      style={{
        background: 'oklch(0.1 0.004 250)',
        border: '1px solid oklch(0.22 0.005 250)',
        borderRadius: 16,
        padding: '16px 20px',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}
    >
      {/* Active Muscle Display Banner */}
      <div style={{ minHeight: 24, marginBottom: 8, textAlign: 'center' }}>
        {activeMuscle ? (
          <span
            style={{
              fontSize: 12,
              fontWeight: 700,
              color: 'oklch(0.92 0.25 110)',
              background: 'oklch(0.92 0.25 110 / 15%)',
              padding: '3px 10px',
              borderRadius: 999,
              letterSpacing: '0.02em',
            }}
          >
            {MUSCLE_DISPLAY_NAMES[activeMuscle]}
          </span>
        ) : (
          <span style={{ fontSize: 11, color: 'oklch(0.5 0.01 250)' }}>
            {onSelectMuscle ? 'Tap any muscle on the model to select' : 'Muscle Workload Distribution'}
          </span>
        )}
      </div>

      {/* SVG Models */}
      <div style={{ display: 'flex', gap: 24, justifyContent: 'center', alignItems: 'center' }}>
        {(viewMode === 'both' || viewMode === 'front') && (
          <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <span style={{ fontSize: 10, fontWeight: 600, color: 'oklch(0.45 0.006 250)', textTransform: 'uppercase', marginBottom: 4 }}>
              Front
            </span>
            {renderSvgView(frontView, false)}
          </div>
        )}

        {(viewMode === 'both' || viewMode === 'back') && (
          <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <span style={{ fontSize: 10, fontWeight: 600, color: 'oklch(0.45 0.006 250)', textTransform: 'uppercase', marginBottom: 4 }}>
              Back
            </span>
            {renderSvgView(backView, true)}
          </div>
        )}
      </div>
    </div>
  );
}
