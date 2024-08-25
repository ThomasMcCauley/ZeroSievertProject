function npc_get_speaker_id(argument0, argument1) //gml_Script_npc_get_speaker_id
{
    if (argument1 == undefined)
        argument1 = false
    if (!argument1)
        trace_error("Do not use this function!\nInstead read the .npc_speaker_id variable for the instance")
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "speaker_id")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .speaker_id data")
    _value = npc_get_general(argument0, _value, "speaker_id")
    return _value;
}

