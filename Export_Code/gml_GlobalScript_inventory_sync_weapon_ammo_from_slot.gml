function inventory_sync_weapon_ammo_from_slot(argument0) //gml_Script_inventory_sync_weapon_ammo_from_slot
{
    var _i = 0
    repeat array_length(argument0)
    {
        var _loot = argument0[_i]
        if loot_in_primary_weapon_slot(_loot)
        {
            _loot.ammo_id = ammo_id_now[(1 << 0)]
            _loot.ammo_quantity = ammo_slot[(1 << 0)]
        }
        if loot_in_secondary_weapon_slot(_loot)
        {
            _loot.ammo_id = ammo_id_now[(2 << 0)]
            _loot.ammo_quantity = ammo_slot[(2 << 0)]
        }
        _i++
    }
}

