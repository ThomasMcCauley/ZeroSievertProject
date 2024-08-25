function difficulty_get_name(argument0) //gml_Script_difficulty_get_name
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, argument0)
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", argument0, "\" not recognised")
    return language_get_string(_difficulty_def.__friendlyName);
}

