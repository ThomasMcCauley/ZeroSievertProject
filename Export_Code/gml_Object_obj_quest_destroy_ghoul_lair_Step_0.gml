if (show_particle_miccia == true)
{
    visible = true
    sprite_index = s_vuoto
    var o = obj_particles_controller
    var a = (41 << 0)
    part_particles_create(o.particles_system[a], x, y, o.particles_type[a], 3)
}
else
    visible = false
