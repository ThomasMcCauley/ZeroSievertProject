function item_mod_get_scope_extend_view(argument0) //gml_Script_item_mod_get_scope_extend_view
{
    if (!item_exists(argument0))
        return false;
    var _struct = variable_struct_get(global.item_data, argument0)
    if (!is_struct(_struct))
        return false;
    _struct = variable_struct_get(_struct, "weapon_mod")
    if (!is_struct(_struct))
        return false;
    var _value = variable_struct_get(_struct, "scope_extend_view")
    if (_value == undefined)
        trace_error("Item \"", argument0, "\" has no .scope_extend_view data")
    return _value;
}

