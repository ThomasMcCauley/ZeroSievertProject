var arr_x;
if (!player_exists_local())
    return;
var _player = player_get_local()
var _player_faction = _player.faction
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
if global.general_debug
{
    if keyboard_check_direct(ord("I"))
    {
        draw_set_alpha(0.5)
        mp_grid_draw(global.grid_move)
        draw_set_alpha(1)
    }
}
if (_player.reloading && _player.hp >= 0)
    scr_draw_text_sopra_character(_player, language_get_string("Reloading!"))
if is_in_raid()
{
    if (global.sk_k[(13 << 0)] == true)
    {
        arr_x[0] = -999
        var i = 0
        var off = 10
        with (obj_npc_parent)
        {
            if (x < camx || x > (camx + 480) || y < camy || y > (camy + 270))
            {
                arr_x[i] = x
                arr_y[i] = y
                var _rep = faction_get_rep(faction, _player_faction)
                if (_rep < global.faction_min)
                    arr_rel[i] = 1
                if (_rep >= global.faction_min && _rep < global.faction_max)
                    arr_rel[i] = 0
                if (_rep > global.faction_max)
                    arr_rel[i] = 2
                i++
            }
        }
        if (arr_x[0] != -999)
        {
            for (i = 0; i < array_length(arr_x); i++)
            {
                var xx = arr_x[i]
                var yy = arr_y[i]
                var dir_ = point_direction(x, y, xx, yy)
                var x1 = x
                var y1 = y
                off = 10
                repeat (25)
                {
                    x1 += lengthdir_x(15, dir_)
                    y1 += lengthdir_y(15, dir_)
                    x1 = clamp(x1, (camx + off), (camx + 480 - off))
                    y1 = clamp(y1, (camy + off), (camy + 270 - off))
                }
                draw_sprite(s_spot_enemies, arr_rel[i], x1, y1)
            }
        }
    }
}
