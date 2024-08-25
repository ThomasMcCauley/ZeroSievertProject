function npc_dialogue_free_equipment() //gml_Script_npc_dialogue_free_equipment
{
    var _can_get_equipment = false
    var _money = global.player_money
    _money += (inventory_get_total_value() * gml_Script_difficulty_get("trade_sell_mult"))
    _money += (stash_get_total_value() * gml_Script_difficulty_get("trade_sell_mult"))
    var _min_amount = 10000
    if (_money <= _min_amount)
        _can_get_equipment = true
    var _is_scamming = false
    var _already_given = false
    var _money_chest = 0
    with (obj_chest_general)
    {
        if (tipo == "discard")
        {
            var _loot_array = db_read_ext("all loot", ("chest_" + string(id)), "items", [])
            var _i = 0
            repeat array_length(_loot_array)
            {
                _money_chest += loot_get_value(_loot_array[_i])
                _i++
            }
            _money_chest *= gml_Script_difficulty_get("trade_sell_mult")
        }
    }
    if (_can_get_equipment == true)
    {
        if ((_money + _money_chest) > _min_amount)
        {
            _can_get_equipment = false
            _is_scamming = true
        }
    }
    var _hardcore = false
    var _equipment = gml_Script_difficulty_get("hardcore_lose_equipment")
    var _ammo = gml_Script_difficulty_get("hardcore_lose_ammo")
    var _med = gml_Script_difficulty_get("hardcore_lose_medication")
    var _consumable = gml_Script_difficulty_get("hardcore_lose_consumable")
    if ((_equipment + _med + _consumable) > 0)
        _hardcore = true
    if (global.can_get_free_equipment == false)
    {
        _can_get_equipment = false
        _already_given = true
    }
    if (_can_get_equipment == true)
    {
        if _equipment
        {
            inventory_add_item("makarov", 1)
            inventory_add_item("backpack9", 1)
        }
        if (_equipment && _ammo)
            inventory_add_item("ammo_9x18", 75)
        if _med
        {
            inventory_add_item("bandage", 4)
            inventory_add_item("medikit_long", 2)
            inventory_add_item("pills_anti_rad", 2)
        }
        if _consumable
        {
            inventory_add_item("water_bottle_rotten", 1)
            inventory_add_item("water_bottle_rotten", 1)
            inventory_add_item("water_bottle", 1)
            inventory_add_item("tushonka_meat", 1)
            inventory_add_item("tushonka_meat", 1)
            inventory_add_item("bread", 1)
        }
        global.can_get_free_equipment = false
        db_open("general")
        db_write("Can get free equipment", "value", global.can_get_free_equipment)
        db_close()
    }
    if (_can_get_equipment == true && _hardcore == true && _is_scamming == false && _already_given == false)
    {
        gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete(gml_Script_uiOnionCurrentLayer())
        player_set_local_state(gml_Script_scr_player_state_move)
        scr_draw_npc_text(obj_tradr_bar, (154 << 0))
    }
    if (_can_get_equipment == false && _hardcore == true && _is_scamming == false && _already_given == false)
    {
        gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete(gml_Script_uiOnionCurrentLayer())
        player_set_local_state(gml_Script_scr_player_state_move)
        scr_draw_npc_text(obj_tradr_bar, (152 << 0))
    }
    if (_can_get_equipment == false && _hardcore == true && _is_scamming == true && _already_given == false)
    {
        gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete(gml_Script_uiOnionCurrentLayer())
        player_set_local_state(gml_Script_scr_player_state_move)
        scr_draw_npc_text(obj_tradr_bar, (155 << 0))
    }
    if (_can_get_equipment == false && _hardcore == true && _already_given == true)
    {
        gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete(gml_Script_uiOnionCurrentLayer())
        player_set_local_state(gml_Script_scr_player_state_move)
        scr_draw_npc_text(obj_tradr_bar, (157 << 0))
    }
    if (_hardcore == false)
        scr_draw_text_with_box("You can only receive equipment by activating hardcore difficulty options")
}

