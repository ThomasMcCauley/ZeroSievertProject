function inventory_item_exists(argument0) //gml_Script_inventory_item_exists
{
    db_open(inventory_target_db())
    var _loot_array = db_read("Inventory", "items", [])
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.quantity > 0 && _loot.item == argument0)
        {
            db_close()
            return true;
        }
        _i++
    }
    db_close()
    return false;
}

