function settings_get(argument0) //gml_Script_settings_get
{
    var _settings_def = variable_struct_get(global.__settings_data, argument0)
    if (!is_struct(_settings_def))
        trace_error("Setting \"", argument0, "\" not recognised")
    with (_settings_def)
        return db_read_ext(__db_alias, __db_section, __name, __default);
}

