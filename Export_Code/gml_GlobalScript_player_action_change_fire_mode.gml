/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_fire_mode

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_fire_mode

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function player_action_change_fire_mode() //gml_Script_player_action_change_fire_mode
{
    var _t_ammo = language_get_string(item_get_name(gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now)))
    if (item_weapon_get_fire_mode(arma_now) == "automatic")
    {
        if (gml_Script_player_loadout_get_fire_mode(self, weapon_slot_now) == "automatic")
        {
            var _t = (language_get_string("Fire mode: semi-automatic")) + " (" + _t_ammo + ")"
            player_loadout_set_fire_mode(weapon_slot_now, "semi_automatic")
            scr_draw_text_with_box(_t, false)
        }
        else
        {
            _t = (language_get_string("Fire mode: automatic")) + " (" + _t_ammo + ")"
            player_loadout_set_fire_mode(weapon_slot_now, "automatic")
            scr_draw_text_with_box(_t, false)
        }
    }
    else
        scr_draw_text_with_box(_t_ammo, false)
    return true;
}

