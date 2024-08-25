function item_weapon_pos_get_x(argument0, argument1) //gml_Script_item_weapon_pos_get_x
{
    if (!(item_fits_category(argument0, "weapon")))
        return 0;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "weapon")
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, "mods")
    if (!is_struct(_struct))
        return 0;
    _struct = variable_struct_get(_struct, argument1)
    if (!is_struct(_struct))
        return 0;
    return _struct.x;
}

