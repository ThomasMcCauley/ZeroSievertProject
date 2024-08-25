var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiPDASkillBar", gml_Script_class_ui_pda_skill_bar)
function class_ui_pda_skill_bar() constructor //gml_Script_class_ui_pda_skill_bar
{
    __skill = undefined
    self.Set("size", [310, 58])
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassButton)
    var _temp_local_var_3 = uiClassButton()
    self.VariableBind("skill", function() //gml_Script_anon_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar_1149_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar
    {
        return __skill;
    }
, function(argument0) //gml_Script_anon_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar_1205_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar
    {
        __skill = argument0
        if (skill_get_index(__skill) == undefined)
            __uiError("Skill name \"", __skill, "\" not recognised")
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar_1402_class_ui_pda_skill_bar_gml_GlobalScript_class_ui_pda_skill_bar
    {
        var _oldFont = draw_get_font()
        language_set_font((4 << 0))
        if ((self.GetHover() || skill_get_index(gml_Script_uiGetData().skill_chosen) == skill_get_index(__skill)) && skill_can_specialize(__skill))
        {
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            draw_text((0.5 * (__drawLeft + __drawRight) + global.language_font_offset.x), (0.5 * (__drawTop + __drawBottom) + global.language_font_offset.y), "Specialize")
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
        }
        else
        {
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            var _statIndex = skill_get_specialization(__skill)
            draw_text((__drawLeft + global.language_font_offset.x), (__drawTop - 10 + global.language_font_offset.y), skill_get_name(_statIndex))
            var _level = skill_get_level(_statIndex)
            var _width = 4 * sprite_get_width(s_pda_skill_level) + 8
            var _x = 0
            var _i = 0
            repeat skill_get_max_level(_statIndex)
            {
                draw_sprite_ext(s_pda_skill_level, _i < floor(_level), (__drawLeft + _x), (__drawTop + 32), 4, 4, 0, c_white, 1)
                _x += _width
                _i++
            }
        }
        if self.GetHover()
            draw_sprite_stretched(s_pda_hover_frame_9slice, 0, (__drawLeft - 10), (__drawTop - 10), (__drawRight - __drawLeft + 20), (__drawBottom - __drawTop + 20))
        draw_set_font_language(_oldFont)
    }
)
}

