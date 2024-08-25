function scr_create_particle(argument0, argument1) //gml_Script_scr_create_particle
{
    part_particles_create(obj_particles_controller.particles_system[argument0], x, y, obj_particles_controller.particles_type[argument0], argument1)
}

