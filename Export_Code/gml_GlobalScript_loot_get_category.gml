function loot_get_category(argument0) //gml_Script_loot_get_category
{
    if (argument0 == undefined)
        return "none";
    return item_get_category(argument0.item);
}

