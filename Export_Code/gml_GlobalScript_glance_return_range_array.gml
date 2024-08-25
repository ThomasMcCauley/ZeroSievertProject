function glance_return_range_array(argument0, argument1, argument2) //gml_Script_glance_return_range_array
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument0 == "no_item")
        return 1;
    var _get_type_eff_range = item_ammo_get_eff_range(argument0)
    if (_get_type_eff_range == "{use_weapon}")
    {
        if (!item_exists(argument1))
            return 1;
        _get_type_eff_range = item_weapon_get_type_effective_range(argument1)
    }
    var _array_points = glance_get_eff_range(_get_type_eff_range)
    return _array_points;
}

