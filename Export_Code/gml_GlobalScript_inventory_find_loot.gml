function inventory_find_loot(argument0) //gml_Script_inventory_find_loot
{
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", [])
    var _i = 0
    repeat array_length(_loot_array)
    {
        if (variable_struct_get(array_get(_loot_array, _i), "placement") == argument0)
            return _loot_array[_i];
        _i++
    }
    return undefined;
}

