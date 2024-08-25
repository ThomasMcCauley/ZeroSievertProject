function time_increment_hours(argument0) //gml_Script_time_increment_hours
{
    with (obj_light_controller)
    {
        var _old_hours = time_get_hours()
        var _old_day = time_get_days()
        game_time_played = date_inc_hour(game_time_played, argument0)
        if ((_old_hours < 7 || _old_day < time_get_days()) && time_get_hours() >= 7)
            time_restock_traders()
    }
}

