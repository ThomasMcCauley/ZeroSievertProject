function stat_set_value(argument0, argument1) //gml_Script_stat_set_value
{
    if (!(variable_struct_exists(global.stat_data, argument0)))
        trace_error("Stat \"", argument0, "\" not recognised")
    variable_struct_set(global.stat_value, argument0, argument1)
}

