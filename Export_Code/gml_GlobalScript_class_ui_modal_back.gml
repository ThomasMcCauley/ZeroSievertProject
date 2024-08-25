var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiModalBack", gml_Script_class_ui_modal_back)
function class_ui_modal_back() constructor //gml_Script_class_ui_modal_back
{
    color = 16777215
    alpha = 1
    scale = 1
    __sprite = 2193
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.VariableBind("sprite", function() //gml_Script_anon_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back_1245_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back
    {
        return __sprite;
    }
, function(argument0) //gml_Script_anon_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back_1302_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back
    {
        if (is_string(argument0) && _debugStruct.__relaxedSprites)
            argument0 = asset_get_index(argument0)
        __sprite = argument0
    }
)
    self.CallbackSet((12 << 0), function() //gml_Script_anon_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back_1548_class_ui_modal_back_gml_GlobalScript_class_ui_modal_back
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _scale = scale * animScale
        draw_sprite_stretched_ext(__sprite, 0, __drawLeft, __drawTop, (__drawRight - __drawLeft), (__drawBottom - __drawTop), _color, _alpha)
    }
)
}

