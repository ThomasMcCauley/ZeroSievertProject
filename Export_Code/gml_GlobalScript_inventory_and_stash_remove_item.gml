function inventory_and_stash_remove_item(argument0, argument1) //gml_Script_inventory_and_stash_remove_item
{
    var _dirty = false
    db_open(inventory_target_db())
    var _loot_array = db_read("Inventory", "items", [])
    db_close()
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.item == argument0)
        {
            _dirty = true
            var _amount_to_remove = min(_loot.quantity, argument1)
            _loot.quantity -= _amount_to_remove
            if (_loot.quantity <= 0)
            {
                array_delete(_loot_array, _i, 1)
                _i--
            }
            argument1 -= _amount_to_remove
            if (argument1 <= 0)
            {
                if (_dirty && is_in_hub())
                    gml_Script_db_force_save("pre_raid")
                return true;
            }
        }
        _i++
    }
    if (_dirty && is_in_hub())
        gml_Script_db_force_save("pre_raid")
    if is_in_hub()
    {
        _dirty = false
        var _c = 0
        repeat global.storage_slot_unlocked
        {
            _loot_array = db_read_ext("chest", ("chest_" + string(_c)), "items", [])
            _i = 0
            repeat array_length(_loot_array)
            {
                _loot = _loot_array[_i]
                if (_loot.item == argument0)
                {
                    _dirty = true
                    _amount_to_remove = min(_loot.quantity, argument1)
                    _loot.quantity -= _amount_to_remove
                    if (_loot.quantity <= 0)
                    {
                        array_delete(_loot_array, _i, 1)
                        _i--
                    }
                    argument1 -= _amount_to_remove
                    if (argument1 <= 0)
                    {
                        if _dirty
                            gml_Script_db_force_save("chest")
                        return true;
                    }
                }
                _i++
            }
            _c++
        }
        if _dirty
            gml_Script_db_force_save("chest")
    }
    return argument1 <= 0;
}

