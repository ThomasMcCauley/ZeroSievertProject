function daily_return_map() //gml_Script_daily_return_map
{
    var _array_map = [(1 << 0)]
    if quest_is_complete("unlock_makeshift_camp")
        array_push(_array_map, (2 << 0))
    if quest_is_complete("kill_orel")
        array_push(_array_map, (3 << 0), (4 << 0))
    if quest_is_complete("gate_sewer")
        array_push(_array_map, (6 << 0))
    return _array_map[irandom(array_length(_array_map) - 1)];
}

