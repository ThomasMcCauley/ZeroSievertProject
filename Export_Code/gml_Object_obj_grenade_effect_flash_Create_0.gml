alarm[0] = 180
emitter_explosion = audio_emitter_create()
audio_emitter_falloff(emitter_explosion, 200, 500, 1)
audio_emitter_position(emitter_explosion, x, y, 0)
audio_play_sound_on(emitter_explosion, snd_grenade_flashbang_1, false, 20)
scr_create_particle((52 << 0), 10)
scr_create_particle((53 << 0), 4)
scr_create_particle((54 << 0), 4)
