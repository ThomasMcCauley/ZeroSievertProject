var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiTextButton", gml_Script_class_ui_text_button)
function class_ui_text_button() constructor //gml_Script_class_ui_text_button
{
    oversize = false
    __label = "???"
    __font = font_get_name(font_munro_32px)
    __xScale = 2.8
    __yScale = 2.6
    self.Set("size", [(__xScale * sprite_get_width(s_button_background)), (__yScale * sprite_get_height(s_button_background))])
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassButton)
    var _temp_local_var_3 = uiClassButton()
    self.CallbackSet((13 << 0), function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_1724_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        if oversize
        {
            __font = font_get_name(font_munro_64px)
            __xScale = 4
            __yScale = 4
            self.Set("size", [(__xScale * sprite_get_width(s_button_background)), (__yScale * sprite_get_height(s_button_background))])
        }
    }
)
    self.CallbackSet((0 << 0), function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2148_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_hover_rad, 15, false)
    }
)
    self.CallbackSet((7 << 0), function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2312_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_click_rad, 15, false)
    }
)
    self.VariableBind("label", function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2460_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        return __label;
    }
, function(argument0) //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2516_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        __label = language_get_string(argument0)
    }
)
    self.VariableBind("font", function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2619_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        return __font;
    }
, function(argument0) //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2674_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        __font = argument0
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_text_button_gml_GlobalScript_class_ui_text_button_2774_class_ui_text_button_gml_GlobalScript_class_ui_text_button
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        var _oldFont = draw_get_font()
        draw_set_colour(_color)
        draw_set_alpha(_alpha)
        draw_set_font_language(language_resolve_font(__font))
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        var _label = language_get_string(__label)
        if self.GetHover()
        {
            if (string_width(_label) > (__xScale * sprite_get_width(s_button_background)))
                __xScale = string_width(_label) / sprite_get_width(s_button_background) + 0.1
            draw_sprite_ext(s_button_background, 0, (0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom)), __xScale, __yScale, 0, _color, _alpha)
            _color = 0
        }
        draw_set_colour(_color)
        draw_set_alpha(_alpha)
        draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), _label)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_halign(fa_left)
    }
)
}

