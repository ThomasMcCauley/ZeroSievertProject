function item_mod_get_handguard_y(argument0, argument1) //gml_Script_item_mod_get_handguard_y
{
    if (!item_exists(argument0))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "handguard")
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, argument1)
    if (!is_struct(_struct))
        return 0;
    return _struct.y;
}

