if (obj_map_generator.area == (2 << 0))
{
    if (!quest_is_complete("kill_orel"))
    {
        go_back = true
        stop_x = room_width + 300
    }
}
state = (6 << 0)
