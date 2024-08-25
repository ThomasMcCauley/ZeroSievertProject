function npc_get_reflexes_angle_max(argument0) //gml_Script_npc_get_reflexes_angle_max
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "reflexes_angle_max")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .reflexes_angle_max data")
    _value = npc_get_general(argument0, _value, "reflexes_angle_max")
    return _value;
}

