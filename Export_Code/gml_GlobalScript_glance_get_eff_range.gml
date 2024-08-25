function glance_get_eff_range(argument0) //gml_Script_glance_get_eff_range
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _eff_range = variable_struct_get(_struct, "eff_range")
    if (!is_array(_eff_range))
        return 0;
    return _eff_range;
}

