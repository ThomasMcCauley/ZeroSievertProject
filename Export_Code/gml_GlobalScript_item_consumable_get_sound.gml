function item_consumable_get_sound(argument0) //gml_Script_item_consumable_get_sound
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return -4;
    _struct = variable_struct_get(_struct, "consumable")
    if (!is_struct(_struct))
        return -4;
    return asset_get_index(_struct.sound);
}

