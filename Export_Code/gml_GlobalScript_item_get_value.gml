function item_get_value(argument0) //gml_Script_item_get_value
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return 0;
    return _struct.value;
}

