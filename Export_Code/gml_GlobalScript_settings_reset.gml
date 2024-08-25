function settings_reset(argument0) //gml_Script_settings_reset
{
    var _settings_def = variable_struct_get(global.__settings_data, argument0)
    if (!is_struct(_settings_def))
        trace_error("Setting \"", argument0, "\" not recognised")
    settings_set(argument0, _settings_def.__default)
}

