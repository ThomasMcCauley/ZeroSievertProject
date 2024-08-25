function player_play_radiation_sound(argument0) //gml_Script_player_play_radiation_sound
{
    var _new_sound = undefined
    if (argument0 > 0 && argument0 <= 200)
        _new_sound = snd_radiation_low
    else if (argument0 > 200 && argument0 <= 400)
        _new_sound = snd_radiation_medium
    else
        _new_sound = snd_radiation_high
    if (argument0 <= 0)
        _new_sound = undefined
    var _loop = false
    if (_new_sound != undefined)
    {
        if audio_exists(_new_sound)
        {
            if (!audio_is_playing(_new_sound))
                _loop = true
        }
    }
    if (radiation_sound != _new_sound || _loop)
    {
        radiation_sound = _new_sound
        if (radiation_voice != undefined)
            audio_stop_sound(radiation_voice)
        if (_new_sound == undefined)
            radiation_voice = undefined
        else
            radiation_voice = audio_play_sound(_new_sound, 10, false)
    }
}

