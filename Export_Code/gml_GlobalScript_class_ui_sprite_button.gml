var _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiClassSpriteButton

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiClassSpriteButton

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiSpriteButton", gml_Script_class_ui_sprite_button)
function class_ui_sprite_button() constructor //gml_Script_class_ui_sprite_button
{
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassSpriteButton)
    var _temp_local_var_3 = gml_Script_uiClassSpriteButton()
    self.CallbackSet((0 << 0), function() //gml_Script_anon_class_ui_sprite_button_gml_GlobalScript_class_ui_sprite_button_2935_class_ui_sprite_button_gml_GlobalScript_class_ui_sprite_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_hover_rad, 15, false)
    }
)
    self.CallbackSet((7 << 0), function() //gml_Script_anon_class_ui_sprite_button_gml_GlobalScript_class_ui_sprite_button_3099_class_ui_sprite_button_gml_GlobalScript_class_ui_sprite_button
    {
        gml_Script_uiCallInherited()
        audio_play_sound(snd_button_click_rad, 15, false)
    }
)
}

