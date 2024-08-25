function npc_get_state_alert(argument0) //gml_Script_npc_get_state_alert
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "state_alert")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .state_alert data")
    _value = npc_get_general(argument0, _value, "state_alert")
    return _value;
}

