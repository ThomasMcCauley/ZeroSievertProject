function time_get_hours() //gml_Script_time_get_hours
{
    with (obj_light_controller)
        return date_get_hour(game_time_played);
}

