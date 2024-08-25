function glance_get_eff_range_recoil(argument0) //gml_Script_glance_get_eff_range_recoil
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _eff_range_recoil = variable_struct_get(_struct, "eff_range_recoil")
    if (!is_array(_eff_range_recoil))
        return 0;
    return _eff_range_recoil;
}

