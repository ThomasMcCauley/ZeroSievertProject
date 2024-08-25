var _temp_local_var_2, _temp_local_var_3;
gml_Script_uiAddBoxType("UiVideo", gml_Script_uiClassVideo, false)
function uiClassVideo() constructor //gml_Script_uiClassVideo
{
    source = undefined
    loop = true
    color = 16777215
    alpha = 1
    backup_image = spr_videoreplacement_mainmenu
    var _temp_local_var_2 = @@CopyStatic@@(gml_Script___uiClassCommon)
    var _temp_local_var_3 = gml_Script___uiClassCommon()
    self.CallbackSetOnClose(function() //gml_Script_anon_uiClassVideo_gml_GlobalScript_uiClassVideo_1047_uiClassVideo_gml_GlobalScript_uiClassVideo
    {
        video_open(source)
        video_enable_loop(loop)
    }
)
    self.CallbackSetDraw(function() //gml_Script_anon_uiClassVideo_gml_GlobalScript_uiClassVideo_1164_uiClassVideo_gml_GlobalScript_uiClassVideo
    {
        var _color = merge_color(color, animBlend, animBlendAmount)
        var _alpha = alpha * animAlpha
        var _video = video_draw()
        if (_video[0] == 0 && (!global.is_steamdeck))
            draw_surface_stretched_ext(_video[1], __drawLeft, __drawTop, (__localRight - __localLeft), (__localBottom - __localTop), _color, _alpha)
        else
        {
            draw_sprite_stretched_ext(backup_image, 0, __drawLeft, __drawTop, (__localRight - __localLeft), (__localBottom - __localTop), _color, _alpha)
            video_close()
        }
    }
)
}

