function item_med_get_speed_multiplier(argument0) //gml_Script_item_med_get_speed_multiplier
{
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 1;
    _struct = variable_struct_get(_struct, "medicine")
    if (!is_struct(_struct))
        return 1;
    return _struct.speed_multiplier;
}

