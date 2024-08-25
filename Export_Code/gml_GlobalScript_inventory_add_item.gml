var _temp_local_var_3;
function inventory_add_item(argument0, argument1, argument2, argument3) //gml_Script_inventory_add_item
{
    if (argument2 == undefined)
        argument2 = 100
    if (argument3 == undefined)
        argument3 = "inventory"
    if (!is_string(argument0))
        trace_error("Ammo ID must be a string (datatype=", typeof(argument0), ", value=", argument0, ")")
    if (!is_numeric(argument1))
        trace_error("Ammo quantity must be a number (datatype=", typeof(argument1), ", value=", argument1, ")")
    if (argument1 <= 0)
        return true;
    var _stack_max = item_get_stack_max(argument0)
    var _dirty = false
    db_open(inventory_target_db())
    var _loot_array = db_read("Inventory", "items", [])
    db_close()
    var _i = -1
    for (var i = 0; i < array_length(global.__legacy_inventory_hotspots); i++)
    {
        if (global.__legacy_inventory_hotspots[i].name == argument3)
            _i = i
    }
    if (_i == -1)
        argument3 = "inventory"
    if (argument3 == "inventory")
    {
        _i = 0
        repeat array_length(_loot_array)
        {
            var _loot = _loot_array[_i]
            if (_loot.item == argument0)
            {
                _dirty = true
                var _amount_to_add = max(0, min((_stack_max - _loot.quantity), argument1))
                _loot.quantity += _amount_to_add
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
        if (argument1 > 0)
        {
            var _loot_grid = new class_loot_grid(8, 11)
            while (argument1 > 0)
            {
                _loot_array._loot_array.PlaceFromInventoryLootArray(_loot_grid)
                var _position = argument0.argument0.TryPlace(_loot_grid)
                if is_struct(_position)
                {
                    _dirty = true
                    _amount_to_add = min(_stack_max, argument1)
                    argument1 -= _amount_to_add
                    _loot = new class_loot(argument0, _amount_to_add, (_position.x * 16), (_position.y * 16), 0, "player inventory")
                    loot_set_from_chest(_loot, true, argument2)
                    array_push(_loot_array, _loot)
                    if gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerExists("inventory layer")
                    {
                        var _destination_struct = gml_Script_uiFind(uiLayerGetRoot("inventory layer"), "player inventory")
                        gml_Script_uiOpenExisting(_destination_struct)
                        uiOpen(gml_Script_class_ui_item)
                        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _loot)
                        gml_Script_uiClose()
                        gml_Script_uiClose()
                    }
                    continue
                }
                else
                {
                    var _player = player_get_local()
                    if (!instance_exists(_player))
                        return;
                    var _target = instance_create_depth(_player.x, _player.y, (-_player.y), obj_chest_general)
                    _target.tipo = "discard"
                    _loot = new class_loot(argument0, argument1, 0, 0, 0, "player inventory")
                    loot_set_from_chest(_loot, true, argument2)
                    var _chest_loot_array = [_loot]
                    db_open("all loot")
                    var _chest_name = "chest_" + string(_target.id)
                    db_write(_chest_name, "chest_x", _target.x)
                    db_write(_chest_name, "chest_y", _target.y)
                    db_write(_chest_name, "items", _chest_loot_array)
                    db_close()
                    break
                }
            }
            _loot_grid._loot_grid.Destroy()
        }
    }
    else
    {
        _i = -1
        i = 0
        while (i < array_length(global.__legacy_inventory_hotspots))
        {
            if (global.__legacy_inventory_hotspots[i].name == argument3)
            {
                _i = i
                break
            }
            else
            {
                i++
                continue
            }
        }
        var _hotspot_data = global.__legacy_inventory_hotspots[_i]
        var _hotspot_x = _hotspot_data.x
        var _hotspot_y = _hotspot_data.y
        var _hotspot_w = _hotspot_data.width
        var _hotspot_h = _hotspot_data.height
        if (argument3 == "quick slot 1" || argument3 == "quick slot 2" || argument3 == "quick slot 3" || argument3 == "quick slot 4" || argument3 == "quick slot 5" || argument3 == "quick slot 6")
        {
            _hotspot_x = 0
            _hotspot_y = 0
        }
        _position = 
        {
            x: _hotspot_x,
            y: _hotspot_y
        }

        _loot = new class_loot(argument0, argument1, _position.x, _position.y, 0, argument3)
        loot_set_from_chest(_loot, true, argument2)
        array_push(_loot_array, _loot)
    }
    if (_dirty && is_in_hub())
        gml_Script_db_force_save("pre_raid")
    return _dirty;
}

