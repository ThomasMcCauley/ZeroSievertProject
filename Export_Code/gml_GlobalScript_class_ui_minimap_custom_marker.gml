var _temp_local_var_2, _temp_local_var_3;
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiGetData

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
gml_Script_uiAddBoxType("UiMinimapCustomMarker", gml_Script_class_ui_minimap_custom_marker)
function class_ui_minimap_custom_marker() constructor //gml_Script_class_ui_minimap_custom_marker
{
    markerID = undefined
    self.Set("size", [64, 64])
    self.Set("captureClick", "alt")
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script_uiClassButton)
    var _temp_local_var_3 = uiClassButton()
    self.CallbackSetButtonClick(function() //gml_Script_anon_class_ui_minimap_custom_marker_gml_GlobalScript_class_ui_minimap_custom_marker_845_class_ui_minimap_custom_marker_gml_GlobalScript_class_ui_minimap_custom_marker
    {
        if (markerID == undefined)
            return;
        gml_Script_uiGetData().marker_id = markerID
        gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/context_minimap_remove_marker.ui")
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_class_ui_minimap_custom_marker_gml_GlobalScript_class_ui_minimap_custom_marker_1077_class_ui_minimap_custom_marker_gml_GlobalScript_class_ui_minimap_custom_marker
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        draw_sprite_ext(s_minimap_marker, 0, (0.5 * (__drawLeft + __drawRight)), (0.5 * (__drawTop + __drawBottom)), 4, 4, 0, _color, _alpha)
    }
)
}

