var _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiCallInherited

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiCallInherited

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_loot_action_unload_now

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_loot_action_unload_now

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function class_ui_loot_modding() constructor //gml_Script_class_ui_loot_modding
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___class_ui_loot_button_shared)
    var _temp_local_var_3 = __class_ui_loot_button_shared()
    self.VariableBind("loot", function() //gml_Script_anon_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding_1701_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding
    {
        return __lootStruct;
    }
, function(argument0) //gml_Script_anon_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding_1762_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding
    {
        __lootStruct = argument0
        var _sprite = item_get_sprite_inv(__lootStruct.item)
        self.Set("ltrb", [(4 * __lootStruct.x), (4 * __lootStruct.y), (4 * (__lootStruct.x + sprite_get_width(_sprite) - 1)), (4 * (__lootStruct.y + sprite_get_height(_sprite) - 1))])
    }
)
    self.CallbackSetButtonClick(function(argument0) //gml_Script_anon_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding_2198_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding
    {
        if loot_weapon_mod_add(gml_Script_uiGetData().modding_loot, __lootStruct, gml_Script_uiGetData().modding_mod_pos)
            ui_modding_populate(gml_Script_uiGetData().modding_mod_pos)
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding_2496_class_ui_loot_modding_gml_GlobalScript_class_ui_loot_modding
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

