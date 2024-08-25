function item_mod_handguard_pos_exists(argument0, argument1) //gml_Script_item_mod_handguard_pos_exists
{
    if (!(item_fits_category(argument0, "w_mod")))
        return false;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "handguard")
    if (!is_struct(_struct))
        return false;
    return variable_struct_exists(_struct, argument1);
}

