function item_grenade_get_damage_max(argument0) //gml_Script_item_grenade_get_damage_max
{
    if (!(item_fits_category(argument0, "grenade")))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "grenade")
    if (!is_struct(_struct))
        return 0;
    return _struct.damage_max;
}

