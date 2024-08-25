function item_headset_get_blue(argument0) //gml_Script_item_headset_get_blue
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "headset")
    if (!is_struct(_struct))
        return 0;
    return _struct.blue;
}

