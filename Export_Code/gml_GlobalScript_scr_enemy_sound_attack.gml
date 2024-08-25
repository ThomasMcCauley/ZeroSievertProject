function scr_enemy_sound_attack() //gml_Script_scr_enemy_sound_attack
{
    if (object_index == obj_enemy_wolf_brown)
    {
        if (state == "wolf_attack_1")
            audio_play_sound_on(emitter_talk, snd_wolf_bark5, false, 4)
    }
    if (object_index == obj_enemy_big)
    {
        var sound_ = choose(306, 307, 308)
        audio_play_sound_on(emitter_talk, sound_, false, 4)
    }
}

