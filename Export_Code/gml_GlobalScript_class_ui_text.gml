var _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___uiClassCommon

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___uiClassCommon

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiText", gml_Script_class_ui_text)
function class_ui_text() constructor //gml_Script_class_ui_text
{
    dropShadow = false
    outlineThickness = 0
    self.Set("font", font_get_name(font_munro_32px))
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassText)
    var _temp_local_var_3 = uiClassText()
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_text_gml_GlobalScript_class_ui_text_2136_class_ui_text_gml_GlobalScript_class_ui_text
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        var _oldFont = draw_get_font()
        draw_set_color(_color)
        draw_set_alpha(_alpha)
        draw_set_font_language(language_resolve_font(__font))
        switch hAlign
        {
            case "left":
                draw_set_halign(fa_left)
                break
            case "center":
            case "centre":
                draw_set_halign(fa_center)
                break
            case "right":
                draw_set_halign(fa_right)
                break
            default:
                __uiError("Unhandled value for .hAlign \"", hAlign, "\"")
                break
        }

        switch vAlign
        {
            case "top":
                draw_set_valign(fa_top)
                break
            case "middle":
                draw_set_valign(fa_middle)
                break
            case "bottom":
                draw_set_valign(fa_bottom)
                break
            default:
                __uiError("Unhandled value for .vAlign \"", vAlign, "\"")
                break
        }

        var _label = __label
        if (__wrap && __wrapWidth > 0)
            _label = text_split(__label, __wrapWidth, true)
        if dropShadow
        {
            draw_set_color(c_black)
            draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y + 4), _label)
            draw_set_color(_color)
        }
        else if (outlineThickness > 0)
        {
            draw_set_color(c_black)
            var _x = 0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x
            var _y = 0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y
            var _d = 4 * outlineThickness
            draw_text((_x - _d), _y, _label)
            draw_text(_x, (_y - _d), _label)
            draw_text((_x + _d), _y, _label)
            draw_text(_x, (_y + _d), _label)
            draw_set_color(_color)
        }
        draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), _label)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

