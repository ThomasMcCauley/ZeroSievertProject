function loot_mod_get_weapon_count(argument0) //gml_Script_loot_mod_get_weapon_count
{
    return array_length(item_mod_get_weapon_array(argument0.item));
}

