/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_item_weapon_draw_modded

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_item_weapon_draw_modded

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___surface_cache

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___surface_cache

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function loot_draw_precache(argument0) //gml_Script_loot_draw_precache
{
    if (!is_struct(argument0))
        return;
    with (argument0)
    {
        if item_weapon_get_moddable(item)
            surface_cache_fetch_weapon(item, mods, false)
    }
}

