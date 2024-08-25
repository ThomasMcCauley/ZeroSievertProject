function glance_get_scope_flat_amount(argument0) //gml_Script_glance_get_scope_flat_amount
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _scope_flat_amount = variable_struct_get(_struct, "scope_flat_amount")
    if (_scope_flat_amount == undefined)
        trace_error("Glance type \"", argument0, "\" has no .scope_flat_amount data")
    return _scope_flat_amount;
}

