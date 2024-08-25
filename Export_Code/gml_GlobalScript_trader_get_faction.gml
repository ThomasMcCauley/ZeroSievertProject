function trader_get_faction(argument0) //gml_Script_trader_get_faction
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return "All Friend";
    return _struct.faction;
}

