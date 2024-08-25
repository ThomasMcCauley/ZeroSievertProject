function trader_get_name(argument0) //gml_Script_trader_get_name
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return "???";
    return _struct.name;
}

