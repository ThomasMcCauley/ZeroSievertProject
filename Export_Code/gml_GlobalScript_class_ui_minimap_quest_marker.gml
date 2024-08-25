var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiMinimapQuestMarker", gml_Script_class_ui_minimap_quest_marker)
function class_ui_minimap_quest_marker() constructor //gml_Script_class_ui_minimap_quest_marker
{
    markerIndex = undefined
    color = c_yellow
    self.Set("size", [1, 1])
    self.CallbackSetButtonStart(undefined)
    self.CallbackSetButtonEnd(undefined)
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassButton)
    var _temp_local_var_3 = uiClassButton()
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_minimap_quest_marker_gml_GlobalScript_class_ui_minimap_quest_marker_1005_class_ui_minimap_quest_marker_gml_GlobalScript_class_ui_minimap_quest_marker
    {
        var _pos = ds_list_find_value(global.list_obj_marker_quest_pos, markerIndex)
        if (global.quest_state[_pos].state == "active")
        {
            var _color = merge_color(color, animBlend, animBlendAmount)
            var _alpha = alpha * animAlpha
            draw_sprite_ext(s_marker_cerchio, ds_list_find_value(global.list_obj_marker_sub, markerIndex), (0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom)), 4, 4, 0, _color, _alpha)
            if (__tooltip_popup_text != "")
            {
                language_set_font((3 << 0))
                draw_set_halign(fa_center)
                draw_set_valign(fa_middle)
                scr_draw_text_outlined((0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom)), language_get_string(__tooltip_popup_text), c_white, c_black, 1, 1)
            }
        }
    }
)
}

