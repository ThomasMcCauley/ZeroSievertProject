function glance_get_mouse_dis_min(argument0) //gml_Script_glance_get_mouse_dis_min
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _mouse_dis_min = variable_struct_get(_struct, "mouse_dis_min")
    if (_mouse_dis_min == undefined)
        trace_error("Glance type \"", argument0, "\" has no .mouse_dis_min data")
    return _mouse_dis_min;
}

