function loot_weapon_can_fire(argument0) //gml_Script_loot_weapon_can_fire
{
    return item_weapon_can_fire(loot_get_item(argument0), loot_get_mod_container(argument0));
}

