if instance_exists(obj_particles_controller)
{
    var a = (11 << 0)
    part_particles_create(obj_particles_controller.particles_system[a], (x + (random_range(-2, 2))), (y - 10), obj_particles_controller.particles_type[a], 3)
    a = (10 << 0)
    part_particles_create(obj_particles_controller.particles_system[a], (x + (random_range(-4, 4))), (y - 15), obj_particles_controller.particles_type[a], 1)
}
