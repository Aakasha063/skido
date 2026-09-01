export interface TaxonomyData {
  muscles: string[];
  regions: string[];
  movement_patterns: string[];
  equipment_items: string[];
  exercises: { slug: string; name: string; canonical_name: string }[];
}

export interface ImportMetrics {
  total_imported: number;
  new_canonical: number;
  duplicates: number;
  definite_matches: number;
  probable_matches: number;
  possible_matches: number;
  ambiguous_records: number;
  rejected_records: number;
  missing_muscles: number;
  missing_movements: number;
  missing_equipment: number;
  missing_goals: number;
  missing_characteristics: number;
  missing_provenance: number;
  validation_failures: number;
  activated_exercises: number;
  require_manual_review: number;
}

export function processBatch(rawCandidates: any[], taxonomy: TaxonomyData): { metrics: ImportMetrics; processed: any[] } {
  const metrics: ImportMetrics = {
    total_imported: rawCandidates.length,
    new_canonical: 0,
    duplicates: 0,
    definite_matches: 0,
    probable_matches: 0,
    possible_matches: 0,
    ambiguous_records: 0,
    rejected_records: 0,
    missing_muscles: 0,
    missing_movements: 0,
    missing_equipment: 0,
    missing_goals: 0,
    missing_characteristics: 0,
    missing_provenance: 0,
    validation_failures: 0,
    activated_exercises: 0,
    require_manual_review: 0
  };

  const processed = [];

  for (const raw of rawCandidates) {
    let status = 'pending';
    let dedupConfidence = 'none';
    let matchedId = null;
    let validationErrors: string[] = [];

    const ex = raw.exercise;
    
    // Normalize
    status = 'normalized';

    // Deduplicate
    const exactSlugMatch = taxonomy.exercises.find(e => e.slug === ex.slug);
    const nameMatch = taxonomy.exercises.find(e => e.name.toLowerCase() === ex.name.toLowerCase());
    const canonMatch = taxonomy.exercises.filter(e => e.canonical_name === ex.canonical_name);

    if (exactSlugMatch || nameMatch) {
      dedupConfidence = 'definite';
      metrics.definite_matches++;
      matchedId = exactSlugMatch?.slug || nameMatch?.slug;
    } else if (canonMatch.length > 0) {
      // It shares a canonical family, might just be a variation, but flag as probable/possible depending on equipment
      dedupConfidence = 'probable';
      metrics.probable_matches++;
    } else {
      metrics.new_canonical++;
    }

    if (dedupConfidence !== 'none') {
      metrics.duplicates++;
    }

    status = 'deduplicated';

    // Mapped (Taxonomy check)
    let hasMappingError = false;
    for (const m of raw.muscles || []) {
      if (!taxonomy.muscles.includes(m.muscle_id)) {
        validationErrors.push(`Missing muscle: ${m.muscle_id}`);
        metrics.missing_muscles++;
        hasMappingError = true;
      }
      if (m.region_id && !taxonomy.regions.includes(m.region_id)) {
        validationErrors.push(`Missing region: ${m.region_id}`);
        hasMappingError = true;
      }
    }

    for (const mp of raw.movement_patterns || []) {
      if (!taxonomy.movement_patterns.includes(mp.movement_pattern_id)) {
        validationErrors.push(`Missing movement pattern: ${mp.movement_pattern_id}`);
        metrics.missing_movements++;
        hasMappingError = true;
      }
    }

    for (const eq of raw.equipment || []) {
      if (!taxonomy.equipment_items.includes(eq.equipment_id)) {
        // Special case for bodyweight
        if (eq.equipment_id !== 'bodyweight') {
          validationErrors.push(`Missing equipment: ${eq.equipment_id}`);
          metrics.missing_equipment++;
          hasMappingError = true;
        }
      }
    }

    if (!hasMappingError) status = 'mapped';

    // Validated (Metadata check)
    if (!raw.characteristics || !raw.characteristics.difficulty_level) {
      validationErrors.push('Missing characteristics');
      metrics.missing_characteristics++;
    }

    if (!raw.goal_suitability || raw.goal_suitability.length < 9) {
      validationErrors.push('Missing goal suitability data for all 9 goals');
      metrics.missing_goals++;
    }

    if (!raw.provenance || !raw.provenance.source_type) {
      validationErrors.push('Missing provenance');
      metrics.missing_provenance++;
    }

    if (validationErrors.length > 0) {
      status = 'rejected';
      metrics.validation_failures++;
      metrics.rejected_records++;
    } else if (dedupConfidence !== 'none') {
      status = 'review';
      metrics.require_manual_review++;
    } else {
      status = 'accepted';
      metrics.activated_exercises++;
    }

    processed.push({
      slug: ex.slug,
      status,
      dedupConfidence,
      matchedId,
      validationErrors
    });
  }

  return { metrics, processed };
}
