var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiButton", gml_Script_uiClassButton, false)
function uiClassButton() constructor //gml_Script_uiClassButton
{
    color = 16777215
    alpha = 1
    scale = 1
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.CallbackSetHoverStart(function() //gml_Script_anon_uiClassButton_gml_GlobalScript_uiClassButton_1135_uiClassButton_gml_GlobalScript_uiClassButton
    {
        self.HoverStateSet(true)
    }
)
    self.CallbackSetHoverEnd(function() //gml_Script_anon_uiClassButton_gml_GlobalScript_uiClassButton_1223_uiClassButton_gml_GlobalScript_uiClassButton
    {
        self.HoverStateSet(false)
    }
)
    self.CallbackSetButtonStart(function(argument0) //gml_Script_anon_uiClassButton_gml_GlobalScript_uiClassButton_1315_uiClassButton_gml_GlobalScript_uiClassButton
    {
        self.ButtonStateSet(argument0, true)
    }
)
    self.CallbackSetButtonEnd(function(argument0) //gml_Script_anon_uiClassButton_gml_GlobalScript_uiClassButton_1417_uiClassButton_gml_GlobalScript_uiClassButton
    {
        self.ButtonStateSet(argument0, false)
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_uiClassButton_gml_GlobalScript_uiClassButton_1515_uiClassButton_gml_GlobalScript_uiClassButton
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        draw_set_color(c_black)
        draw_set_alpha(_alpha)
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        draw_set_color(_color)
        if self.GetButton()
        {
            draw_set_alpha(0.5 * _alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        }
        else if self.GetHover()
        {
            draw_set_alpha(0.25 * _alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        }
        if (_alpha > 0)
        {
            draw_set_alpha(_alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true)
        }
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
    }
)
}

