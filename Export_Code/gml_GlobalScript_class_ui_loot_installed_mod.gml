var _temp_local_var_2, _temp_local_var_3;
function class_ui_loot_installed_mod() constructor //gml_Script_class_ui_loot_installed_mod
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___class_ui_loot_button_shared)
    var _temp_local_var_3 = __class_ui_loot_button_shared()
    self.VariableBind("loot", function() //gml_Script_anon_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod_1707_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod
    {
        return __lootStruct;
    }
, function(argument0) //gml_Script_anon_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod_1768_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod
    {
        __lootStruct = argument0
        var _sprite = item_get_sprite_inv(__lootStruct.item)
        self.Set("ltrb", [(4 * __lootStruct.x), (4 * __lootStruct.y), (4 * (__lootStruct.x + sprite_get_width(_sprite) - 1)), (4 * (__lootStruct.y + sprite_get_height(_sprite) - 1))])
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod_2211_class_ui_loot_installed_mod_gml_GlobalScript_class_ui_loot_installed_mod
    {
        if (self.GetButton() || self.GetHover())
        {
            var _borderColor = merge_color(c_orange, c_white, 0.2)
            if self.GetButton()
                _borderColor = merge_color(_borderColor, c_white, 0.2)
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, (self.GetDragging() ? __dragRotation : undefined), 4, _borderColor)
        }
        else
            gml_Script_loot_draw(__lootStruct, __drawLeft, __drawTop, (self.GetDragging() ? __dragRotation : undefined), 4, color, alpha)
        if (__lootStruct.quantity > 1)
        {
            var _oldFont = draw_get_font()
            draw_set_font_language(14)
            draw_set_halign(fa_right)
            draw_set_valign(fa_bottom)
            draw_set_color(c_black)
            draw_text((__drawRight + global.language_font_offset.x), (__drawBottom + global.language_font_offset.y + 16 + 4), __lootStruct.quantity)
            draw_set_color(c_white)
            draw_text((__drawRight + global.language_font_offset.x), (__drawBottom + global.language_font_offset.y + 16), __lootStruct.quantity)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            draw_set_font_language(_oldFont)
        }
    }
)
}

