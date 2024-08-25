function loot_set_from_trader(argument0, argument1, argument2) //gml_Script_loot_set_from_trader
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = trader_pages_default_alias()
    with (argument0)
    {
        min_level = argument1
        page = argument2
    }
}

