function item_mod_get_laser_color(argument0) //gml_Script_item_mod_get_laser_color
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 16777215;
    _struct = variable_struct_get(_struct, "laser")
    if (!is_struct(_struct))
        return 16777215;
    var _value = int64(ptr(_struct.color))
    _value = (((_value & 255) << 16) | (_value & 65280)) | ((_value & 16711680) >> 16)
    return _value;
}

