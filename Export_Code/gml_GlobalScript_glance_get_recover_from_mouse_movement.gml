function glance_get_recover_from_mouse_movement(argument0) //gml_Script_glance_get_recover_from_mouse_movement
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _recover_from_mouse_movement = variable_struct_get(_struct, "recover_from_mouse_movement")
    if (_recover_from_mouse_movement == undefined)
        trace_error("Glance type \"", argument0, "\" has no .recover_from_mouse_movement data")
    return _recover_from_mouse_movement;
}

