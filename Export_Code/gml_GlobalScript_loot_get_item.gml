function loot_get_item(argument0) //gml_Script_loot_get_item
{
    if (!is_struct(argument0))
        return "no_item";
    return argument0.item;
}

