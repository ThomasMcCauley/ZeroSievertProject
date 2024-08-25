function item_armor_get_s_run(argument0) //gml_Script_item_armor_get_s_run
{
    if (!(item_fits_category(argument0, "armor")))
        return 56;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 56;
    _struct = variable_struct_get(_struct, "armor")
    if (!is_struct(_struct))
        return 56;
    return asset_get_index(_struct.s_run);
}

