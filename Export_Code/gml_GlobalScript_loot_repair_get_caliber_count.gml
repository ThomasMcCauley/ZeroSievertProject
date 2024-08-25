function loot_repair_get_caliber_count(argument0) //gml_Script_loot_repair_get_caliber_count
{
    return array_length(item_repair_get_caliber_array(argument0.item));
}

