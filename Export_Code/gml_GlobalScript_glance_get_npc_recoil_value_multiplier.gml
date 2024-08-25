function glance_get_npc_recoil_value_multiplier(argument0) //gml_Script_glance_get_npc_recoil_value_multiplier
{
    var _struct = variable_struct_get(global.weapon_glance_stat, argument0)
    if (!is_struct(_struct))
        return 0;
    var _npc_recoil_value_multiplier = variable_struct_get(_struct, "npc_recoil_value_multiplier")
    if (_npc_recoil_value_multiplier == undefined)
        trace_error("Glance type \"", argument0, "\" has no .npc_recoil_value_multiplier data")
    return _npc_recoil_value_multiplier;
}

