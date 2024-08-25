function stat_get_name(argument0) //gml_Script_stat_get_name
{
    if (!(variable_struct_exists(global.stat_data, argument0)))
        trace_error("Stat \"", argument0, "\" not recognised")
    return variable_struct_get(global.stat_data, argument0).name;
}

