var _temp_local_var_5;
function inventory_check_for_space_for_quest(argument0, argument1) //gml_Script_inventory_check_for_space_for_quest
{
    if (argument1 == undefined)
        argument1 = 1
    if (!is_array(argument0))
        argument0 = [argument0]
    var _loot_array = SnapDeepCopy(db_read_ext(inventory_target_db(), "Inventory", "items", []))
    var _loot_grid = new class_loot_grid(8, 11)
    _loot_array._loot_array.PlaceFromInventoryLootArray(_loot_grid)
    var _success = true
    var _j = 0
    repeat array_length(argument0)
    {
        var _item_data = argument0[_j]
        var _item_id = _item_data.item
        var _item_quantity = _item_data.amount
        _item_quantity = clamp(ceil(_item_quantity * argument1), 1, 999)
        var _stack_max = item_get_stack_max(_item_id)
        var _i = 0
        repeat array_length(_loot_array)
        {
            var _loot = _loot_array[_i]
            if (_loot.item == _item_id)
            {
                var _amount_to_add = max(0, min((_stack_max - _loot.quantity), _item_quantity))
                _item_quantity -= _amount_to_add
                if (_item_quantity <= 0)
                {
                }
                else
                {
                    _i++
                    var _temp_local_var_5 = (array_length(_loot_array) - 1)
                    if (array_length(_loot_array) - 1)
                        continue
                }
                break
            }
            else
                _i++
        }
        if (_item_quantity > 0)
        {
            _item_quantity -= min(_stack_max, _item_quantity)
            var _position = _item_id._item_id.TryPlace(_loot_grid)
            if is_struct(_position)
            {
                _loot = new class_loot(_item_id, _item_quantity, (16 * _position.x), (16 * _position.y), 0, "player inventory")
                _position.x._position.x.Place(_position.y, _loot, _loot_grid)
                while (_item_quantity > 0)
                {
                    _item_quantity -= min(_stack_max, _item_quantity)
                    var _position = _item_id._item_id.TryPlace(_loot_grid)
                    if is_struct(_position)
                    {
                        _loot = new class_loot(_item_id, _item_quantity, (16 * _position.x), (16 * _position.y), 0, "player inventory")
                        _position.x._position.x.Place(_position.y, _loot, _loot_grid)
                        continue
                    }
                    else
                    {
                        _success = false
                        break
                    }
                }
            }
            else
                _success = false
        }
        _j++
    }
    _loot_grid._loot_grid.Destroy()
    return _success;
}

