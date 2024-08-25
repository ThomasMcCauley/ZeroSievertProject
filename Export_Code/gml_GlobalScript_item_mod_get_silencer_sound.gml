function item_mod_get_silencer_sound(argument0) //gml_Script_item_mod_get_silencer_sound
{
    if (!item_exists(argument0))
        return -4;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return -4;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return -4;
    return asset_get_index(_struct.silencer_sound);
}

