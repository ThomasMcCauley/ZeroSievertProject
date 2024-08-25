function item_get_key_single_use(argument0) //gml_Script_item_get_key_single_use
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "key")
    if (!is_struct(_struct))
        return false;
    return _struct.single_use;
}

