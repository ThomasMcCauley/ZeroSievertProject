function item_armor_get_s_dead(argument0) //gml_Script_item_armor_get_s_dead
{
    if (!(item_fits_category(argument0, "armor")))
        return 57;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 57;
    _struct = variable_struct_get(_struct, "armor")
    if (!is_struct(_struct))
        return 57;
    return asset_get_index(_struct.s_dead);
}

