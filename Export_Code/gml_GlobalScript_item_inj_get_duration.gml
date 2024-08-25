function item_inj_get_duration(argument0) //gml_Script_item_inj_get_duration
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 1;
    _struct = variable_struct_get(_struct, "injector")
    if (!is_struct(_struct))
        return 1;
    return _struct.duration;
}

