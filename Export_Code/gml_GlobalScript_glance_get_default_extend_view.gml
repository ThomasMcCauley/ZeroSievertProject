function glance_get_default_extend_view(argument0) //gml_Script_glance_get_default_extend_view
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _default_extend_view = variable_struct_get(_struct, "default_extend_view")
    if (_default_extend_view == undefined)
        trace_error("Glance type \"", argument0, "\" has no .default_extend_view data")
    return _default_extend_view;
}

