if (over_node_id != noone)
{
    var _node_id = over_node_id.my_id
    var _name = global.node_name[_node_id]
    language_set_font((0 << 0))
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_text((over_node_id.x + global.language_font_offset.x), (over_node_id.y + global.language_font_offset.y - 16), _name)
}
with (gml_Script___uiGlobal().__defaultOnion)
{
    if (self.InputGetMode() == "directional")
        return;
}
draw_sprite(s_mouse, 4, obj_cursor.aa_x, obj_cursor.aa_y)
