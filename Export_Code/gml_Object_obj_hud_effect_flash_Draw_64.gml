draw_set_alpha(a)
var _col = c_white
if settings_get("black flashbang")
    _col = 0
draw_rectangle_color(-1, -1, (display_get_gui_width() + 1), (display_get_gui_height() + 1), _col, _col, _col, _col, false)
draw_set_alpha(1)
