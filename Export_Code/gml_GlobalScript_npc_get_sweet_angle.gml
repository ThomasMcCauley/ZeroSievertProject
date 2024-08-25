function npc_get_sweet_angle(argument0) //gml_Script_npc_get_sweet_angle
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _sweet_angle = variable_struct_get(_struct, "sweet_angle")
    if (_sweet_angle == undefined)
        trace_error("NPC \"", argument0, "\" has no .sweet_angle data")
    _sweet_angle = npc_get_general(argument0, _sweet_angle, "sweet_angle")
    return _sweet_angle;
}

