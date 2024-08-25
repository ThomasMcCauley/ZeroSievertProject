var _temp_local_var_2;
gml_Script_uiAddBoxType("UiTooltipText", gml_Script_class_ui_tooltip_text)
function class_ui_tooltip_text() constructor //gml_Script_class_ui_tooltip_text
{
    var _temp_local_var_2 = gml_Script___uiClassCommon()
    if @@CopyStatic@@(gml_Script___uiClassCommon)
    {
    }
    else
        function anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2992_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2992_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
        {
            if (__collapsible && (__value == undefined || __value == 0))
                self.Set("height", 0)
            else
            {
                var _oldFont = draw_get_font()
                draw_set_font_language(language_resolve_font(__font))
                self.Set("height", string_height("M"))
                draw_set_font_language(_oldFont)
            }
        }

    color = c_white
    alpha = 1
    colorize = false
    valueLabel = "???"
    inverse = false
    addPlusSign = false
    __label = "???"
    __font = "font_munro_32px"
    __value = 0
    __collapsible = false
    self.VariableBind("label", function() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2270_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        return __label;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2326_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        __label = language_get_string(argument0)
        self.__UpdateSize()
    }
)
    self.VariableBind("font", function() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2454_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        return __font;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2509_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        __font = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("value", function() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2626_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        return __value;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2682_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        __value = argument0
        self.__UpdateSize()
    }
)
    self.VariableBind("collapsible", function() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2806_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        return __collapsible;
    }
, function(argument0) //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_2868_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        __collapsible = argument0
        self.__UpdateSize()
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text_3415_class_ui_tooltip_text_gml_GlobalScript_class_ui_tooltip_text
    {
        if (__collapsible && (__value == undefined || __value == 0 || __value == "0"))
            return;
        var _color = merge_color(c_white, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        _oldFont = draw_get_font()
        draw_set_color(_color)
        draw_set_alpha(_alpha)
        draw_set_font_language(language_resolve_font(__font))
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        draw_text((__drawLeft + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), language_get_string(__label))
        if colorize
        {
            if inverse
            {
                if (__value > 0)
                    _color = 0x5959EC
                else if (__value < 0)
                    _color = 0x93D693
            }
            else if (__value < 0)
                _color = 0x5959EC
            else if (__value > 0)
                _color = 0x93D693
        }
        else
            _color = color
        _color = merge_color(_color, animBlend, animBlendAmount)
        draw_set_color(_color)
        var _valueLabel = language_get_string(string(valueLabel))
        if (addPlusSign && __value > 0)
            _valueLabel = "+" + _valueLabel
        draw_text((__drawLeft + global.language_font_offset.x + gml_Script_uiGetData().tooltip_column_x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), _valueLabel)
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

