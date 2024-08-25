function loot_get_name(argument0) //gml_Script_loot_get_name
{
    if (argument0 == undefined)
        return "???";
    return item_get_name(argument0.item);
}

