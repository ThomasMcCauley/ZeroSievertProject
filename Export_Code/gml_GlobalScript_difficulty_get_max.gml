function difficulty_get_max(argument0) //gml_Script_difficulty_get_max
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, argument0)
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", argument0, "\" not recognised")
    return _difficulty_def.__max;
}

