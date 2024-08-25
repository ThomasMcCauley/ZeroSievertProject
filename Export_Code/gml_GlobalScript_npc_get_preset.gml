function npc_get_preset(argument0) //gml_Script_npc_get_preset
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "npc_preset")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .npc_preset data")
    return _value;
}

