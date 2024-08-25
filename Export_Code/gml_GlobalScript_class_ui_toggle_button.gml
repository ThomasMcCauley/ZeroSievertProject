var _temp_local_var_2;
gml_Script_uiAddBoxType("UiToggleButton", gml_Script_class_ui_toggle_button)
function class_ui_toggle_button() constructor //gml_Script_class_ui_toggle_button
{
    var _temp_local_var_2 = uiClassButton()
    if @@CopyStatic@@(gml_Script_uiClassButton)
    {
    }
    else
        function anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3719_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3719_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
        {
            var _oldFont = draw_get_font()
            draw_set_font_language(language_resolve_font(__font))
            if (__wrap && __wrapWidth > 0)
                self.Set("size", [((string_width_ext(__label, -1, __wrapWidth)) + 2 * __marginH), ((string_height_ext(__label, -1, __wrapWidth)) + 2 * __marginV)])
            else
                self.Set("size", [(string_width(__label) + 2 * __marginH), (string_height(__label) + 2 * __marginV)])
            draw_set_font_language(_oldFont)
        }

    hAlign = "center"
    vAlign = "middle"
    backgroundColor = c_white
    backgroundAlpha = 0
    __label = "???"
    __marginH = 10
    __marginV = 2
    __font = font_get_name(font_munro_32px)
    __wrap = false
    __wrapWidth = 999999
    self.__UpdateSize()
    self.VariableBind("label", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2298_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __label;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2354_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __label = language_get_string(argument0)
        self.__UpdateSize()
    }
)
    self.VariableBind("marginH", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2485_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __marginH;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2543_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __marginH = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("marginV", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2665_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __marginV;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2723_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __marginV = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("font", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2842_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __font;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_2897_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __font = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("wrap", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3010_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __wrap;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3065_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __wrap = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("wrapWidth", function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3186_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        return __wrapWidth;
    }
, function(argument0) //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3246_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        __wrapWidth = argument0
        self.__UpdateSize()
    }
)
    self.CallbackSet((0 << 0), function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3395_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_hover_rad, 15, false)
    }
)
    self.CallbackSet((7 << 0), function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_3559_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_click_rad, 15, false)
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button_4283_class_ui_toggle_button_gml_GlobalScript_class_ui_toggle_button
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        _oldFont = draw_get_font()
        if (backgroundAlpha > 0 && (!self.GetHover()))
        {
            draw_set_colour(backgroundColor)
            draw_set_alpha(backgroundAlpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
            draw_set_colour(_oldColor)
        }
        var _text_x = 0.5 * (__drawLeft + __drawRight)
        var _text_y = 0.5 * (__drawTop + __drawBottom)
        switch hAlign
        {
            case "left":
                draw_set_halign(fa_left)
                _text_x = __drawLeft
                break
            case "center":
            case "centre":
                draw_set_halign(fa_center)
                break
            case "right":
                draw_set_halign(fa_right)
                _text_x = __drawRight
                break
            default:
                __uiError("Unhandled value for .hAlign \"", hAlign, "\"")
                break
        }

        switch vAlign
        {
            case "top":
                draw_set_valign(fa_top)
                _text_y = __drawTop
                break
            case "middle":
                draw_set_valign(fa_middle)
                break
            case "bottom":
                draw_set_valign(fa_bottom)
                _text_y = __drawBottom
                break
            default:
                __uiError("Unhandled value for .vAlign \"", vAlign, "\"")
                break
        }

        if self.GetHover()
        {
            draw_set_colour(_color)
            draw_set_alpha(_alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
            _color = 0
        }
        draw_set_colour(_color)
        draw_set_alpha(_alpha)
        draw_set_font_language(language_resolve_font(__font))
        draw_text_ext((_text_x + global.language_font_offset.x), (_text_y + global.language_font_offset.y), __label, -1, __wrapWidth)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_halign(fa_left)
    }
)
}

