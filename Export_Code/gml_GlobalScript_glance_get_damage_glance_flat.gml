function glance_get_damage_glance_flat(argument0) //gml_Script_glance_get_damage_glance_flat
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _scope_flat_amount = variable_struct_get(_struct, "damage_glance_flat")
    if (_scope_flat_amount == undefined)
        trace_error("Glance type \"", argument0, "\" has no .damage_glance_flat data")
    return _scope_flat_amount;
}

