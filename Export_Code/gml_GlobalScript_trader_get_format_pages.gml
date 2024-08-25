function trader_get_format_pages(argument0) //gml_Script_trader_get_format_pages
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return false;
    return _struct.format_pages;
}

