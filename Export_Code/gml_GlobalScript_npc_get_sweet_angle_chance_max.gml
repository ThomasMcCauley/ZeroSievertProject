function npc_get_sweet_angle_chance_max(argument0) //gml_Script_npc_get_sweet_angle_chance_max
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "sweet_angle_chance_max")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .sweet_angle_chance_max data")
    _value = npc_get_general(argument0, _value, "sweet_angle_chance_max")
    return _value;
}

