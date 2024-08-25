function trader_get_money(argument0) //gml_Script_trader_get_money
{
    var _struct = variable_struct_get(global.trader_data, argument0)
    if (!is_struct(_struct))
        return 0;
    var _value = _struct.money
    if (_value == "{shared}")
        _value = db_read_ext("general", "traders", "money", (50000 * gml_Script_difficulty_get("trade_trader_money")))
    return _value;
}

