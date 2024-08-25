function time_get_seconds() //gml_Script_time_get_seconds
{
    with (obj_light_controller)
        return date_get_second(game_time_played);
}

