-- Migration to add missing movement patterns discovered during bulk import

INSERT INTO public.movement_patterns (id, name, description)
VALUES 
  ('squat', 'Squat', 'A compound, lower-body movement involving simultaneous hip and knee flexion/extension.'),
  ('lunge', 'Lunge', 'A unilateral or staggered-stance lower-body movement.'),
  ('hinge', 'Hip Hinge', 'A movement focused primarily on hip flexion and extension with minimal knee involvement.'),
  ('calf-raise', 'Calf Raise', 'Plantarflexion of the ankle against resistance.'),
  ('anti-lateral-flexion', 'Anti-Lateral Flexion', 'Resisting lateral bending of the spine.'),
  ('loaded-carry', 'Loaded Carry', 'Transporting weight over a distance to challenge core stability, grip, and conditioning.')
ON CONFLICT (id) DO NOTHING;
