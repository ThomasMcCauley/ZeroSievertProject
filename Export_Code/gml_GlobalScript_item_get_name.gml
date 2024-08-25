function item_get_name(argument0) //gml_Script_item_get_name
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "???";
    _struct = variable_struct_get(_struct, "basic")
    if (!is_struct(_struct))
        return "???";
    return language_get_string(_struct.name);
}

