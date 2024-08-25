function loot_get_weight(argument0) //gml_Script_loot_get_weight
{
    if (argument0 == undefined)
        return "???";
    return item_get_weight(argument0.item);
}

