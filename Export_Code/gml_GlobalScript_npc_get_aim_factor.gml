function npc_get_aim_factor(argument0) //gml_Script_npc_get_aim_factor
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "aim_factor")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .aim_factor data")
    _value = npc_get_general(argument0, _value, "aim_factor")
    return _value;
}

