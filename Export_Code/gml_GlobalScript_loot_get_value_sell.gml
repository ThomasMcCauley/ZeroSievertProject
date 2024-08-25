function loot_get_value_sell(argument0) //gml_Script_loot_get_value_sell
{
    return (argument0.quantity * loot_get_value_sell_per_unit(argument0));
}

