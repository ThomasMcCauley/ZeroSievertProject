function item_get_description(argument0) //gml_Script_item_get_description
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "";
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return "";
    return _struct.description;
}

