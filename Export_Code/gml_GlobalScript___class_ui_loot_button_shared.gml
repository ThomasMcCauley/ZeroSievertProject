var _temp_local_var_2;
function __class_ui_loot_button_shared() constructor //gml_Script___class_ui_loot_button_shared
{
    var _temp_local_var_2 = uiClassButton()
    if @@CopyStatic@@(gml_Script_uiClassButton)
    {
    }
    else
        function anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_1614___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared(argument0) //gml_Script_anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_1614___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared
        {
            var _position = self.self.FindEmptyPlace(argument0)
            if (_position == undefined)
            {
                self.Destroy()
                return false;
            }
            self.ParentChange(argument0)
            self.Set("x", _position[0])
            self.Set("y", _position[1])
            ui_inventory_check_weight()
            return true;
        }

    highlightTracked = false
    highlightReward = false
    __is_reward = false
    __lootStruct = undefined
    __tooltipTimer = 20
    self.Set("captureClick", "action")
    self.CallbackSetHover(function() //gml_Script_anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_2046___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared
    {
        gml_Script_uiCallInherited()
        if (__tooltipTimer > 0)
            __tooltipTimer--
        else if (!self.GetButton("action"))
        {
            gml_Script_uiGetData().tooltip_loot = __lootStruct
            if (!is_undefined(gml_Script_uiOnionCurrent()))
                gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().TooltipEnsureOver("ZS_vanilla/ui/tooltip_item.ui", "tooltip", gml_Script_uiOnionCurrentLayer())
        }
    }
)
    self.CallbackSetHoverEnd(function() //gml_Script_anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_2503___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared
    {
        gml_Script_uiCallInherited()
        __tooltipTimer = 20
    }
)
    self.CallbackSetButtonClick(function(argument0) //gml_Script_anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_2632___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared
    {
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared_2715___class_ui_loot_button_shared_gml_GlobalScript___class_ui_loot_button_shared
    {
        var _rotation = (self.GetDragging() ? __dragRotation : undefined)
        if (highlightTracked && item_is_tracked(loot_get_item(__lootStruct)))
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, 0x30FFFF)
        else if (self.GetButton() || self.GetHover())
        {
            var _borderColor = merge_color(c_orange, c_white, 0.2)
            if self.GetButton()
                _borderColor = merge_color(_borderColor, c_white, 0.2)
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, _borderColor)
        }
        else if (gml_Script_uiGetData().reward_item == __lootStruct.item && highlightReward)
            loot_draw_highlight(__lootStruct, __drawLeft, __drawTop, _rotation, 4, c_green)
        else
            gml_Script_loot_draw(__lootStruct, __drawLeft, __drawTop, _rotation, 4, color, alpha)
        if (__lootStruct.quantity > 1)
        {
            var _oldFont = draw_get_font()
            language_set_font((4 << 0))
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

