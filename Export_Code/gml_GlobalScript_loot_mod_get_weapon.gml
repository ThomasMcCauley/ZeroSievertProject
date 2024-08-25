function loot_mod_get_weapon(argument0, argument1) //gml_Script_loot_mod_get_weapon
{
    var _array = item_mod_get_weapon_array(argument0.item)
    if (argument1 < 0 || argument1 >= array_length(_array))
        return "no_weapon";
    return _array[argument1];
}

