/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___uiXORShift32

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___uiXORShift32

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function minimap_add_custom_marker(argument0, argument1) //gml_Script_minimap_add_custom_marker
{
    var _minimap = gml_Script_uiFindRelaxed(uiLayerGetRoot("pda layer"), "minimap scroll box")
    if (_minimap != undefined)
    {
        var _id = __uiGenerateUUID4String()
        var _new_x = argument0 - ("worldLeft".("worldLeft").Get(_minimap) - _minimap.scrollX)
        var _new_y = argument1 - ("worldTop".("worldTop").Get(_minimap) - _minimap.scrollY)
        ds_list_add(global.list_minimap_marker_x, _new_x)
        ds_list_add(global.list_minimap_marker_y, _new_y)
        ds_list_add(global.list_minimap_marker_id, _id)
        gml_Script_uiOpenExisting(_minimap)
        uiOpen(gml_Script_class_ui_minimap_custom_marker)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("x", _new_x)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("y", _new_y)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("markerID", _id)
        gml_Script_uiClose()
        gml_Script_uiClose()
    }
}

