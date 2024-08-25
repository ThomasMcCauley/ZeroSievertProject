function item_mod_get_value(argument0) //gml_Script_item_mod_get_value
{
    if (!item_exists(argument0))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return 0;
    return _struct.value;
}

