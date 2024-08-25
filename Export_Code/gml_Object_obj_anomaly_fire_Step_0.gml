with (obj_player_parent)
{
    with (other)
    {
        if place_meeting(x, y, other.id)
        {
            if (my_sound == undefined)
                my_sound = audio_play_sound_on(my_emitter, snd_anomaly_fire_2, true, 1)
            active = true
            alarm[10] = 5
            if (player_get_local() == other.id)
                scr_anomaly_damage(damage)
        }
    }
}
if place_meeting(x, y, obj_npc_parent)
{
    if (my_sound == undefined)
        my_sound = audio_play_sound_on(my_emitter, snd_anomaly_fire_2, true, 1)
    active = true
    alarm[10] = 5
    var quale_id = instance_place(x, y, obj_npc_parent)
    quale_id.hp -= 0.75
}
if place_meeting(x, y, obj_bolt)
{
    if (my_sound == undefined)
        my_sound = audio_play_sound_on(my_emitter, snd_anomaly_fire_2, true, 1)
    active = true
    alarm[10] = 30
}
if active
{
    var a = (12 << 0)
    var c = obj_particles_controller
    part_particles_create(c.particles_system[a], x, y, c.particles_type[a], c.particle_fire_amount)
}
if scr_chance(0.2)
{
    a = (13 << 0)
    c = obj_particles_controller
    part_particles_create(c.particles_system[a], x, y, c.particles_type[a], c.particle_fire_amount)
}
