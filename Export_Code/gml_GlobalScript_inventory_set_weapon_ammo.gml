function inventory_set_weapon_ammo(argument0, argument1, argument2) //gml_Script_inventory_set_weapon_ammo
{
    var _loot = inventory_find_loot(argument0)
    if (_loot != undefined)
    {
        with (_loot)
        {
            ammo_id = argument2
            ammo_quantity = argument1
        }
    }
}

