/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiFindRelaxed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiFindRelaxed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function ui_convert_loot_to_element(argument0, argument1, argument2, argument3) //gml_Script_ui_convert_loot_to_element
{
    if (argument2 == undefined)
        argument2 = argument0.placement
    if (argument3 == undefined)
        argument3 = uiLayerGetRoot("inventory layer")
    if (argument0.quantity <= 0)
    {
        trace("Failed to convert loot to element, quantity is less than 0")
        return undefined;
    }
    var _ui = undefined
    var _destination_struct = gml_Script_uiFindRelaxed(argument3, argument2)
    if (_destination_struct != undefined)
    {
        gml_Script_uiOpenExisting(_destination_struct)
        _ui = uiOpen(argument1)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", argument0)
        gml_Script_uiClose()
        gml_Script_uiClose()
    }
    else
        trace(["Failed to find _destination_struct for ui_convert_loot_to_element", ("Placement: " + string(argument2))])
    return _ui;
}

