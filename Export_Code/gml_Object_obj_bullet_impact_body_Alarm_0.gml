audio_emitter_position(my_emitter, x, y, 0)
audio_emitter_falloff(my_emitter, 64, 240, 1)
sound_impact = choose(178, 179, 180, 181, 182)
audio_play_sound_on(my_emitter, sound_impact, false, 15)
var _durata = round(audio_sound_length(sound_impact) * 60 + 1)
alarm[1] = _durata
