function item_consumable_get_animation(argument0) //gml_Script_item_consumable_get_animation
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 2054;
    _struct = variable_struct_get(_struct, "consumable")
    if (!is_struct(_struct))
        return 2054;
    return asset_get_index(_struct.animation);
}

