function inventory_check_weight() //gml_Script_inventory_check_weight
{
    with (player_get_local())
    {
        max_weight = 0
        player_weight = 0
        var _has_menu = gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.HasInputReceiver()
        if _has_menu
        {
            var _root = uiLayerGetRoot("inventory layer")
            if (!is_struct(_root))
                return;
            var _loot_array = gml_Script_uiFindAllType(_root, "class_ui_item")
        }
        else
            _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", [])
        var _i = 0
        repeat array_length(_loot_array)
        {
            var _loot = _loot_array[_i]
            if _has_menu
                _loot = _loot.__lootStruct
            if ((!loot_in_primary_weapon_slot(_loot)) && (!loot_in_secondary_weapon_slot(_loot)))
                player_weight += (item_get_weight(_loot.item) * _loot.quantity)
            _i++
        }
        max_weight = inventory_calculate_max_weight(backpack_now)
    }
}

