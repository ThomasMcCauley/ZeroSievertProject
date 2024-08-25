/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_db_save_if_changed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_save_if_changed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function loot_decrement(argument0, argument1) //gml_Script_loot_decrement
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument1 <= 0)
        return;
    argument0.quantity -= argument1
    if (argument0.quantity <= 0)
    {
        argument0.quantity = 0
        db_open(inventory_target_db())
        var _loot_array = db_read("Inventory", "items", [])
        var _i = 0
        repeat array_length(_loot_array)
        {
            if (_loot_array[_i] == argument0)
            {
                array_delete(_loot_array, _i, 1)
                break
            }
            else
                _i++
        }
        db_write("Inventory", "items", _loot_array)
        db_close()
        if gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerExists("inventory layer")
        {
            var _ui_array = gml_Script_uiFindAllType(uiLayerGetRoot("inventory layer"), "class_ui_item")
            _i = 0
            repeat array_length(_ui_array)
            {
                if (_ui_array[_i].__lootStruct == argument0)
                    uiDestroy(_ui_array[_i])
                else
                    _i++
            }
        }
    }
}

