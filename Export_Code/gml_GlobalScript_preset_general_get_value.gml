function preset_general_get_value(argument0, argument1) //gml_Script_preset_general_get_value
{
    var _struct_general = variable_struct_get(global.npc_preset, "general")
    var _struct_value = variable_struct_get(_struct_general, argument0)
    if (_struct_value == undefined)
        trace_error("Preset general \"", " has no .", argument0, " data")
    if (_struct_value != "{use_preset}")
    {
        if is_struct(_struct_value)
        {
            var _general_name_value = variable_struct_get(_struct_value, argument1)
            if (_general_name_value != undefined)
                return _general_name_value;
        }
        else
            return _struct_value;
    }
    return argument1;
}

