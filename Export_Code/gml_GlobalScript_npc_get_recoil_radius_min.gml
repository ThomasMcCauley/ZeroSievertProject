function npc_get_recoil_radius_min(argument0) //gml_Script_npc_get_recoil_radius_min
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "recoil_radius_min")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .recoil_radius_min data")
    _value = npc_get_general(argument0, _value, "recoil_radius_min")
    return _value;
}

