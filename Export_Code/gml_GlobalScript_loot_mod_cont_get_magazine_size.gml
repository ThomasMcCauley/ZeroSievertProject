function loot_mod_cont_get_magazine_size(argument0) //gml_Script_loot_mod_cont_get_magazine_size
{
    if loot_mod_cont_exists(argument0, "magazine")
        return item_mod_get_magazine_size(loot_mod_cont_get(argument0, "magazine"));
    else
        return 0;
}

