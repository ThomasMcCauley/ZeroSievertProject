function gamedata_trader_calculate_shared_money() //gml_Script_gamedata_trader_calculate_shared_money
{
    var _max = 50000 * gml_Script_difficulty_get("trade_trader_money") * (global.sk_k[(22 << 0)])
    global.trader_money_all = db_read_ext("general", "traders", "money", _max)
}

