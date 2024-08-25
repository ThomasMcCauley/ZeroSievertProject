function item_mod_get_position_array(argument0) //gml_Script_item_mod_get_position_array
{
    if (!item_exists(argument0))
        return [];
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return [];
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return [];
    return _struct.position;
}

