function chest_get_sprite(argument0) //gml_Script_chest_get_sprite
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return 2054;
    return asset_get_index(_struct.sprite);
}

