function item_weapon_get_modded_magazine_size(argument0, argument1) //gml_Script_item_weapon_get_modded_magazine_size
{
    if (item_weapon_get_moddable(argument0) && loot_mod_cont_exists(argument1, "magazine"))
        return item_mod_get_magazine_size(loot_mod_cont_get(argument1, "magazine"));
    else
        return item_weapon_get_magazine(argument0);
}

