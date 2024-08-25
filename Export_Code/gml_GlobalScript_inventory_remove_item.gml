var _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_db_force_save

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_force_save

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function inventory_remove_item(argument0, argument1) //gml_Script_inventory_remove_item
{
    db_open(inventory_target_db())
    var _loot_array = db_read("Inventory", "items", [])
    db_close()
    var _dirty = false
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.item == argument0)
        {
            _dirty = true
            var _amount_to_remove = min(argument1, _loot.quantity)
            _loot.quantity -= _amount_to_remove
            argument1 -= _amount_to_remove
            if (argument1 <= 0)
            {
            }
            else
            {
                _i++
                var _temp_local_var_3 = (array_length(_loot_array) - 1)
                if (array_length(_loot_array) - 1)
                    continue
            }
            break
        }
        else
            _i++
    }
    if (_dirty && is_in_hub())
        gml_Script_db_force_save("pre_raid")
}

