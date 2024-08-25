function chest_get_special_items_array(argument0) //gml_Script_chest_get_special_items_array
{
    var _struct = variable_struct_get(global.chest_data, argument0)
    if (!is_struct(_struct))
        return [];
    return _struct.special_items;
}

