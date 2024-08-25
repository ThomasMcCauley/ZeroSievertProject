function item_weapon_get_sound(argument0) //gml_Script_item_weapon_get_sound
{
    if (!(item_fits_category(argument0, "weapon")))
        return -4;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return -4;
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return -4;
    return asset_get_index(_struct.sound);
}

