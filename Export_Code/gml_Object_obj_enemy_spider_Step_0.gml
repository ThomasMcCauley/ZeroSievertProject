event_inherited()
if (state == npc_get_state_alert(npc_id))
{
    if scr_chance(0.8333333333333334)
    {
        var sound = choose(309, 310, 311, 312)
        audio_play_sound_on(emitter_talk, sound, false, 5)
    }
}
if (scr_chance(25) && instance_line_of_sight(x, y, player_get_local()))
{
    var a = (30 << 0)
    var ob = obj_particles_controller
    var rr = 5
    part_particles_create(ob.particles_system[a], (x + (random_range((-rr), rr))), (y + (random_range((-rr), rr))), ob.particles_type[a], 1)
}
