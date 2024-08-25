function item_mod_get_scope_image(argument0) //gml_Script_item_mod_get_scope_image
{
    if (!item_exists(argument0))
        return 2054;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 2054;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return 2054;
    return asset_get_index(_struct.scope_image);
}

