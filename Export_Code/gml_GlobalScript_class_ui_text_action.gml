var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiTextAction", gml_Script_class_ui_text_action)
function class_ui_text_action() constructor //gml_Script_class_ui_text_action
{
    dropShadow = false
    outlineThickness = 0
    gamepad_label = "interact"
    gamepad_label_offset_h = 0
    gamepad_label_offset_v = 0
    self.Set("font", font_get_name(font_munro_32px))
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassText)
    var _temp_local_var_3 = uiClassText()
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_text_action_gml_GlobalScript_class_ui_text_action_2243_class_ui_text_action_gml_GlobalScript_class_ui_text_action
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

        if (!obj_gamepad.last_input_keyboard)
        {
            var _kb_action = scr_gamepad_action_string_to_kb_enum(gamepad_label)
            draw_gamepad_action_button(_kb_action, (0.5 * (__drawLeft + __drawRight) + gamepad_label_offset_h * 4), (0.5 * (__drawTop + __drawBottom) + gamepad_label_offset_v * 4), 4, false)
        }
        else
        {
            var _label = language_get_string(__label)
            if dropShadow
            {
                draw_set_color(c_black)
                if (__wrap && __wrapWidth > 0)
                    draw_text_ext((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y + 4), _label, -1, __wrapWidth)
                else
                    draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y + 4), _label)
                draw_set_color(_color)
            }
            else if (outlineThickness > 0)
            {
                draw_set_color(c_black)
                var _x = 0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x
                var _y = 0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y
                var _d = 4 * outlineThickness
                if (__wrap && __wrapWidth > 0)
                {
                    draw_text_ext((_x - _d), _y, _label, -1, __wrapWidth)
                    draw_text_ext(_x, (_y - _d), _label, -1, __wrapWidth)
                    draw_text_ext((_x + _d), _y, _label, -1, __wrapWidth)
                    draw_text_ext(_x, (_y + _d), _label, -1, __wrapWidth)
                }
                else
                {
                    draw_text((_x - _d), _y, _label)
                    draw_text(_x, (_y - _d), _label)
                    draw_text((_x + _d), _y, _label)
                    draw_text(_x, (_y + _d), _label)
                }
                draw_set_color(_color)
            }
            if (__wrap && __wrapWidth > 0)
                draw_text_ext((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), _label, -1, __wrapWidth)
            else
                draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), _label)
        }
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

