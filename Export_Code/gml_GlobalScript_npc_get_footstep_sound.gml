function npc_get_footstep_sound(argument0) //gml_Script_npc_get_footstep_sound
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "footstep_sound")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .footstep_sound data")
    _value = npc_get_general(argument0, _value, "footstep_sound")
    return _value;
}

