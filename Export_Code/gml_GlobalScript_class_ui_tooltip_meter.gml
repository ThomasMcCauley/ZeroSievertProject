var _temp_local_var_2;
gml_Script_uiAddBoxType("UiTooltipMeter", gml_Script_class_ui_tooltip_meter)
function class_ui_tooltip_meter() constructor //gml_Script_class_ui_tooltip_meter
{
    var _temp_local_var_2 = gml_Script___uiClassCommon()
    if @@CopyStatic@@(gml_Script___uiClassCommon)
    {
    }
    else
        function anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_2085_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter() //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_2085_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
        {
            var _oldFont = draw_get_font()
            draw_set_font_language(language_resolve_font(__font))
            self.Set("height", string_height("M"))
            draw_set_font_language(_oldFont)
        }

    color = 16777215
    alpha = 1
    value = 100
    valueMax = 100
    valueLabel = ""
    inverse = false
    __label = "???"
    __font = "font_munro_32px"
    self.Set("width", "100%")
    self.VariableBind("label", function() //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_1729_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
    {
        return __label;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_1785_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
    {
        __label = language_get_string(argument0)
        self.__UpdateSize()
    }
)
    self.VariableBind("font", function() //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_1913_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
    {
        return __font;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_1968_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
    {
        __font = argument0
        self.__UpdateSize()
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter_2329_class_ui_tooltip_meter_gml_GlobalScript_class_ui_tooltip_meter
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        _oldFont = draw_get_font()
        draw_set_color(_color)
        draw_set_alpha(_alpha)
        draw_set_font_language(language_resolve_font(__font))
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        draw_text((__drawLeft + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), __label)
        var _barLeft = floor(__drawLeft + 250)
        var _barTop = floor(0.5 * (__drawTop + __drawBottom) - 2 * sprite_get_height(s_hud_inv_stat))
        var _barRight = floor(_barLeft + 4 * sprite_get_width(s_hud_inv_stat))
        var _barBottom = floor(_barTop + 4 * sprite_get_height(s_hud_inv_stat))
        draw_sprite_ext(s_hud_inv_stat, 0, _barLeft, _barTop, 4, 4, 0, c_white, 1)
        if (value > 0)
        {
            var _q = clamp((inverse ? (1 - value / valueMax) : (value / valueMax)), 0, 1)
            _q = 4 * (round(_q * (_barRight - 4 - _barLeft) / 4))
            draw_rectangle(_barLeft, _barTop, (_barLeft + _q), (_barBottom - 1), false)
        }
        draw_sprite_ext(s_hud_inv_stat, 1, _barLeft, _barTop, 4, 4, 0, c_white, 1)
        draw_text((_barRight + global.language_font_offset.x + 20), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), valueLabel)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

