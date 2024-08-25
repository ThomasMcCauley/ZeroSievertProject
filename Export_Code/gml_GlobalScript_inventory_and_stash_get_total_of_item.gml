function inventory_and_stash_get_total_of_item(argument0) //gml_Script_inventory_and_stash_get_total_of_item
{
    return (inventory_get_total_of_item(argument0) + stash_get_total_of_item(argument0));
}

