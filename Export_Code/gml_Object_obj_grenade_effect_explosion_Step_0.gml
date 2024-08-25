audio_emitter_position(emitter_explosion, x, y, 0)
ricochet_counter++
if (ricochet_counter < ricochet_counter_max)
{
    if scr_chance(15)
    {
        var _sound = choose(241, 242, 243, 244)
        audio_play_sound_on(emitter_explosion, _sound, false, 15, random_range(0.7, 1), 0, random_range(0.7, 1.2))
    }
}
