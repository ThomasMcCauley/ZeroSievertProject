function ui_inventory_check_weight() //gml_Script_ui_inventory_check_weight
{
    with (player_get_local())
    {
        max_weight = 0
        player_weight = 0
        var _root = uiLayerGetRoot("inventory layer")
        if (!is_struct(_root))
            return;
        var _loot_ui_array = gml_Script_uiFindAllType(_root, "class_ui_item")
        backpack_now = "no_item"
        var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", [])
        var _i = 0
        repeat array_length(_loot_array)
        {
            var _loot = _loot_array[_i++]
            if (_loot.quantity > 0)
            {
                var _placement = _loot.placement
                if (_placement == "backpack slot")
                    backpack_now = _loot.item
            }
        }
        max_weight = inventory_calculate_max_weight(backpack_now)
        _i = 0
        repeat array_length(_loot_ui_array)
        {
            var _loot_ui = _loot_ui_array[_i]
            _loot = variable_struct_get(_loot_ui, "__lootStruct")
            if (!is_struct(_loot))
                trace("Warning! Can't find loot for \"", _loot_ui, "\"")
            else
            {
                var _identifier = "parent".("parent").Get(_loot_ui).identifier
                if (_identifier != "other inventory" && _identifier != "sell inventory")
                {
                    if ((!loot_in_primary_weapon_slot(_loot)) && (!loot_in_secondary_weapon_slot(_loot)))
                        player_weight += (item_get_weight(_loot.item) * _loot.quantity)
                }
            }
            _i++
        }
    }
}

