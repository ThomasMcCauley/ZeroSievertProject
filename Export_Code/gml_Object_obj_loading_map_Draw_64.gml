display_set_gui_size(480, 270)
if (obj_map_generator.state != (20 << 0))
{
    var _image = s_loading_forest
    switch obj_map_generator.area
    {
        case (1 << 0):
            _image = s_loading_forest
            break
        case (2 << 0):
            _image = s_loading_makeshift_camp
            break
        case (3 << 0):
            _image = s_loading_industrial_area
            break
        case (4 << 0):
            _image = s_loading_swamp
            break
        case (6 << 0):
            _image = s_loading_mall
            break
    }

    display_set_gui_size(1920, 1080)
    draw_sprite(_image, 0, 0, 0)
    display_set_gui_size(480, 270)
    var bar_sprite = s_hud_loading_bar_2
    var step_max = (19 << 0)
    var step = obj_map_generator.state
    var barw = sprite_get_width(bar_sprite)
    var barh = sprite_get_height(bar_sprite)
    var barx = 240 - barw / 2
    var bary = 240
    var c2 = c_white
    var _off = 7
    var c1 = c_black
    draw_set_alpha(0.5)
    draw_rectangle_color(0, (bary - _off * 1.5), 480, (bary + barh + _off), c1, c1, c1, c1, false)
    draw_set_alpha(1)
    draw_sprite_ext(bar_sprite, 0, barx, bary, 1, 1, 0, c_white, 1)
    var step_now = barw * step / step_max
    draw_sprite_part(bar_sprite, 1, 0, 0, step_now, barh, barx, bary)
    var t_ = ""
    switch obj_map_generator.state
    {
        case (0 << 0):
            t_ = "Preparing"
            break
        case (1 << 0):
            t_ = "Generating tearrain"
            break
        case (2 << 0):
            t_ = "Generating railroad and road"
            break
        case (3 << 0):
            t_ = "Generating terrain variants"
            break
        case (4 << 0):
            t_ = "Autotiling of the road and railroad"
            break
        case (5 << 0):
            t_ = "Choosing train's stop position"
            break
        case (6 << 0):
            t_ = "General grid adjustment"
            break
        case (7 << 0):
            t_ = "Generating water"
            break
        case (8 << 0):
            t_ = "Autotiling of the terrain"
            break
        case (9 << 0):
            t_ = "Generating solid object"
            break
        case (10 << 0):
            t_ = "Placing building - may take a while"
            break
        case (11 << 0):
            t_ = "Placing building - may take a while"
            break
        case (12 << 0):
            t_ = "Generating environment"
            break
        case (13 << 0):
            t_ = "General adjustment"
            break
        case (14 << 0):
            t_ = "Generating dynamic grass"
            break
        case (15 << 0):
            t_ = "Generating shadows and minimap"
            break
        case (16 << 0):
            t_ = "Generate Dynamic NPC"
            break
        case (17 << 0):
            t_ = "Calculating dynamic NPC path"
            break
        case (18 << 0):
            t_ = "Almost ready"
            break
        case (19 << 0):
            break
    }

    language_set_font((0 << 0))
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    c2 = c_white
    draw_text_color((barx + global.language_font_offset.x), (bary + global.language_font_offset.y - 8), (language_get_string(t_) + "..."), c2, c2, c2, c2, 1)
    language_set_font((0 << 0))
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_alpha(0.5)
    c2 = c_white
    var _text = text_split(language_get_string(global.suggerimento_text[tip]), 400, true)
    draw_rectangle_color(0, (215 + global.language_font_offset.y - string_height(_text) - 4), 480, (215 + global.language_font_offset.y), c1, c1, c1, c1, false)
    draw_set_alpha(1)
    draw_text_color((240 + global.language_font_offset.x), (215 + global.language_font_offset.y - string_height(_text) * 0.5), _text, c2, c2, c2, c2, 1)
}
if (obj_map_generator.state == (19 << 0))
{
    language_set_font((0 << 0))
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    c2 = c_white
    _text = language_get_string("continue")
    if (!obj_gamepad.last_input_keyboard)
    {
        var _str_w = string_width(_text)
        draw_gamepad_action_button((6 << 0), (232 - _str_w / 2), 66.5, 1, false)
    }
    else
        _text = "[Space] " + _text
    draw_text_color((240 + global.language_font_offset.x), (67.5 + global.language_font_offset.y), _text, c2, c2, c2, c2, 1)
}
if (obj_map_generator.state == (20 << 0))
{
    c1 = c_black
    draw_set_alpha(alpha_screen)
    draw_rectangle_color(0, 0, 480, 270, c1, c1, c1, c1, false)
    draw_set_alpha(1)
}
if global.general_debug
{
    language_set_font((0 << 0))
    draw_set_halign(fa_right)
    draw_set_valign(fa_top)
    draw_text((400 + global.language_font_offset.x), (1 + global.language_font_offset.y), ("seed: " + string(global.map_seed)))
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}
display_set_gui_size(1920, 1080)
