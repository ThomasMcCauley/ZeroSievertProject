function scr_draw_geiger_counter() //gml_Script_scr_draw_geiger_counter
{
    if (!player_exists_local())
        return;
    var rx = player_get_local().x div 8
    var ry = (player_get_local().y + 8) div 8
    var c = 0
    if is_in_raid()
    {
        if instance_exists(obj_map_generator)
        {
            c = ds_grid_get(obj_map_generator.grid_radiation, rx, ry)
            if (!is_undefined(c))
                c = round(c)
        }
    }
    if (!is_undefined(c))
    {
        var angle_off = 0
        if (c > 15)
            angle_off = pda_geiger_counter_angle_offset
        var _rad_max_counter = 500
        var g_counter_angle = 180 * (-c) / _rad_max_counter + angle_off
        var counter_x = 430
        var counter_y = 99
        draw_sprite_ext(s_pda_counter, 0, counter_x, counter_y, 1, 1, g_counter_angle, c_white, 1)
        var amount_x = 450
        var amount_y = 131
        language_set_font((0 << 0))
        draw_set_halign(fa_right)
        draw_set_valign(fa_top)
        var rad_t = string(c) + " mSv"
        draw_text((amount_x + global.language_font_offset.x), (amount_y + global.language_font_offset.y), rad_t)
    }
}

