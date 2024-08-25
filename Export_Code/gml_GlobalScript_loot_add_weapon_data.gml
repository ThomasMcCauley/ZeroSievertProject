/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function loot_add_weapon_data(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_loot_add_weapon_data
{
    if (argument1 == undefined)
        argument1 = item_weapon_get_ammo(argument0.item)
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = item_weapon_get_fire_mode(item)
    if (argument4 == undefined)
        argument4 = undefined
    if (argument5 == undefined)
        argument5 = false
    if (!is_string(argument1))
        trace_error("Ammo ID must be a string (datatype=", typeof(argument1), ", value=", argument1, ")")
    if (!is_numeric(argument2))
        trace_error("Ammo quantity must be a number (datatype=", typeof(argument2), ", value=", argument2, ")")
    with (argument0)
    {
        ammo_id = argument1
        ammo_quantity = argument2
        weapon_fire_mode = argument3
        jammed = argument5
        if (argument4 == undefined)
        {
            argument4 = loot_mod_cont_create()
            loot_mod_cont_copy_from_default(argument4, argument0.item)
        }
        mods = argument4
    }
}

