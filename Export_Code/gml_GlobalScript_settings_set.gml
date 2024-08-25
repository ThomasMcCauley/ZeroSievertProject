function settings_set(argument0, argument1) //gml_Script_settings_set
{
    var _settings_def = variable_struct_get(global.__settings_data, argument0)
    if (!is_struct(_settings_def))
        trace_error("Setting \"", argument0, "\" not recognised")
    with (_settings_def)
    {
        if (argument1 != db_read_ext(__db_alias, __db_section, __name, __default))
        {
            db_open(__db_alias)
            db_write(__db_section, __name, argument1)
            db_close()
            if is_method(__callback)
                self.__callback(argument1)
        }
    }
}

