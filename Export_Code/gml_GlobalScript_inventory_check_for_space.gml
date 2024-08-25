var _temp_local_var_3;
function inventory_check_for_space(argument0, argument1) //gml_Script_inventory_check_for_space
{
    if (argument1 == undefined)
        argument1 = 1
    var _loot_array = SnapDeepCopy(db_read_ext(inventory_target_db(), "Inventory", "items", []))
    var _loot_grid = new class_loot_grid(8, 11)
    _loot_array._loot_array.PlaceFromInventoryLootArray(_loot_grid)
    var _success = true
    var _stack_max = item_get_stack_max(argument0)
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.item == argument0)
        {
            var _amount_to_add = max(0, min((_stack_max - _loot.quantity), argument1))
            argument1 -= _amount_to_add
            if (argument1 <= 0)
            {
            }
            else
            {
                _i++
                var _temp_local_var_3 = (array_length(_loot_array) - 1)
                if (array_length(_loot_array) - 1)
                    continue
            }
            break
        }
        else
            _i++
    }
    while (argument1 > 0)
    {
        argument1 -= min(_stack_max, argument1)
        var _position = argument0.argument0.TryPlace(_loot_grid)
        if is_struct(_position)
        {
            _loot = new class_loot(argument0, argument1, (16 * _position.x), (16 * _position.y), 0, "player inventory")
            _position.x._position.x.Place(_position.y, _loot, _loot_grid)
            continue
        }
        else
        {
            _success = false
            break
        }
    }
    _loot_grid._loot_grid.Destroy()
    return _success;
}

