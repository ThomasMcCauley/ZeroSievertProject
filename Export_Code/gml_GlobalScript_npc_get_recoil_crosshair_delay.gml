function npc_get_recoil_crosshair_delay(argument0) //gml_Script_npc_get_recoil_crosshair_delay
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "recoil_crosshair_delay")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .recoil_crosshair_delay data")
    _value = npc_get_general(argument0, _value, "recoil_crosshair_delay")
    return _value;
}

