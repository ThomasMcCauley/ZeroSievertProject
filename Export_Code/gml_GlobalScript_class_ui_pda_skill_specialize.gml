var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiPDASkillSpecialize", gml_Script_class_ui_pda_skill_specialize)
function class_ui_pda_skill_specialize() constructor //gml_Script_class_ui_pda_skill_specialize
{
    __skill = undefined
    self.Set("size", [310, 58])
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassButton)
    var _temp_local_var_3 = uiClassButton()
    self.VariableBind("skill", function() //gml_Script_anon_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize_1165_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize
    {
        return __skill;
    }
, function(argument0) //gml_Script_anon_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize_1221_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize
    {
        __skill = argument0
        if (skill_get_index(__skill) == undefined)
            __uiError("Skill name \"", __skill, "\" not recognised")
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize_1418_class_ui_pda_skill_specialize_gml_GlobalScript_class_ui_pda_skill_specialize
    {
        var _oldColor = draw_get_color()
        var _oldAlpha = draw_get_alpha()
        var _oldFont = draw_get_font()
        draw_set_color(0x91F2FF)
        draw_set_halign(fa_center)
        language_set_font((4 << 0))
        draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (__drawTop + global.language_font_offset.y), skill_get_name(__skill))
        draw_set_color(c_white)
        draw_set_valign(fa_middle)
        language_set_font((4 << 0))
        draw_text_ext((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y + 20), skill_get_description_a(__skill), -3, (__drawRight - __drawLeft - 10))
        if self.GetHover()
            draw_sprite_stretched(s_pda_hover_frame_9slice, 0, (__drawLeft - 10), (__drawTop - 10), (__drawRight - __drawLeft + 20), (__drawBottom - __drawTop + 20))
        draw_set_color(_oldColor)
        draw_set_alpha(_oldAlpha)
        draw_set_font_language(_oldFont)
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
    }
)
}

