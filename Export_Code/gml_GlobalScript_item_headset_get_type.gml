function item_headset_get_type(argument0) //gml_Script_item_headset_get_type
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return undefined;
    _struct = variable_struct_get(_struct, "headset")
    if (!is_struct(_struct))
        return undefined;
    return _struct.type;
}

