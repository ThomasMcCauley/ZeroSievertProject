function settings_get_description(argument0) //gml_Script_settings_get_description
{
    var _settings_def = variable_struct_get(global.__settings_data, argument0)
    if (!is_struct(_settings_def))
        trace_error("Setting \"", argument0, "\" not recognised")
    return _settings_def.__description;
}

