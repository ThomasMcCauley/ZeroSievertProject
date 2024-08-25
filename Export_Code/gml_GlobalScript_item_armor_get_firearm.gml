function item_armor_get_firearm(argument0) //gml_Script_item_armor_get_firearm
{
    if (!(item_fits_category(argument0, "armor")))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "armor")
    if (!is_struct(_struct))
        return 0;
    return _struct.firearm;
}

