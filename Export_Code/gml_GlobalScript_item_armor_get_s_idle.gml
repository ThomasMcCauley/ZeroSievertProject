function item_armor_get_s_idle(argument0) //gml_Script_item_armor_get_s_idle
{
    if (!(item_fits_category(argument0, "armor")))
        return 55;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 55;
    _struct = variable_struct_get(_struct, "armor")
    if (!is_struct(_struct))
        return 55;
    return asset_get_index(_struct.s_idle);
}

