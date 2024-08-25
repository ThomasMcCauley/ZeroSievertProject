event_inherited()
if (state == npc_get_state_alert(npc_id))
{
    if scr_chance(0.6172839506172839)
    {
        var sound = choose(283, 284, 286, 288, 289, 290, 290, 290)
        audio_play_sound_on(emitter_talk, sound, false, 5)
    }
}
