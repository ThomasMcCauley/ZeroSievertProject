function item_mod_get_scope_optic(argument0) //gml_Script_item_mod_get_scope_optic
{
    if (!item_exists(argument0))
        return false;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return false;
    return _struct.scope_optic;
}

