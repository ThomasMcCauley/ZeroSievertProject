function item_backpack_get_sprite(argument0) //gml_Script_item_backpack_get_sprite
{
    if (!item_exists(argument0))
        return 2054;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 2054;
    _struct = variable_struct_get(_struct, "backpack")
    if (!is_struct(_struct))
        return 2054;
    return asset_get_index(_struct.sprite_game);
}

