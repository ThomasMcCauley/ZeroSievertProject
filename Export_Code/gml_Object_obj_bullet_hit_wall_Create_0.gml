alarm[0] = irandom(6) + 9
alarm[1] = 1
impact_direction = 0
a = (0 << 0)
particles_system[a] = part_system_create()
part_system_depth(particles_system[a], -8500)
partciles_emitter[a] = part_emitter_create(particles_system[a])
particles_type[a] = part_type_create()
part_type_sprite(particles_type[a], 2053, false, false, true)
part_type_life(particles_type[a], 6, 12)
part_type_speed(particles_type[a], 1, 1.5, -0.06, 0)
part_type_size(particles_type[a], 0.5, 0.8, -0.03, 0)
part_type_alpha2(particles_type[a], 1, 0)
part_type_color3(particles_type[a], 16777215, 65535, 16777215)
part_type_blend(particles_type[a], true)
