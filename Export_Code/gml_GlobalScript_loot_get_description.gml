function loot_get_description(argument0) //gml_Script_loot_get_description
{
    if (argument0 == undefined)
        return "???";
    return item_get_description(argument0.item);
}

