function trader_item_get_id(argument0, argument1) //gml_Script_trader_item_get_id
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return "no_item";
    var _item_array = trader_get_item_array(argument0)
    if (argument1 < 0)
        return "no_item";
    if (argument1 >= array_length(_item_array))
        return "no_item";
    return _item_array[argument1].item;
}

