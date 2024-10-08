var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiPDAHpBar", gml_Script_class_ui_pda_hp_bar)
function class_ui_pda_hp_bar() constructor //gml_Script_class_ui_pda_hp_bar
{
    scale = 1
    alpha = 1
    mode = undefined
    self.Set("size", [230, 200])
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_pda_hp_bar_gml_GlobalScript_class_ui_pda_hp_bar_970_class_ui_pda_hp_bar_gml_GlobalScript_class_ui_pda_hp_bar
    {
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _player = player_get_local()
        switch mode
        {
            case "health":
                var _color = 0x2020AC
                var _value = ceil(_player.hp)
                var _max = ceil(_player.hp_max_total)
                var _wound_negative = true
                var _wound_color = 0x848484
                var _wound_value = floor((-_player.wound))
                var _wound_name = language_get_string("Wound")
                break
            case "stamina":
                _color = 0x6E9437
                _value = ceil(_player.stamina)
                _max = ceil(_player.stamina_max_total)
                _wound_negative = false
                _wound_color = 0x969696
                _wound_value = ceil(_player.fatigue)
                _wound_name = language_get_string("Fatigue")
                break
            default:
                trace_error("HP/Stamina preview mode \"", mode, "\" not recognised")
                break
        }

        var _old_color = draw_get_color()
        var _old_alpha = draw_get_alpha()
        var _old_font = draw_get_font()
        var _right_x = __drawLeft + 30
        var _y1 = __drawTop + 8
        var _y2 = __drawBottom - 8
        var _value_y = lerp(_y2, _y1, (_value / _max))
        var _wound_y = lerp(_y1, _y2, ((-_wound_value) / _max))
        draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thick, 0, __drawLeft, __drawTop, (_right_x - __drawLeft), (__drawBottom - __drawTop), merge_color(_color, c_black, 0.2), _alpha)
        draw_set_color(_color)
        draw_set_alpha(_alpha)
        draw_rectangle((__drawLeft + 8), _value_y, (_right_x - 8), _y2, false)
        language_set_font((4 << 0))
        draw_text((_right_x + 8 + global.language_font_offset.x), (__drawTop + global.language_font_offset.y), concat(_value, "/", string(_max)))
        if (_wound_value < 0)
        {
            draw_text((_right_x + 8 + global.language_font_offset.x), (__drawTop + global.language_font_offset.y + 40), concat(_wound_value, " ", _wound_name))
            draw_set_color(_wound_color)
            draw_rectangle((__drawLeft + 8), _y1, (_right_x - 8), _wound_y, false)
        }
        draw_set_color(_old_color)
        draw_set_alpha(_old_alpha)
        draw_set_font_language(_old_font)
    }
)
}

