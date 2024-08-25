function item_weapon_get_fire_mode(argument0) //gml_Script_item_weapon_get_fire_mode
{
    if (!(item_fits_category(argument0, "weapon")))
        return undefined;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return undefined;
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return undefined;
    return _struct.fire_mode;
}

