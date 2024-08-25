function loot_get_value_sell_per_unit(argument0) //gml_Script_loot_get_value_sell_per_unit
{
    if (room == r_menu)
        return (loot_get_value_per_unit(argument0) * gml_Script_difficulty_get("trade_sell_mult"));
    else
        return (loot_get_value_per_unit(argument0) * gml_Script_difficulty_get("trade_sell_mult") * (global.sk_k[(21 << 0)]));
}

