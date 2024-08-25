/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_loot_action_unload_now

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_loot_action_unload_now

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function loot_weapon_mod_remove(argument0, argument1) //gml_Script_loot_weapon_mod_remove
{
    if (argument0 == undefined)
        return;
    if (argument1 == undefined)
        return;
    var _mod_container = variable_struct_get(argument0, "mods")
    if (!is_struct(_mod_container))
        return;
    var _mod = loot_mod_cont_get(_mod_container, argument1)
    if (!item_exists(_mod))
        return false;
    if (argument1 == "magazine")
    {
        if (!(gml_Script_loot_action_unload_now(argument0, true)))
            return false;
    }
    if (argument1 == "barrel")
    {
        if item_exists(loot_weapon_get_mod(argument0, "brake"))
        {
            scr_draw_text_with_box("You have to uninstall the muzzle flash")
            return false;
        }
        if item_exists(loot_weapon_get_mod(argument0, "handguard"))
        {
            scr_draw_text_with_box("You have to uninstall the handguard")
            return false;
        }
    }
    if (argument1 == "handguard")
    {
        if (item_exists(loot_weapon_get_mod(argument0, "att_1")) || item_exists(loot_weapon_get_mod(argument0, "att_2")) || item_exists(loot_weapon_get_mod(argument0, "att_3")) || item_exists(loot_weapon_get_mod(argument0, "att_4")))
        {
            scr_draw_text_with_box("You have to uninstall the attachments on the handguard")
            return false;
        }
    }
    if (!global.general_debug)
    {
        if (!(inventory_check_for_space(_mod, 1)))
            scr_draw_text_with_box("Not enough inventory space!")
        else
        {
            inventory_add_item(_mod, 1)
            loot_mod_cont_delete(_mod_container, argument1)
        }
    }
    else
        loot_mod_cont_delete(_mod_container, argument1)
    return true;
}

