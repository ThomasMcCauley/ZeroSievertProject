display_set_gui_size(480, 270)
language_set_font((0 << 0))
draw_set_halign(fa_center)
draw_set_valign(fa_top)
var startx = draw_x + global.language_font_offset.x
var starty = draw_y + global.language_font_offset.y
scr_draw_box(s_box_testo_pop_up, startx, starty, bb_w, bb_h, 1)
draw_text((startx + bb_w / 2), (starty + 4), t)
if (room == r_menu)
    display_set_gui_size(1920, 1080)
