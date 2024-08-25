/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_chest_clean_up_position

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_chest_clean_up_position

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_inventory_clean_up_position

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_inventory_clean_up_position

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
if keybind_active
    keybind_update()
else if (black_overlay_alpha <= 0.6 && gml_Script_game_in_focus())
    ui_handle_input(1)
if (!audio_group_is_loaded(14))
    audio_group_load(14)
if ((!audio_is_playing(snd_main_menu_2)) && audio_group_is_loaded(14))
    audio_play_sound(snd_main_menu_2, 20, false)
gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Step()
if ((!window_focused) && gml_Script_game_in_focus())
{
    if (room == r_menu)
    {
        mm_init_slot_metadata()
        var _root = uiLayerGetRoot("root")
        if (gml_Script_uiFindRelaxed(_root, "saveslot frame") != undefined)
            gml_Script_uiFind(_root, "sidebar frame").gml_Script_uiFind(_root, "sidebar frame").ReplaceFromFile("ZS_vanilla/ui/mm_sidebar_saveslots.ui")
    }
    else if (false && global.database_cloud_conflict == 0)
    {
        if (db_cloud_enabled() && db_get_save_hash("shared") != db_cloud_get_hash(db_get_filename("shared")))
        {
            db_cloud_sync_all(1)
            settings_reload_and_apply()
            reload_main_menu()
        }
    }
}
window_focused = gml_Script_game_in_focus()
if (keyboard_check_pressed(vk_f5) && keyboard_check(vk_control))
{
    global.slot_selected = 1
    scr_aggiorna_save_slot(global.slot_selected)
    saveslot_reload()
    inventory_handle_pre_raid_backup(true)
    inventory_set_target_db_to_raid()
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Clear()
    room_goto(test_room)
}
