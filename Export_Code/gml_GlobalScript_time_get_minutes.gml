function time_get_minutes() //gml_Script_time_get_minutes
{
    with (obj_light_controller)
        return date_get_minute(game_time_played);
}

