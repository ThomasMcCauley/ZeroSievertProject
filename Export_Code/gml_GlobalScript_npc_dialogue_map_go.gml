/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_loot_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_loot_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function npc_dialogue_map_is_unlocked() //gml_Script_npc_dialogue_map_is_unlocked
{
    var _map = gml_Script_uiGetData().map_selected
    if (!global.general_debug)
    {
        switch _map
        {
            case (2 << 0):
                return quest_is_complete("unlock_makeshift_camp");
            case (3 << 0):
                return quest_is_complete("kill_orel");
            case (4 << 0):
                return quest_is_complete("kill_orel");
            case (6 << 0):
                return quest_is_complete("gate_sewer");
            case (9 << 0):
                scr_draw_text_with_box("In development")
                break
        }

    }
    return true;
}

function npc_dialogue_map_go() //gml_Script_npc_dialogue_map_go
{
    _map = gml_Script_uiGetData().map_selected
    if (!global.general_debug)
    {
        switch _map
        {
            case (2 << 0):
                if (!quest_is_complete("unlock_makeshift_camp"))
                {
                    scr_draw_text_with_box("Not yet unlocked")
                    return;
                }
                break
            case (3 << 0):
                if (!quest_is_complete("kill_orel"))
                {
                    scr_draw_text_with_box("Not yet unlocked")
                    return;
                }
                break
            case (4 << 0):
                if (!quest_is_complete("kill_orel"))
                {
                    scr_draw_text_with_box("Not yet unlocked")
                    return;
                }
                break
            case (6 << 0):
                if (!quest_is_complete("gate_sewer"))
                {
                    scr_draw_text_with_box("Not yet unlocked")
                    return;
                }
                break
            case (9 << 0):
                scr_draw_text_with_box("In development")
                return;
        }

    }
    db_open("raid")
    db_write("Map", "Map id", _map)
    db_close()
    scr_save_skill_and_base()
    scr_save_exp()
    scr_save_time()
    scr_save_player_status()
    faction_save()
    quest_save()
    var _value = inventory_get_total_value()
    db_open("pre_raid")
    db_write("inventory_value", "pre_raid", _value)
    db_close()
    ga_addDesignEvent("Key:Pressed:Up")
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", [])
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if loot_in_primary_weapon_slot(_loot)
            ga_addDesignEvent(("WeaponUsed:" + scr_ga_get_name(_loot.item)), 1)
        else if loot_in_secondary_weapon_slot(_loot)
            ga_addDesignEvent(("WeaponUsed:" + scr_ga_get_name(_loot.item)), 1)
        else if loot_in_backpack_slot(_loot)
            ga_addDesignEvent(("BackpackUsed:" + scr_ga_get_name(_loot.item)), 1)
        else if loot_in_armor_slot(_loot)
            ga_addDesignEvent(("ArmorUsed:" + scr_ga_get_name(_loot.item)), 1)
        else if loot_in_headset_slot(_loot)
            ga_addDesignEvent(("HeadsetUsed:" + scr_ga_get_name(_loot.item)), 1)
        _i++
    }
    inventory_handle_pre_raid_backup(true)
    inventory_set_target_db_to_raid()
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Clear()
    room_goto(room1)
}

