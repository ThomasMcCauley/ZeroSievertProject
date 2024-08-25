function glance_get_mult_eff_range_aiming(argument0) //gml_Script_glance_get_mult_eff_range_aiming
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _mult_eff_range_aiming = variable_struct_get(_struct, "mult_eff_range_aiming")
    if (_mult_eff_range_aiming == undefined)
        trace_error("Glance type \"", argument0, "\" has no .mult_eff_range_aiming data")
    return _mult_eff_range_aiming;
}

