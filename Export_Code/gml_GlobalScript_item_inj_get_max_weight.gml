function item_inj_get_max_weight(argument0) //gml_Script_item_inj_get_max_weight
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "injector")
    if (!is_struct(_struct))
        return 0;
    return _struct.max_weight;
}

