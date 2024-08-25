var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiDnDTarget", gml_Script_uiClassDnDTarget, false)
function uiClassDnDTarget() constructor //gml_Script_uiClassDnDTarget
{
    color = c_white
    scale = 1
    alpha = 1
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.CallbackSetCanHover(function() //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_669_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        return self.GetAnyDragging();
    }
)
    self.CallbackSetHoverStart(function() //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_763_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        self.HoverStateSet(true)
    }
)
    self.CallbackSetHoverEnd(function() //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_851_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        self.HoverStateSet(false)
    }
)
    self.CallbackSetDnDCanReceive(function(argument0) //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_945_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        return (!self.HasChildren());
    }
)
    self.CallbackSetDnDOnReceive(function(argument0) //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_1059_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        self.self.ParentChange(argument0)
        "x".("x").Set((0.5 * (__localRight - __localLeft)), argument0)
        "y".("y").Set((0.5 * (__localBottom - __localTop)), argument0)
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget_1311_uiClassDnDTarget_gml_GlobalScript_uiClassDnDTarget
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _scale = scale * animScale
        var _alpha = alpha * animAlpha
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        draw_set_color(c_black)
        draw_set_alpha(_alpha)
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        draw_set_color(_color)
        if self.GetButton()
        {
            draw_set_color(color)
            draw_set_alpha(0.5 * _alpha)
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false)
        }
        else if self.GetHover()
        {
            draw_set_color(color)
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

