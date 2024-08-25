function trader_pages_get_alias(argument0) //gml_Script_trader_pages_get_alias
{
    if (argument0 < 0)
    {
        trace_error("Invalid index (", argument0, ")")
        return;
    }
    if (argument0 >= array_length(global.trader_pages_data_array))
    {
        trace_error("Trader page index too large (got ", argument0, ", length of array is ", array_length(global.trader_pages_data_array), ")")
        return;
    }
    return global.trader_pages_data_array[argument0];
}

