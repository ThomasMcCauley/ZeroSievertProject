function trader_pages_get_image(argument0) //gml_Script_trader_pages_get_image
{
    if (!(variable_struct_exists(global.trader_pages_data, argument0)))
    {
        trace_error("Trade page alias \"", argument0, "\" not recognised")
        return;
    }
    return variable_struct_get(global.trader_pages_data, argument0).image;
}

