function item_weapon_get_modded_silenced(argument0, argument1) //gml_Script_item_weapon_get_modded_silenced
{
    if (!item_weapon_get_moddable(argument0))
        return false;
    if (!(loot_mod_cont_exists(argument1, "brake")))
        return false;
    return item_mod_get_type(loot_mod_cont_get(argument1, "brake")) == "silencer";
}

