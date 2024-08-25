function time_get_hours_fraction() //gml_Script_time_get_hours_fraction
{
    return (time_get_hours() + time_get_minutes() / 60);
}

