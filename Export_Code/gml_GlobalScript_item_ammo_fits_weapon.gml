function item_ammo_fits_weapon(argument0, argument1) //gml_Script_item_ammo_fits_weapon
{
    var _ammo_caliber = item_ammo_get_caliber(argument0)
    if (_ammo_caliber == "not_ammo")
        return false;
    return item_weapon_get_caliber(argument1) == _ammo_caliber;
}

