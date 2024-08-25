function item_mod_get_magazine_size(argument0) //gml_Script_item_mod_get_magazine_size
{
    if (!item_exists(argument0))
        return 1;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return 1;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return 1;
    return _struct.magazine_size;
}

