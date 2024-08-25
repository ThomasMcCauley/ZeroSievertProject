function item_repair_get_caliber_array(argument0) //gml_Script_item_repair_get_caliber_array
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return [];
    _struct = variable_struct_get(_struct, "repair")
    if (!is_struct(_struct))
        return [];
    var _array = variable_struct_get(_struct, "caliber")
    return (is_array(_array) ? _array : []);
}

