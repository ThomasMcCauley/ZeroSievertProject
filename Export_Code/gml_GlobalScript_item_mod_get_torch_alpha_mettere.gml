function item_mod_get_torch_alpha_mettere(argument0) //gml_Script_item_mod_get_torch_alpha_mettere
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "torch")
    if (!is_struct(_struct))
        return 0;
    return _struct.alpha_mettere;
}

