var _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiCallInherited

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
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
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiAddBoxType

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiCallInherited

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiVerticalScrollbar", gml_Script_class_ui_vertical_scrollbar)
function class_ui_vertical_scrollbar() constructor //gml_Script_class_ui_vertical_scrollbar
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassVerticalScrollbar)
    var _temp_local_var_3 = uiClassVerticalScrollbar()
    self.CallbackSet((13 << 0), function() //gml_Script_anon_class_ui_vertical_scrollbar_gml_GlobalScript_class_ui_vertical_scrollbar_949_class_ui_vertical_scrollbar_gml_GlobalScript_class_ui_vertical_scrollbar
    {
        handleWidth = 60
        handleHeight = 24
        gml_Script_uiCallInherited()
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_vertical_scrollbar_gml_GlobalScript_class_ui_vertical_scrollbar_1156_class_ui_vertical_scrollbar_gml_GlobalScript_class_ui_vertical_scrollbar
    {
        var _oldValue = value
        var _newValue = (self.__CallbackExists((23 << 0)) ? self.__CallbackGet((23 << 0)).self.__CallbackGet((23 << 0)).__Call(self) : undefined)
        if (_newValue != undefined && _newValue != _oldValue)
        {
            value = _newValue
            self.__UpdateHandle(false)
        }
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _handleLeft = __handleLeft + __drawLeft
        var _handleTop = __handleTop + __drawTop
        var _handleRight = __handleRight + __drawLeft
        var _handleBottom = __handleBottom + __drawTop
        var _handleX = 0.5 * (_handleLeft + _handleRight)
        var _handleY = 0.5 * (_handleTop + _handleBottom)
        if (uiPointerIsDirectional() && self.GetHover())
        {
            if self.GetButton()
                draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thin, 0, (__drawLeft - 10), (__drawTop - 10), (20 + __drawRight - __drawLeft), (20 + __drawBottom - __drawTop), _color, _alpha)
            else
                draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thin, 0, (__drawLeft - 14), (__drawTop - 14), (28 + __drawRight - __drawLeft), (28 + __drawBottom - __drawTop), _color, _alpha)
        }
        draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thick, 0, __drawLeft, __drawTop, (__drawRight - __drawLeft), (__drawBottom - __drawTop), _color, _alpha)
        draw_sprite_ext(s_hud_slider_point, ((self.GetHover() && (!uiPointerIsDirectional())) || self.GetButton()), _handleX, _handleY, 4, 4, 90, _color, _alpha)
    }
)
}

