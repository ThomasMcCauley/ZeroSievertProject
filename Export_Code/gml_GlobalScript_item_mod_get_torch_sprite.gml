function item_mod_get_torch_sprite(argument0) //gml_Script_item_mod_get_torch_sprite
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 2054;
    _struct = variable_struct_get(_struct, "torch")
    if (!is_struct(_struct))
        return 2054;
    return asset_get_index(_struct.sprite);
}

