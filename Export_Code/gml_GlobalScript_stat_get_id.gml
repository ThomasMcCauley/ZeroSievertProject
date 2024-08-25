function stat_get_id(argument0) //gml_Script_stat_get_id
{
    if (argument0 < 0)
        return undefined;
    if (argument0 >= array_length(global.stat_data_array))
        return undefined;
    return global.stat_data_array[argument0];
}

