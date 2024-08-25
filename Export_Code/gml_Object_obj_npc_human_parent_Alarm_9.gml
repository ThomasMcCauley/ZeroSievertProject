/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_difficulty_get

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_difficulty_get

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
event_inherited()
if (hp_set == false)
{
    hp *= gml_Script_difficulty_get("enemy_human_hp")
    hp = clamp(hp, 1, 99999)
    hp_set = true
}
linked_weapon_id = instance_create_depth(x, y, 0, obj_npc_weapon)
linked_weapon_id.follow_id = id
if (item_get_category(arma_now) == "weapon")
{
    if (item_weapon_get_type(arma_now) == "shotgun")
        tipo_arma_equipped = (0 << 0)
    if (item_weapon_get_type(arma_now) == "pistol" || item_weapon_get_type(arma_now) == "smg" || item_weapon_get_type(arma_now) == "rifle")
        tipo_arma_equipped = (1 << 0)
    if (item_weapon_get_type(arma_now) == "sniper" || item_weapon_get_type(arma_now) == "dmr")
        tipo_arma_equipped = (2 << 0)
}
