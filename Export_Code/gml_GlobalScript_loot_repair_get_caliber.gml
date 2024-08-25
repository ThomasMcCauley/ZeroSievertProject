function loot_repair_get_caliber(argument0, argument1) //gml_Script_loot_repair_get_caliber
{
    var _array = item_repair_get_caliber_array(argument0.item)
    if (argument1 < 0 || argument1 >= array_length(_array))
        return "not_ammo";
    return _array[argument1];
}

