function ui_trader_calculate_deal_value() //gml_Script_ui_trader_calculate_deal_value
{
    var _player_sale_value = 0
    var _trader_sale_value = 0
    with (gml_Script_uiFindRelaxed(uiLayerGetRoot("inventory layer"), "sell inventory", true))
        _player_sale_value += self.GetLootValue()
    with (gml_Script_uiFindRelaxed(uiLayerGetRoot("inventory layer"), "buy inventory", true))
        _trader_sale_value += self.GetLootValueDiffMultiplier()
    _player_sale_value = floor(_player_sale_value * gml_Script_difficulty_get("trade_sell_mult") * (global.sk_k[(21 << 0)]))
    _trader_sale_value = floor(_trader_sale_value)
    return 
    {
        net_value_for_player: (_player_sale_value - _trader_sale_value),
        net_value_for_trader: (_trader_sale_value - _player_sale_value),
        player_sale_value: _player_sale_value,
        trader_sale_value: _trader_sale_value
    };
}

