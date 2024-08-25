function preset_get_value(argument0, argument1) //gml_Script_preset_get_value
{
    var _struct = variable_struct_get(global.npc_preset, argument0)
    if (!is_struct(_struct))
        trace_error("Preset \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, argument1)
    if (_value == undefined)
        trace_error("Preset \"", argument0, "\" has no .", argument1, " data")
    _value = preset_general_get_value(argument1, _value)
    return _value;
}

