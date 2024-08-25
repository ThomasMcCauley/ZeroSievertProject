function item_ammo_get_eff_range(argument0) //gml_Script_item_ammo_get_eff_range
{
    if (!item_exists(argument0))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "ammo")
    if (!is_struct(_struct))
        return 0;
    return _struct.eff_range;
}

