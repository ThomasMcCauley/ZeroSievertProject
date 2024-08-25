function item_inj_get_rad_def(argument0) //gml_Script_item_inj_get_rad_def
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "injector")
    if (!is_struct(_struct))
        return 0;
    return _struct.rad_def;
}

