function item_mod_get_torch_scale(argument0) //gml_Script_item_mod_get_torch_scale
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 1;
    _struct = variable_struct_get(_struct, "torch")
    if (!is_struct(_struct))
        return 1;
    return _struct.scale;
}

