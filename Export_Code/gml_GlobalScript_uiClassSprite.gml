var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiSprite", gml_Script_uiClassSprite, false)
function uiClassSprite() constructor //gml_Script_uiClassSprite
{
    color = c_white
    scale = 1
    alpha = 1
    image = 0
    stretch = false
    __sprite = undefined
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.VariableBind("sprite", function() //gml_Script_anon_uiClassSprite_gml_GlobalScript_uiClassSprite_1448_uiClassSprite_gml_GlobalScript_uiClassSprite
    {
        return __sprite;
    }
, function(argument0) //gml_Script_anon_uiClassSprite_gml_GlobalScript_uiClassSprite_1505_uiClassSprite_gml_GlobalScript_uiClassSprite
    {
        if (is_string(argument0) && _debugStruct.__relaxedSprites)
            argument0 = asset_get_index(argument0)
        __sprite = argument0
        if (__sprite != undefined && sprite_exists(__sprite))
            self.Set("size", [sprite_get_width(__sprite), sprite_get_height(__sprite)])
        else
            self.Set("size", [0, 0])
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_uiClassSprite_gml_GlobalScript_uiClassSprite_2001_uiClassSprite_gml_GlobalScript_uiClassSprite
    {
        if (__sprite != undefined && sprite_exists(__sprite))
        {
            var _image = image
            if is_bool(_image)
                _image = real(_image)
            var _color = merge_color(color, animBlend, animBlendAmount)
            var _scale = scale * animScale
            var _alpha = alpha * animAlpha
            if stretch
                draw_sprite_stretched_ext(__sprite, image, __drawLeft, __drawTop, (__localRight - __localLeft), (__localBottom - __localTop), _color, _alpha)
            else
            {
                var _x = 0.5 * (__drawLeft + __drawRight) + sprite_get_xoffset(__sprite) - (__localRight - __localLeft) / 2
                var _y = 0.5 * (__drawTop + __drawBottom) + sprite_get_yoffset(__sprite) - (__localBottom - __localTop) / 2
                draw_sprite_ext(__sprite, image, _x, _y, 1, 1, 0, _color, _alpha)
            }
        }
    }
)
}

