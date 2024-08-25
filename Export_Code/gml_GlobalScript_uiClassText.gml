var _temp_local_var_2;
gml_Script_uiAddBoxType("UiText", gml_Script_uiClassText, false)
function uiClassText() constructor //gml_Script_uiClassText
{
    var _temp_local_var_2 = gml_Script___uiClassCommon()
    if @@CopyStatic@@(gml_Script___uiClassCommon)
    {
    }
    else
        function anon_uiClassText_gml_GlobalScript_uiClassText_3048_uiClassText_gml_GlobalScript_uiClassText() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_3048_uiClassText_gml_GlobalScript_uiClassText
        {
            var _oldFont = draw_get_font()
            draw_set_font_language(language_resolve_font(__font))
            if (__wrap && __wrapWidth > 0)
                self.Set("size", [((string_width_ext(__label, -1, __wrapWidth)) + 2 * __margin), ((string_height_ext(__label, -1, __wrapWidth)) + 2 * __margin)])
            else
                self.Set("size", [(string_width(__label) + 2 * __margin), (string_height(__label) + 2 * __margin)])
            draw_set_font_language(_oldFont)
        }

    color = 16777215
    scale = 1
    alpha = 1
    hAlign = "center"
    vAlign = "middle"
    __label = "???"
    __margin = 0
    __font = "default"
    __wrap = false
    __wrapWidth = 999999
    self.VariableBind("label", function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2134_uiClassText_gml_GlobalScript_uiClassText
    {
        return __label;
    }
, function(argument0) //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2190_uiClassText_gml_GlobalScript_uiClassText
    {
        __label = language_get_string(argument0)
        self.__UpdateSize()
    }
)
    self.VariableBind("margin", function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2320_uiClassText_gml_GlobalScript_uiClassText
    {
        return __margin;
    }
, function(argument0) //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2377_uiClassText_gml_GlobalScript_uiClassText
    {
        __margin = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("font", function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2495_uiClassText_gml_GlobalScript_uiClassText
    {
        return __font;
    }
, function(argument0) //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2550_uiClassText_gml_GlobalScript_uiClassText
    {
        __font = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("wrap", function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2666_uiClassText_gml_GlobalScript_uiClassText
    {
        return __wrap;
    }
, function(argument0) //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2721_uiClassText_gml_GlobalScript_uiClassText
    {
        __wrap = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("wrapWidth", function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2842_uiClassText_gml_GlobalScript_uiClassText
    {
        return __wrapWidth;
    }
, function(argument0) //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_2902_uiClassText_gml_GlobalScript_uiClassText
    {
        __wrapWidth = argument0
        self.__UpdateSize()
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_uiClassText_gml_GlobalScript_uiClassText_3612_uiClassText_gml_GlobalScript_uiClassText
    {
        gml_Script_uiCallInherited()
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        _oldFont = draw_get_font()
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

        if (__wrap && __wrapWidth > 0)
            draw_text_ext((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), __label, -1, __wrapWidth)
        else
            draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), __label)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

