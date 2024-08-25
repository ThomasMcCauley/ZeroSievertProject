player_follow_local()
if player_any_exists()
{
    global.emission_timer_now += 1
    if (global.emission_done == true)
    {
        if (global.meteo_rain != (12 << 0))
            alarm[0] = 1
    }
}
