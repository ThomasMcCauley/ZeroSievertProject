function item_mod_get_type(argument0) //gml_Script_item_mod_get_type
{
    if (!(item_fits_category(argument0, "w_mod")))
        return "not_a_mod";
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return "not_a_mod";
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return "not_a_mod";
    return _struct.type;
}

