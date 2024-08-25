function saveslot_get_time(argument0) //gml_Script_saveslot_get_time
{
    if (!instance_exists(obj_main_menu))
        return "";
    if (argument0 <= 0)
        return "";
    if (argument0 > 3)
        return "";
    with (obj_main_menu)
    {
        var _time_played = play_time[(argument0 - 1)]
        if (_time_played != undefined && _time_played > 0)
        {
            var _hour_played = _time_played div 3600
            var _min_played = (_time_played - 3600 * _hour_played) div 60
            var _text_time_played = string(_hour_played) + "H " + string(_min_played) + "M"
            return _text_time_played;
        }
    }
    return "";
}

