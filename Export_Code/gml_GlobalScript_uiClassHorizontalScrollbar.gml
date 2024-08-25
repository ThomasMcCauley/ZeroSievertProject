var _error, _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiClassHorizontalSlider

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiClassHorizontalSlider

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiHorizontalScrollbar", gml_Script_uiClassHorizontalScrollbar, false)
function uiClassHorizontalScrollbar() constructor //gml_Script_uiClassHorizontalScrollbar
{
    __binding = undefined
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassHorizontalSlider)
    var _temp_local_var_3 = gml_Script_uiClassHorizontalSlider()
    self.VariableBind("value", function() //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_964_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        return value;
    }
, function(argument0) //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1018_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        __uiError("Cannot set \"value\" for scrollbars (set .scrollX for the scrollbox instead)")
    }
)
    self.VariableBind("valueMin", function() //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1187_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        return valueMin;
    }
, function(argument0) //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1244_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        __uiError("Cannot set .valueMin for scrollbars (set .scrollXMin for the scrollbox instead)")
    }
)
    self.VariableBind("valueMax", function() //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1416_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        return valueMax;
    }
, function(argument0) //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1473_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        __uiError("Cannot set .valueMax for scrollbars (set .scrollXMax for the scrollbox instead)")
    }
)
    self.VariableBind("binding", function() //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1644_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        return __binding;
    }
, function(argument0) //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_1702_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        if (!is_struct(argument0))
            __uiError("Must bind to a UiScrollBox (type=", typeof(argument0), ")")
        if (typeof(argument0) != "UiScrollBox" || typeof(argument0) != "UiScrollBoxCredits")
        {
            @@try_hook@@(832, 920)
            var _ = argument0.__captureClipChildren
            _ = argument0.__surface
            _ = argument0.__scrollDragOffsetX
            _ = argument0.__scrollDragOffsetY
            @@try_unhook@@()
        }
        __binding = argument0
        value = argument0.scrollX
        valueMin = argument0.scrollXMin
        valueMax = argument0.scrollXMax
    }
)
    self.CallbackSetOnValueChange(function(argument0) //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_2557_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        if (__binding != undefined)
            __binding.scrollX = argument0
    }
)
    self.CallbackSetValueUpdate(function() //gml_Script_anon_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar_2689_uiClassHorizontalScrollbar_gml_GlobalScript_uiClassHorizontalScrollbar
    {
        if (__binding != undefined)
        {
            valueMin = __binding.scrollXMin
            valueMax = __binding.scrollXMax
            return __binding.scrollX;
        }
    }
)
}

