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
function surface_cache_fetch_weapon(argument0, argument1, argument2) //gml_Script_surface_cache_fetch_weapon
{
    var _key = concat(argument0, ":", argument1, ":", argument2)
    var _surface_data = surface_cache_fetch(_key)
    var _surface = _surface_data.__surface
    if (!surface_exists(_surface))
    {
        _surface = surface_create(96, 32)
        _surface_data.__surface = _surface
        surface_set_target(_surface)
        draw_clear_alpha(c_black, 0)
        if argument2
        {
            gpu_set_fog(true, c_black, 0, 0)
            gml_Script_item_weapon_draw_modded(argument0, argument1, -2, 0)
            gml_Script_item_weapon_draw_modded(argument0, argument1, 0, -2)
            gml_Script_item_weapon_draw_modded(argument0, argument1, 2, 0)
            gml_Script_item_weapon_draw_modded(argument0, argument1, 0, 2)
            gml_Script_item_weapon_draw_modded(argument0, argument1, -1, -1)
            gml_Script_item_weapon_draw_modded(argument0, argument1, 1, -1)
            gml_Script_item_weapon_draw_modded(argument0, argument1, -1, 1)
            gml_Script_item_weapon_draw_modded(argument0, argument1, 1, 1)
            gpu_set_fog(false, c_fuchsia, 0, 0)
            gml_Script_item_weapon_draw_modded(argument0, argument1)
        }
        else
            gml_Script_item_weapon_draw_modded(argument0, argument1)
        surface_reset_target()
    }
    return _surface;
}

