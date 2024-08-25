function trader_item_get_count(argument0) //gml_Script_trader_item_get_count
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return 0;
    return array_length(_struct.items);
}

