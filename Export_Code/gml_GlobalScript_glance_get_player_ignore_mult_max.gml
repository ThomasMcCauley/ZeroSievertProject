function glance_get_player_ignore_mult_max(argument0) //gml_Script_glance_get_player_ignore_mult_max
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _mouse_dis_min = variable_struct_get(_struct, "player_ignore_mult_max")
    if (_mouse_dis_min == undefined)
        trace_error("Glance type \"", argument0, "\" has no .player_ignore_mult_max data")
    return _mouse_dis_min;
}

