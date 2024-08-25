if (global.show_explosion_ghoul_lair == true)
{
    global.show_explosion_ghoul_lair = false
    alarm[10] = 120
}
if (entrata_distrutta == false)
{
    if (global.quest_unique_done[(37 << 0)] == true)
    {
        if instance_exists(obj_indoor)
        {
            var _indoor = instance_nearest(x, y, obj_indoor)
            with (_indoor)
                instance_destroy()
            entrata_distrutta = true
        }
    }
}
if (show_explosion == true)
{
    var a = (42 << 0)
    var c = obj_particles_controller
    var d = 32
    part_emitter_region(c.particles_system[a], c.partciles_emitter[a], x, (x + d), (y - d / 2), y, 1, 1)
    part_emitter_burst(c.particles_system[a], c.partciles_emitter[a], c.particles_type[a], 15)
    if (!audio_is_playing(snd_explosion_1))
        audio_play_sound(snd_explosion_1, 14, false)
}
