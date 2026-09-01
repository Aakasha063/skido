export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.5"
  }
  graphql_public: {
    Tables: {
      [_ in never]: never
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      graphql: {
        Args: {
          extensions?: Json
          operationName?: string
          query?: string
          variables?: Json
        }
        Returns: Json
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
  public: {
    Tables: {
      body_metrics: {
        Row: {
          arm_cm: number | null
          body_fat_percent: number | null
          chest_cm: number | null
          created_at: string
          height_cm: number | null
          hip_cm: number | null
          id: string
          measured_on: string
          neck_cm: number | null
          notes: string | null
          target_calories: number | null
          thigh_cm: number | null
          updated_at: string
          user_id: string
          waist_cm: number | null
          weight_kg: number | null
        }
        Insert: {
          arm_cm?: number | null
          body_fat_percent?: number | null
          chest_cm?: number | null
          created_at?: string
          height_cm?: number | null
          hip_cm?: number | null
          id?: string
          measured_on?: string
          neck_cm?: number | null
          notes?: string | null
          target_calories?: number | null
          thigh_cm?: number | null
          updated_at?: string
          user_id: string
          waist_cm?: number | null
          weight_kg?: number | null
        }
        Update: {
          arm_cm?: number | null
          body_fat_percent?: number | null
          chest_cm?: number | null
          created_at?: string
          height_cm?: number | null
          hip_cm?: number | null
          id?: string
          measured_on?: string
          neck_cm?: number | null
          notes?: string | null
          target_calories?: number | null
          thigh_cm?: number | null
          updated_at?: string
          user_id?: string
          waist_cm?: number | null
          weight_kg?: number | null
        }
        Relationships: []
      }
      cardio_sessions: {
        Row: {
          avg_heart_rate: number | null
          cardio_type: string
          created_at: string
          distance_km: number | null
          duration_minutes: number | null
          id: string
          incline_percent: number | null
          notes: string | null
          performed_on: string
          rounds: number | null
          session_id: string | null
          speed_kph: number | null
          user_id: string
        }
        Insert: {
          avg_heart_rate?: number | null
          cardio_type: string
          created_at?: string
          distance_km?: number | null
          duration_minutes?: number | null
          id?: string
          incline_percent?: number | null
          notes?: string | null
          performed_on?: string
          rounds?: number | null
          session_id?: string | null
          speed_kph?: number | null
          user_id: string
        }
        Update: {
          avg_heart_rate?: number | null
          cardio_type?: string
          created_at?: string
          distance_km?: number | null
          duration_minutes?: number | null
          id?: string
          incline_percent?: number | null
          notes?: string | null
          performed_on?: string
          rounds?: number | null
          session_id?: string | null
          speed_kph?: number | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "cardio_sessions_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: false
            referencedRelation: "workout_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      constraint_types: {
        Row: {
          body_region: string | null
          created_at: string
          description: string | null
          id: string
          name: string
        }
        Insert: {
          body_region?: string | null
          created_at?: string
          description?: string | null
          id: string
          name: string
        }
        Update: {
          body_region?: string | null
          created_at?: string
          description?: string | null
          id?: string
          name?: string
        }
        Relationships: []
      }
      equipment_items: {
        Row: {
          category: string
          created_at: string
          id: string
          name: string
        }
        Insert: {
          category: string
          created_at?: string
          id: string
          name: string
        }
        Update: {
          category?: string
          created_at?: string
          id?: string
          name?: string
        }
        Relationships: []
      }
      exercise_aliases: {
        Row: {
          alias: string
          created_at: string
          exercise_id: string
          id: string
          language: string
          normalized_alias: string
        }
        Insert: {
          alias: string
          created_at?: string
          exercise_id: string
          id?: string
          language?: string
          normalized_alias: string
        }
        Update: {
          alias?: string
          created_at?: string
          exercise_id?: string
          id?: string
          language?: string
          normalized_alias?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_aliases_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_characteristics: {
        Row: {
          created_at: string
          difficulty_level: string
          exercise_id: string
          lengthened_emphasis: boolean
          loadability: number
          rating_confidence: string
          rating_scale_notes: string | null
          rating_source: string | null
          resistance_profile: string
          stimulus_to_fatigue: number
          technical_demand: number
          unilateral: boolean
          updated_at: string
        }
        Insert: {
          created_at?: string
          difficulty_level: string
          exercise_id: string
          lengthened_emphasis?: boolean
          loadability: number
          rating_confidence?: string
          rating_scale_notes?: string | null
          rating_source?: string | null
          resistance_profile: string
          stimulus_to_fatigue: number
          technical_demand: number
          unilateral?: boolean
          updated_at?: string
        }
        Update: {
          created_at?: string
          difficulty_level?: string
          exercise_id?: string
          lengthened_emphasis?: boolean
          loadability?: number
          rating_confidence?: string
          rating_scale_notes?: string | null
          rating_source?: string | null
          resistance_profile?: string
          stimulus_to_fatigue?: number
          technical_demand?: number
          unilateral?: boolean
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_characteristics_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: true
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_constraints: {
        Row: {
          compatibility: string
          constraint_type_id: string
          exercise_id: string
          notes: string | null
        }
        Insert: {
          compatibility: string
          constraint_type_id: string
          exercise_id: string
          notes?: string | null
        }
        Update: {
          compatibility?: string
          constraint_type_id?: string
          exercise_id?: string
          notes?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "exercise_constraints_constraint_type_id_fkey"
            columns: ["constraint_type_id"]
            isOneToOne: false
            referencedRelation: "constraint_types"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_constraints_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_data_sources: {
        Row: {
          confidence: string
          created_at: string
          exercise_id: string
          field_scope: string
          id: string
          notes: string | null
          reviewed_at: string | null
          reviewed_by: string | null
          source_name: string | null
          source_type: string
          source_url: string | null
        }
        Insert: {
          confidence: string
          created_at?: string
          exercise_id: string
          field_scope: string
          id?: string
          notes?: string | null
          reviewed_at?: string | null
          reviewed_by?: string | null
          source_name?: string | null
          source_type: string
          source_url?: string | null
        }
        Update: {
          confidence?: string
          created_at?: string
          exercise_id?: string
          field_scope?: string
          id?: string
          notes?: string | null
          reviewed_at?: string | null
          reviewed_by?: string | null
          source_name?: string | null
          source_type?: string
          source_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "exercise_data_sources_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_equipment: {
        Row: {
          equipment_id: string
          exercise_id: string
          is_required: boolean
        }
        Insert: {
          equipment_id: string
          exercise_id: string
          is_required?: boolean
        }
        Update: {
          equipment_id?: string
          exercise_id?: string
          is_required?: boolean
        }
        Relationships: [
          {
            foreignKeyName: "exercise_equipment_equipment_id_fkey"
            columns: ["equipment_id"]
            isOneToOne: false
            referencedRelation: "equipment_items"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_equipment_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_goal_suitability: {
        Row: {
          exercise_id: string
          goal_id: string
          rationale: string | null
          score: number
        }
        Insert: {
          exercise_id: string
          goal_id: string
          rationale?: string | null
          score: number
        }
        Update: {
          exercise_id?: string
          goal_id?: string
          rationale?: string | null
          score?: number
        }
        Relationships: [
          {
            foreignKeyName: "exercise_goal_suitability_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_goal_suitability_goal_id_fkey"
            columns: ["goal_id"]
            isOneToOne: false
            referencedRelation: "goals"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_imports: {
        Row: {
          candidate_slug: string | null
          created_at: string
          dedup_confidence: string | null
          dedup_reason: string | null
          id: string
          imported_by: string | null
          matched_exercise_id: string | null
          raw_data: Json
          reviewed_at: string | null
          reviewed_by: string | null
          status: string
          updated_at: string
          validation_errors: Json | null
        }
        Insert: {
          candidate_slug?: string | null
          created_at?: string
          dedup_confidence?: string | null
          dedup_reason?: string | null
          id?: string
          imported_by?: string | null
          matched_exercise_id?: string | null
          raw_data: Json
          reviewed_at?: string | null
          reviewed_by?: string | null
          status: string
          updated_at?: string
          validation_errors?: Json | null
        }
        Update: {
          candidate_slug?: string | null
          created_at?: string
          dedup_confidence?: string | null
          dedup_reason?: string | null
          id?: string
          imported_by?: string | null
          matched_exercise_id?: string | null
          raw_data?: Json
          reviewed_at?: string | null
          reviewed_by?: string | null
          status?: string
          updated_at?: string
          validation_errors?: Json | null
        }
        Relationships: [
          {
            foreignKeyName: "exercise_imports_matched_exercise_id_fkey"
            columns: ["matched_exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_movements: {
        Row: {
          exercise_id: string
          is_primary: boolean
          movement_pattern_id: string
        }
        Insert: {
          exercise_id: string
          is_primary?: boolean
          movement_pattern_id: string
        }
        Update: {
          exercise_id?: string
          is_primary?: boolean
          movement_pattern_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_movements_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_movements_movement_pattern_id_fkey"
            columns: ["movement_pattern_id"]
            isOneToOne: false
            referencedRelation: "movement_patterns"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_muscles: {
        Row: {
          exercise_id: string
          id: string
          muscle_id: string
          region_id: string | null
          role: string
        }
        Insert: {
          exercise_id: string
          id?: string
          muscle_id: string
          region_id?: string | null
          role: string
        }
        Update: {
          exercise_id?: string
          id?: string
          muscle_id?: string
          region_id?: string | null
          role?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_muscles_v2_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_muscles_v2_muscle_id_fkey"
            columns: ["muscle_id"]
            isOneToOne: false
            referencedRelation: "muscles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "fk_muscle_region"
            columns: ["muscle_id", "region_id"]
            isOneToOne: false
            referencedRelation: "muscle_regions"
            referencedColumns: ["muscle_id", "id"]
          },
        ]
      }
      exercise_muscles_legacy: {
        Row: {
          exercise_id: string
          muscle_group_id: string
          role: string
        }
        Insert: {
          exercise_id: string
          muscle_group_id: string
          role: string
        }
        Update: {
          exercise_id?: string
          muscle_group_id?: string
          role?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_muscles_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_muscles_muscle_group_id_fkey"
            columns: ["muscle_group_id"]
            isOneToOne: false
            referencedRelation: "muscle_groups"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_notes: {
        Row: {
          created_at: string
          exercise_id: string
          id: string
          note: string
          updated_at: string
          user_id: string
        }
        Insert: {
          created_at?: string
          exercise_id: string
          id?: string
          note: string
          updated_at?: string
          user_id: string
        }
        Update: {
          created_at?: string
          exercise_id?: string
          id?: string
          note?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_notes_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_sessions: {
        Row: {
          completed: boolean
          created_at: string
          exercise_id: string
          id: string
          notes: string | null
          position: number
          session_id: string
          target_rep_range: string | null
          target_sets: number | null
          user_id: string
          workout_exercise_id: string | null
        }
        Insert: {
          completed?: boolean
          created_at?: string
          exercise_id: string
          id?: string
          notes?: string | null
          position?: number
          session_id: string
          target_rep_range?: string | null
          target_sets?: number | null
          user_id: string
          workout_exercise_id?: string | null
        }
        Update: {
          completed?: boolean
          created_at?: string
          exercise_id?: string
          id?: string
          notes?: string | null
          position?: number
          session_id?: string
          target_rep_range?: string | null
          target_sets?: number | null
          user_id?: string
          workout_exercise_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "exercise_sessions_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_sessions_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: false
            referencedRelation: "workout_sessions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_sessions_workout_exercise_id_fkey"
            columns: ["workout_exercise_id"]
            isOneToOne: false
            referencedRelation: "workout_exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_substitutions: {
        Row: {
          exercise_id: string
          reason: string | null
          similarity_score: number
          substitute_id: string
          substitution_type: string
        }
        Insert: {
          exercise_id: string
          reason?: string | null
          similarity_score: number
          substitute_id: string
          substitution_type: string
        }
        Update: {
          exercise_id?: string
          reason?: string | null
          similarity_score?: number
          substitute_id?: string
          substitution_type?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_substitutions_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "exercise_substitutions_substitute_id_fkey"
            columns: ["substitute_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercises: {
        Row: {
          aliases: string[] | null
          breathing: string | null
          canonical_name: string | null
          category: string | null
          common_mistakes: string[]
          created_at: string
          cues: string[]
          default_rep_range: string | null
          default_rest_seconds: number | null
          default_rir: string | null
          description: string | null
          equipment: string | null
          execution: string[]
          id: string
          is_compound: boolean
          lower_back_notes: string | null
          name: string
          parent_exercise_id: string | null
          parent_slug: string | null
          primary_muscle: string | null
          secondary_muscles: string[]
          setup: string[]
          should_feel: string | null
          slug: string
          status: string
          updated_at: string
          variation_type: string | null
          gif_url?: string | null
        }
        Insert: {
          aliases?: string[] | null
          breathing?: string | null
          canonical_name?: string | null
          category?: string | null
          common_mistakes?: string[]
          created_at?: string
          cues?: string[]
          default_rep_range?: string | null
          default_rest_seconds?: number | null
          default_rir?: string | null
          description?: string | null
          equipment?: string | null
          execution?: string[]
          id?: string
          is_compound?: boolean
          lower_back_notes?: string | null
          name: string
          parent_exercise_id?: string | null
          parent_slug?: string | null
          primary_muscle?: string | null
          secondary_muscles?: string[]
          setup?: string[]
          should_feel?: string | null
          slug: string
          status?: string
          updated_at?: string
          variation_type?: string | null
          gif_url?: string | null
        }
        Update: {
          aliases?: string[] | null
          breathing?: string | null
          canonical_name?: string | null
          category?: string | null
          common_mistakes?: string[]
          created_at?: string
          cues?: string[]
          default_rep_range?: string | null
          default_rest_seconds?: number | null
          default_rir?: string | null
          description?: string | null
          equipment?: string | null
          execution?: string[]
          id?: string
          is_compound?: boolean
          lower_back_notes?: string | null
          name?: string
          parent_exercise_id?: string | null
          parent_slug?: string | null
          primary_muscle?: string | null
          secondary_muscles?: string[]
          setup?: string[]
          should_feel?: string | null
          slug?: string
          status?: string
          updated_at?: string
          variation_type?: string | null
          gif_url?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "exercises_parent_exercise_id_fkey"
            columns: ["parent_exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      generated_programs: {
        Row: {
          algorithm_version_id: string
          created_at: string
          generation_snapshot: Json
          id: string
          name: string
          primary_goal_id: string
          profile_id: string
          secondary_goal_id: string | null
          status: string
          updated_at: string
        }
        Insert: {
          algorithm_version_id: string
          created_at?: string
          generation_snapshot: Json
          id?: string
          name: string
          primary_goal_id: string
          profile_id: string
          secondary_goal_id?: string | null
          status?: string
          updated_at?: string
        }
        Update: {
          algorithm_version_id?: string
          created_at?: string
          generation_snapshot?: Json
          id?: string
          name?: string
          primary_goal_id?: string
          profile_id?: string
          secondary_goal_id?: string | null
          status?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "generated_programs_algorithm_version_id_fkey"
            columns: ["algorithm_version_id"]
            isOneToOne: false
            referencedRelation: "programming_algorithm_versions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "generated_programs_primary_goal_id_fkey"
            columns: ["primary_goal_id"]
            isOneToOne: false
            referencedRelation: "goals"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "generated_programs_profile_id_fkey"
            columns: ["profile_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "generated_programs_secondary_goal_id_fkey"
            columns: ["secondary_goal_id"]
            isOneToOne: false
            referencedRelation: "goals"
            referencedColumns: ["id"]
          },
        ]
      }
      goals: {
        Row: {
          created_at: string
          description: string | null
          id: string
          name: string
          priority_order: number | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          id: string
          name: string
          priority_order?: number | null
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          priority_order?: number | null
        }
        Relationships: []
      }
      movement_patterns: {
        Row: {
          created_at: string
          description: string | null
          id: string
          name: string
        }
        Insert: {
          created_at?: string
          description?: string | null
          id: string
          name: string
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: string
          name?: string
        }
        Relationships: []
      }
      muscle_groups: {
        Row: {
          body_region: string
          created_at: string
          id: string
          name: string
          parent_id: string | null
        }
        Insert: {
          body_region: string
          created_at?: string
          id: string
          name: string
          parent_id?: string | null
        }
        Update: {
          body_region?: string
          created_at?: string
          id?: string
          name?: string
          parent_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "muscle_groups_parent_id_fkey"
            columns: ["parent_id"]
            isOneToOne: false
            referencedRelation: "muscle_groups"
            referencedColumns: ["id"]
          },
        ]
      }
      muscle_regions: {
        Row: {
          created_at: string
          id: string
          label: string
          muscle_id: string
          name: string
        }
        Insert: {
          created_at?: string
          id: string
          label: string
          muscle_id: string
          name: string
        }
        Update: {
          created_at?: string
          id?: string
          label?: string
          muscle_id?: string
          name?: string
        }
        Relationships: [
          {
            foreignKeyName: "muscle_regions_muscle_id_fkey"
            columns: ["muscle_id"]
            isOneToOne: false
            referencedRelation: "muscles"
            referencedColumns: ["id"]
          },
        ]
      }
      muscles: {
        Row: {
          anatomical_name: string
          body_region: string
          common_name: string | null
          created_at: string
          id: string
        }
        Insert: {
          anatomical_name: string
          body_region: string
          common_name?: string | null
          created_at?: string
          id: string
        }
        Update: {
          anatomical_name?: string
          body_region?: string
          common_name?: string | null
          created_at?: string
          id?: string
        }
        Relationships: []
      }
      personal_records: {
        Row: {
          achieved_on: string
          created_at: string
          estimated_1rm: number | null
          exercise_id: string | null
          id: string
          record_type: string
          reps: number | null
          session_id: string | null
          user_id: string
          volume_kg: number | null
          weight_kg: number | null
        }
        Insert: {
          achieved_on?: string
          created_at?: string
          estimated_1rm?: number | null
          exercise_id?: string | null
          id?: string
          record_type: string
          reps?: number | null
          session_id?: string | null
          user_id: string
          volume_kg?: number | null
          weight_kg?: number | null
        }
        Update: {
          achieved_on?: string
          created_at?: string
          estimated_1rm?: number | null
          exercise_id?: string | null
          id?: string
          record_type?: string
          reps?: number | null
          session_id?: string | null
          user_id?: string
          volume_kg?: number | null
          weight_kg?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "personal_records_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "personal_records_session_id_fkey"
            columns: ["session_id"]
            isOneToOne: false
            referencedRelation: "workout_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      profile_constraints: {
        Row: {
          active: boolean
          constraint_type_id: string
          created_at: string
          id: string
          notes: string | null
          onset_date: string | null
          profile_id: string
          severity: string
          updated_at: string
        }
        Insert: {
          active?: boolean
          constraint_type_id: string
          created_at?: string
          id?: string
          notes?: string | null
          onset_date?: string | null
          profile_id: string
          severity: string
          updated_at?: string
        }
        Update: {
          active?: boolean
          constraint_type_id?: string
          created_at?: string
          id?: string
          notes?: string | null
          onset_date?: string | null
          profile_id?: string
          severity?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "profile_constraints_constraint_type_id_fkey"
            columns: ["constraint_type_id"]
            isOneToOne: false
            referencedRelation: "constraint_types"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "profile_constraints_profile_id_fkey"
            columns: ["profile_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profile_equipment: {
        Row: {
          equipment_id: string
          profile_id: string
        }
        Insert: {
          equipment_id: string
          profile_id: string
        }
        Update: {
          equipment_id?: string
          profile_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "profile_equipment_equipment_id_fkey"
            columns: ["equipment_id"]
            isOneToOne: false
            referencedRelation: "equipment_items"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "profile_equipment_profile_id_fkey"
            columns: ["profile_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profiles: {
        Row: {
          activity_level: number | null
          avatar_color: string | null
          avatar_url: string | null
          created_at: string
          current_weight_kg: number | null
          date_of_birth: string | null
          gym_days_per_week: number | null
          height_cm: number | null
          id: string
          length_unit: string
          name: string | null
          onboarding_completed: boolean
          past_injuries: string | null
          plan_start_date: string | null
          preferred_cardio: string | null
          primary_goal: string | null
          reminders_enabled: boolean
          rest_timer_seconds: number
          sex: string | null
          starting_weight_kg: number | null
          target_body_fat: number | null
          target_weight_kg: number | null
          theme: string
          training_experience: string | null
          updated_at: string
          weight_unit: string
        }
        Insert: {
          activity_level?: number | null
          avatar_color?: string | null
          avatar_url?: string | null
          created_at?: string
          current_weight_kg?: number | null
          date_of_birth?: string | null
          gym_days_per_week?: number | null
          height_cm?: number | null
          id: string
          length_unit?: string
          name?: string | null
          onboarding_completed?: boolean
          past_injuries?: string | null
          plan_start_date?: string | null
          preferred_cardio?: string | null
          primary_goal?: string | null
          reminders_enabled?: boolean
          rest_timer_seconds?: number
          sex?: string | null
          starting_weight_kg?: number | null
          target_body_fat?: number | null
          target_weight_kg?: number | null
          theme?: string
          training_experience?: string | null
          updated_at?: string
          weight_unit?: string
        }
        Update: {
          activity_level?: number | null
          avatar_color?: string | null
          avatar_url?: string | null
          created_at?: string
          current_weight_kg?: number | null
          date_of_birth?: string | null
          gym_days_per_week?: number | null
          height_cm?: number | null
          id?: string
          length_unit?: string
          name?: string | null
          onboarding_completed?: boolean
          past_injuries?: string | null
          plan_start_date?: string | null
          preferred_cardio?: string | null
          primary_goal?: string | null
          reminders_enabled?: boolean
          rest_timer_seconds?: number
          sex?: string | null
          starting_weight_kg?: number | null
          target_body_fat?: number | null
          target_weight_kg?: number | null
          theme?: string
          training_experience?: string | null
          updated_at?: string
          weight_unit?: string
        }
        Relationships: []
      }
      program_exercise_sets: {
        Row: {
          created_at: string
          id: string
          load_target_kg: number | null
          load_target_pct_1rm: number | null
          notes: string | null
          program_exercise_id: string
          rep_max: number | null
          rep_min: number | null
          rest_seconds: number | null
          rpe_target: number | null
          set_number: number
        }
        Insert: {
          created_at?: string
          id?: string
          load_target_kg?: number | null
          load_target_pct_1rm?: number | null
          notes?: string | null
          program_exercise_id: string
          rep_max?: number | null
          rep_min?: number | null
          rest_seconds?: number | null
          rpe_target?: number | null
          set_number: number
        }
        Update: {
          created_at?: string
          id?: string
          load_target_kg?: number | null
          load_target_pct_1rm?: number | null
          notes?: string | null
          program_exercise_id?: string
          rep_max?: number | null
          rep_min?: number | null
          rest_seconds?: number | null
          rpe_target?: number | null
          set_number?: number
        }
        Relationships: [
          {
            foreignKeyName: "program_exercise_sets_program_exercise_id_fkey"
            columns: ["program_exercise_id"]
            isOneToOne: false
            referencedRelation: "program_exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      program_exercises: {
        Row: {
          created_at: string
          exercise_id: string
          id: string
          notes: string | null
          order_in_workout: number
          progression_rule_id: string | null
          progression_rule_snapshot: Json | null
          rep_max: number | null
          rep_min: number | null
          rest_seconds: number | null
          rpe_target: number | null
          sets: number | null
          workout_id: string
        }
        Insert: {
          created_at?: string
          exercise_id: string
          id?: string
          notes?: string | null
          order_in_workout: number
          progression_rule_id?: string | null
          progression_rule_snapshot?: Json | null
          rep_max?: number | null
          rep_min?: number | null
          rest_seconds?: number | null
          rpe_target?: number | null
          sets?: number | null
          workout_id: string
        }
        Update: {
          created_at?: string
          exercise_id?: string
          id?: string
          notes?: string | null
          order_in_workout?: number
          progression_rule_id?: string | null
          progression_rule_snapshot?: Json | null
          rep_max?: number | null
          rep_min?: number | null
          rest_seconds?: number | null
          rpe_target?: number | null
          sets?: number | null
          workout_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "program_exercises_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "program_exercises_progression_rule_id_fkey"
            columns: ["progression_rule_id"]
            isOneToOne: false
            referencedRelation: "progression_rules"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "program_exercises_workout_id_fkey"
            columns: ["workout_id"]
            isOneToOne: false
            referencedRelation: "program_workouts"
            referencedColumns: ["id"]
          },
        ]
      }
      program_phases: {
        Row: {
          created_at: string
          id: string
          name: string
          phase_number: number
          program_id: string
          weeks_duration: number
        }
        Insert: {
          created_at?: string
          id?: string
          name: string
          phase_number: number
          program_id: string
          weeks_duration: number
        }
        Update: {
          created_at?: string
          id?: string
          name?: string
          phase_number?: number
          program_id?: string
          weeks_duration?: number
        }
        Relationships: [
          {
            foreignKeyName: "program_phases_program_id_fkey"
            columns: ["program_id"]
            isOneToOne: false
            referencedRelation: "generated_programs"
            referencedColumns: ["id"]
          },
        ]
      }
      program_workouts: {
        Row: {
          created_at: string
          day_number: number
          focus_type: string | null
          id: string
          name: string
          phase_id: string
        }
        Insert: {
          created_at?: string
          day_number: number
          focus_type?: string | null
          id?: string
          name: string
          phase_id: string
        }
        Update: {
          created_at?: string
          day_number?: number
          focus_type?: string | null
          id?: string
          name?: string
          phase_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "program_workouts_phase_id_fkey"
            columns: ["phase_id"]
            isOneToOne: false
            referencedRelation: "program_phases"
            referencedColumns: ["id"]
          },
        ]
      }
      programming_algorithm_versions: {
        Row: {
          config: Json
          created_at: string
          description: string | null
          id: string
          is_active: boolean
        }
        Insert: {
          config: Json
          created_at?: string
          description?: string | null
          id: string
          is_active?: boolean
        }
        Update: {
          config?: Json
          created_at?: string
          description?: string | null
          id?: string
          is_active?: boolean
        }
        Relationships: []
      }
      progression_rules: {
        Row: {
          config: Json
          created_at: string
          description: string | null
          id: string
          name: string
          rule_type: string
          version: number
        }
        Insert: {
          config?: Json
          created_at?: string
          description?: string | null
          id?: string
          name: string
          rule_type: string
          version?: number
        }
        Update: {
          config?: Json
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          rule_type?: string
          version?: number
        }
        Relationships: []
      }
      sets: {
        Row: {
          completed: boolean
          created_at: string
          exercise_id: string
          exercise_session_id: string
          id: string
          is_warmup: boolean
          note: string | null
          performed_at: string
          reps: number | null
          rir: number | null
          set_number: number
          updated_at: string
          user_id: string
          weight_kg: number | null
        }
        Insert: {
          completed?: boolean
          created_at?: string
          exercise_id: string
          exercise_session_id: string
          id?: string
          is_warmup?: boolean
          note?: string | null
          performed_at?: string
          reps?: number | null
          rir?: number | null
          set_number: number
          updated_at?: string
          user_id: string
          weight_kg?: number | null
        }
        Update: {
          completed?: boolean
          created_at?: string
          exercise_id?: string
          exercise_session_id?: string
          id?: string
          is_warmup?: boolean
          note?: string | null
          performed_at?: string
          reps?: number | null
          rir?: number | null
          set_number?: number
          updated_at?: string
          user_id?: string
          weight_kg?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "sets_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "sets_exercise_session_id_fkey"
            columns: ["exercise_session_id"]
            isOneToOne: false
            referencedRelation: "exercise_sessions"
            referencedColumns: ["id"]
          },
        ]
      }
      user_exercise_replacements: {
        Row: {
          created_at: string | null
          id: string
          original_exercise_id: string
          reason: string | null
          replacement_exercise_id: string
          user_id: string
          workout_exercise_id: string
        }
        Insert: {
          created_at?: string | null
          id?: string
          original_exercise_id: string
          reason?: string | null
          replacement_exercise_id: string
          user_id: string
          workout_exercise_id: string
        }
        Update: {
          created_at?: string | null
          id?: string
          original_exercise_id?: string
          reason?: string | null
          replacement_exercise_id?: string
          user_id?: string
          workout_exercise_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_exercise_replacements_original_exercise_id_fkey"
            columns: ["original_exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_exercise_replacements_replacement_exercise_id_fkey"
            columns: ["replacement_exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "user_exercise_replacements_workout_exercise_id_fkey"
            columns: ["workout_exercise_id"]
            isOneToOne: false
            referencedRelation: "workout_exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      workout_days: {
        Row: {
          cardio_note: string | null
          day_of_week: number | null
          estimated_minutes_max: number | null
          estimated_minutes_min: number | null
          focus: string | null
          id: string
          is_custom: boolean
          is_optional: boolean
          is_rest: boolean
          name: string
          notes: string | null
          slug: string
          sort_order: number
          specialization: string | null
          template_id: string
          user_id: string | null
        }
        Insert: {
          cardio_note?: string | null
          day_of_week?: number | null
          estimated_minutes_max?: number | null
          estimated_minutes_min?: number | null
          focus?: string | null
          id?: string
          is_custom?: boolean
          is_optional?: boolean
          is_rest?: boolean
          name: string
          notes?: string | null
          slug: string
          sort_order?: number
          specialization?: string | null
          template_id: string
          user_id?: string | null
        }
        Update: {
          cardio_note?: string | null
          day_of_week?: number | null
          estimated_minutes_max?: number | null
          estimated_minutes_min?: number | null
          focus?: string | null
          id?: string
          is_custom?: boolean
          is_optional?: boolean
          is_rest?: boolean
          name?: string
          notes?: string | null
          slug?: string
          sort_order?: number
          specialization?: string | null
          template_id?: string
          user_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "workout_days_template_id_fkey"
            columns: ["template_id"]
            isOneToOne: false
            referencedRelation: "workout_templates"
            referencedColumns: ["id"]
          },
        ]
      }
      workout_exercises: {
        Row: {
          block: string | null
          day_id: string
          exercise_id: string
          id: string
          notes: string | null
          position: number
          rep_max: number | null
          rep_min: number | null
          rep_range: string
          rest_note: string | null
          rest_seconds: number | null
          rir_target: string | null
          sets: number
        }
        Insert: {
          block?: string | null
          day_id: string
          exercise_id: string
          id?: string
          notes?: string | null
          position: number
          rep_max?: number | null
          rep_min?: number | null
          rep_range: string
          rest_note?: string | null
          rest_seconds?: number | null
          rir_target?: string | null
          sets: number
        }
        Update: {
          block?: string | null
          day_id?: string
          exercise_id?: string
          id?: string
          notes?: string | null
          position?: number
          rep_max?: number | null
          rep_min?: number | null
          rep_range?: string
          rest_note?: string | null
          rest_seconds?: number | null
          rir_target?: string | null
          sets?: number
        }
        Relationships: [
          {
            foreignKeyName: "workout_exercises_day_id_fkey"
            columns: ["day_id"]
            isOneToOne: false
            referencedRelation: "workout_days"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "workout_exercises_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      workout_sessions: {
        Row: {
          created_at: string
          day_id: string | null
          difficulty: number | null
          duration_seconds: number | null
          energy: number | null
          finished_at: string | null
          id: string
          is_deload: boolean
          mood: string | null
          notes: string | null
          paused_seconds: number
          session_date: string
          started_at: string
          status: string
          title: string
          updated_at: string
          user_id: string
        }
        Insert: {
          created_at?: string
          day_id?: string | null
          difficulty?: number | null
          duration_seconds?: number | null
          energy?: number | null
          finished_at?: string | null
          id?: string
          is_deload?: boolean
          mood?: string | null
          notes?: string | null
          paused_seconds?: number
          session_date?: string
          started_at?: string
          status?: string
          title: string
          updated_at?: string
          user_id: string
        }
        Update: {
          created_at?: string
          day_id?: string | null
          difficulty?: number | null
          duration_seconds?: number | null
          energy?: number | null
          finished_at?: string | null
          id?: string
          is_deload?: boolean
          mood?: string | null
          notes?: string | null
          paused_seconds?: number
          session_date?: string
          started_at?: string
          status?: string
          title?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "workout_sessions_day_id_fkey"
            columns: ["day_id"]
            isOneToOne: false
            referencedRelation: "workout_days"
            referencedColumns: ["id"]
          },
        ]
      }
      workout_templates: {
        Row: {
          created_at: string
          description: string | null
          id: string
          name: string
          notes: string | null
          slug: string
        }
        Insert: {
          created_at?: string
          description?: string | null
          id?: string
          name: string
          notes?: string | null
          slug: string
        }
        Update: {
          created_at?: string
          description?: string | null
          id?: string
          name?: string
          notes?: string | null
          slug?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      get_leaderboard: {
        Args: { period_days?: number }
        Returns: {
          active_weeks: number
          avatar_color: string
          avatar_url: string
          display_name: string
          last_session: string
          pr_count: number
          sessions: number
          sets_count: number
          total_volume: number
          user_id: string
        }[]
      }
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  graphql_public: {
    Enums: {},
  },
  public: {
    Enums: {},
  },
} as const
