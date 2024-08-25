function npc_get_ims_idle(argument0) //gml_Script_npc_get_ims_idle
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "ims_idle")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .ims_idle data")
    _value = npc_get_general(argument0, _value, "ims_idle")
    return _value;
}

