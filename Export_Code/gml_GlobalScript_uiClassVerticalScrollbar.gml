var _error, _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiClassVerticalSlider

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiClassVerticalSlider

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiVerticalScrollbar", gml_Script_uiClassVerticalScrollbar, false)
function uiClassVerticalScrollbar() constructor //gml_Script_uiClassVerticalScrollbar
{
    __binding = undefined
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassVerticalSlider)
    var _temp_local_var_3 = gml_Script_uiClassVerticalSlider()
    self.VariableBind("value", function() //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_884_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        return value;
    }
, function(argument0) //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_938_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        __uiError("Cannot set \"value\" for scrollbars (set .scrollY for the scrollbox instead)")
    }
)
    self.VariableBind("valueMin", function() //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1107_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        return valueMin;
    }
, function(argument0) //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1164_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        __uiError("Cannot set .valueMin for scrollbars (set .scrollYMin for the scrollbox instead)")
    }
)
    self.VariableBind("valueMax", function() //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1336_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        return valueMax;
    }
, function(argument0) //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1393_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        __uiError("Cannot set .valueMax for scrollbars (set .scrollYMax for the scrollbox instead)")
    }
)
    self.VariableBind("binding", function() //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1564_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        return __binding;
    }
, function(argument0) //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_1622_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
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
        value = argument0.scrollY
        valueMin = argument0.scrollYMin
        valueMax = argument0.scrollYMax
        pushIncrement = (valueMax - valueMin) / 20
    }
)
    self.CallbackSetOnValueChange(function(argument0) //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_2535_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        if (__binding != undefined)
            __binding.scrollY = argument0
    }
)
    self.CallbackSetValueUpdate(function() //gml_Script_anon_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar_2667_uiClassVerticalScrollbar_gml_GlobalScript_uiClassVerticalScrollbar
    {
        if (__binding != undefined)
        {
            valueMin = __binding.scrollYMin
            valueMax = __binding.scrollYMax
            return __binding.scrollY;
        }
    }
)
}

