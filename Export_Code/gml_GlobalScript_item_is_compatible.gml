function item_is_compatible(argument0, argument1) //gml_Script_item_is_compatible
{
    if item_mod_fits_weapon(argument0, argument1)
        return true;
    if item_mod_fits_weapon(argument1, argument0)
        return true;
    if item_ammo_fits_weapon(argument0, argument1)
        return true;
    if item_ammo_fits_weapon(argument1, argument0)
        return true;
    return false;
}

