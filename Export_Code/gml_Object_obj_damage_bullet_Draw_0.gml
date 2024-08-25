language_set_font((0 << 0))
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text((x + global.language_font_offset.x), (y + global.language_font_offset.y), (text + " " + string(dmg)))
