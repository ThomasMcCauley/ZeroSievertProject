/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_inventory_use_quick_slot

System.Exception: Reentered block with different amount of vars on stack (Entry: 1, Actual Count: 0)
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 78
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_inventory_use_quick_slot

System.Exception: Reentered block with different amount of vars on stack (Entry: 1, Actual Count: 0)
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 78
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function player_action_quick_slot() //gml_Script_player_action_quick_slot
{
    if global.kb_pressed[(17 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 1")
        global.last_quick_slot_pressed = "quick slot 1"
        return true;
    }
    else if global.kb_pressed[(18 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 2")
        global.last_quick_slot_pressed = "quick slot 2"
        return true;
    }
    else if global.kb_pressed[(19 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 3")
        global.last_quick_slot_pressed = "quick slot 3"
        return true;
    }
    else if global.kb_pressed[(20 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 4")
        global.last_quick_slot_pressed = "quick slot 4"
        return true;
    }
    else if global.kb_pressed[(21 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 5")
        global.last_quick_slot_pressed = "quick slot 5"
        return true;
    }
    else if global.kb_pressed[(22 << 0)]
    {
        gml_Script_inventory_use_quick_slot("quick slot 6")
        global.last_quick_slot_pressed = "quick slot 6"
        return true;
    }
    return false;
}

