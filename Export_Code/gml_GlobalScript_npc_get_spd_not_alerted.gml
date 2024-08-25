function npc_get_spd_not_alerted(argument0) //gml_Script_npc_get_spd_not_alerted
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "spd_not_alerted")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .spd_not_alerted data")
    _value = npc_get_general(argument0, _value, "spd_not_alerted")
    return _value;
}

