function inventory_sync_weapon_durability() //gml_Script_inventory_sync_weapon_durability
{
    db_open(inventory_target_db())
    var _loot_array = db_read("Inventory", "items", [])
    db_close(true)
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if loot_in_primary_weapon_slot(_loot)
            _loot.durability = durability_slot[(1 << 0)]
        if loot_in_secondary_weapon_slot(_loot)
            _loot.durability = durability_slot[(2 << 0)]
        _i++
    }
}

