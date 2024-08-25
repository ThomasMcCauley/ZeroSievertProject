function npc_get_power(argument0) //gml_Script_npc_get_power
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "power")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .power data")
    _value = npc_get_general(argument0, _value, "power")
    return _value;
}

