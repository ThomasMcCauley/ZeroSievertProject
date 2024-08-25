event_inherited()
if (state == npc_get_state_alert(npc_id))
{
    if scr_chance(0.8333333333333334)
    {
        var sound = choose(314, 315, 316, 317, 318)
        audio_play_sound_on(emitter_talk, sound, false, 5)
    }
}
