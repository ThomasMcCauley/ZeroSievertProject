draw_clear(c_black)
var _video_state = video_draw()
var _video_status = _video_state[0]
if (_video_status == 0)
    draw_surface(_video_state[1], 0, 0)
if show_prompt
    prompt_alpha = clamp((prompt_alpha + 0.1), 0, 1)
else
    prompt_alpha = clamp((prompt_alpha - 0.05), 0, 1)
if global.is_steamdeck
{
    if (prompt_alpha == 0 && prompt_seen == false)
        draw_sprite(spr_videoreplacement_splashscreen, 0, 0, 0)
}
if (prompt_alpha > 0)
{
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    language_set_font((0 << 0))
    draw_set_alpha(prompt_alpha)
    var _text = language_get_string("continue")
    if ((!obj_gamepad.last_input_keyboard) || global.is_steamdeck)
    {
        var _str_w = string_width(_text) * 4
        draw_gamepad_action_button((6 << 0), ((floor(display_get_gui_width() / 2)) - 30 - _str_w / 2), ((floor(display_get_gui_height() / 1.5)) - 6), 4, false)
    }
    else
        _text = "[Space] " + _text
    draw_text_transformed(((floor(display_get_gui_width() / 2)) + global.language_font_offset.x), ((floor(display_get_gui_height() / 1.5)) + global.language_font_offset.y), _text, 4, 4, 0)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_alpha(1)
    prompt_seen = true
}
