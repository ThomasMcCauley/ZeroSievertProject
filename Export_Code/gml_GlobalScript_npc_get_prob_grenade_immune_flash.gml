function npc_get_prob_grenade_immune_flash(argument0) //gml_Script_npc_get_prob_grenade_immune_flash
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "prob_grenade_immune_flash")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_immune_flash data")
    _value = npc_get_general(argument0, _value, "prob_grenade_immune_flash")
    return _value;
}

