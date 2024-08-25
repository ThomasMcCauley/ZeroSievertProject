function npc_get_chest_dropped(argument0) //gml_Script_npc_get_chest_dropped
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "chest_dropped")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .chest_dropped data")
    if (!is_array(_value))
        _value = npc_get_general(argument0, _value, "chest_dropped")
    if is_array(_value)
        return _value[irandom(array_length(_value) - 1)];
    return _value;
}

