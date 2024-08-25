var _temp_local_var_1, _temp_local_var_14;
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_jammed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_jammed

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
display_set_gui_size(480, 270)
language_set_font((0 << 0))
if (!player_exists_local())
    return;
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
var _player = player_get_local()
if (global.show_fps == true)
    show_debug_overlay(true)
else
    show_debug_overlay(false)
if player_local_state_is(gml_Script_scr_player_state_move)
{
    if (global.change_ammo_now == true)
    {
        var _tipi_ammo = ds_list_size(global.list_ammo_id)
        if (_tipi_ammo > 0)
        {
            language_set_font((0 << 0))
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            var xx = _player.x - camx
            var yy = _player.y - camy - 16
            for (var i = 0; i < _tipi_ammo; i++)
            {
                var subi = 0
                var cc = c_white
                if (global.change_ammo_scelta == i)
                {
                    subi = 1
                    cc = 0x91F2FF
                }
                var _ammo_name = item_get_name(ds_list_find_value(global.list_ammo_id, i))
                var _ammo_qnt = ds_list_find_value(global.list_ammo_qnt, i)
                var _t = _ammo_name + " (" + string(_ammo_qnt) + ")"
                var _drawn_at = scr_draw_text_outlined((xx + global.language_font_offset.x), (yy + global.language_font_offset.y - 13 * i + 5), _t, cc, c_black, 1, 1)
            }
        }
    }
}
var _offset_jam = 0
if player_local_state_is(gml_Script_scr_player_state_move)
{
    if gml_Script_player_loadout_get_jammed(_player, _player.weapon_slot_now)
    {
        if item_exists(_player.arma_now)
        {
            language_set_font((0 << 0))
            draw_set_halign(fa_center)
            draw_set_valign(fa_top)
            xx = _player.x - camx
            yy = _player.y - camy - 16
            _offset_jam = 8
            draw_text_outlined_with_control((xx + global.language_font_offset.x), (yy + global.language_font_offset.y), language_get_string("Jam"), (26 << 0))
        }
    }
}
if player_local_state_is(gml_Script_scr_player_state_move, gml_Script_scr_player_state_consumable_animation)
{
    if ((!global.debug_hide_hud) && player_exists_local())
    {
        var _bleed = _player.bleed
        var _alpha = 0
        if (_bleed >= 0)
            _alpha = 0.3
        if (_bleed >= 1)
            _alpha = 0.6
        if (_bleed >= 2)
            _alpha = 0.85
        if (_bleed >= 0.2)
            draw_sprite_ext(s_hud_bleed, 0, 0, 0, 1, 1, 0, c_white, _alpha)
    }
}
if player_local_state_is(gml_Script_scr_player_state_move, gml_Script_scr_player_state_inventory, gml_Script_scr_player_state_consumable_animation)
{
    if ((!(player_get_local_var("aiming", false))) && (!global.debug_hide_hud) && player_exists_local())
    {
        var hp = max(0, _player.hp)
        var hp_max = _player.hp_max_total
        var startx = 5
        var starty = 5
        var bar_w_max = 37
        var bar_w = bar_w_max / hp_max * hp
        var c1 = c_gray
        draw_rectangle_color((startx + 23), (starty + 2), (startx + 61), (starty + 13), c1, c1, c1, c1, false)
        draw_rectangle_color((startx + 23), (starty + 18), (startx + 61), (starty + 22), c1, c1, c1, c1, false)
        var _wound = _player.wound
        if (_wound >= 1)
        {
            c1 = c_dkgray
            var bar_wound_w = bar_w_max / hp_max * _wound
            draw_rectangle_color((startx + 61 - bar_wound_w), (starty + 2), (startx + 61), (starty + 13), c1, c1, c1, c1, false)
        }
        draw_sprite(s_hp_bar, 0, startx, starty)
        draw_sprite_part_ext(s_hp_bar, 1, 24, 2, 1, 12, (startx + 24), (starty + 2), ceil(bar_w), 1, c_white, 1)
        if (hp == hp_max)
            draw_sprite_part(s_hp_bar, 1, 61, 2, 1, 12, (startx + 61), (starty + 2))
        var stamina = max(0, _player.stamina)
        var stamina_max = _player.stamina_max_total
        startx = 5
        starty = 5
        bar_w_max = 37
        if (stamina_max >= 0)
        {
            bar_w = bar_w_max / stamina_max * stamina
            draw_sprite_part_ext(s_hp_bar, 1, 24, 18, 1, 5, (startx + 24), (starty + 18), ceil(bar_w), 1, c_white, 1)
            if (stamina == stamina_max)
                draw_sprite_part(s_hp_bar, 1, 61, 18, 1, 5, (startx + 61), (starty + 18))
        }
        if (_player.bleed > 0)
        {
            var _xx = 70
            var _yy = 6
            draw_sprite(s_bleed_icon, 0, _xx, _yy)
            language_set_font((0 << 0))
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            draw_text((_xx + global.language_font_offset.x + 8), (_yy + global.language_font_offset.y + 10), string(ceil(_player.bleed) div 1))
            if scr_mouse_over_hud((camx + _xx), (camy + _yy), 16, 16)
            {
                _t = language_get_string("Bleeding") + " [" + (string(_player.bleed div 1)) + "]"
                var _w = string_width(_t) + 4
                var _h = 12
                language_set_font((0 << 0))
                scr_draw_box(s_box_testo_pop_up, (_xx - _w / 2 + 8), (_yy + 24), _w, _h, 1)
                draw_text((_xx + global.language_font_offset.x + 8), (_yy + global.language_font_offset.y + 24 + _h / 2), _t)
            }
        }
        language_set_font((0 << 0))
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        if (!(player_get_local_var("aiming", false)))
        {
            for (i = 0; i < ds_list_size(global.list_status_id); i++)
            {
                var oo = ds_list_find_value(global.list_status_id, i)
                draw_sprite_ext(global.status_sprite[oo], 0, (global.status_x + global.status_w * i + global.status_off * i), global.status_y, 1, 1, 0, global.status_color[global.status_state_now[oo]], 1)
                xx = global.status_x + global.status_w * i + global.status_off * i
                if scr_mouse_over_hud((xx + camx), (global.status_y + camy), 16, 16)
                {
                    if (!mouse_check_button(mb_right))
                    {
                        var w_ = 80
                        var h_ = 12
                        var t_name = language_get_string(global.status_des[oo][global.status_state_now[oo]])
                        var t1 = ""
                        if (oo == (0 << 0))
                        {
                            t1 = (string((global.status_f1[(0 << 0)][global.status_state_now[oo]]) * 100)) + "% " + (language_get_string("stamina regeneration"))
                            var t_amount = _player.fatigue
                        }
                        if (oo == (1 << 0))
                        {
                            t1 = (string(global.status_f1[(1 << 0)][global.status_state_now[oo]])) + "kg " + (language_get_string("max weight"))
                            t_amount = _player.energy
                        }
                        if (oo == (2 << 0))
                        {
                            t1 = (string(global.status_f1[(2 << 0)][global.status_state_now[oo]])) + "kg " + (language_get_string("max weight"))
                            t_amount = _player.thirst
                        }
                        if (oo == (3 << 0))
                        {
                            t1 = ""
                            t_amount = abs(_player.radiation_accumulata)
                        }
                        if (oo != (3 << 0))
                            t_amount = round(t_amount)
                        var t_value_max = string(t_amount) + "/" + string(global.status_value_max[oo])
                        var t_ = t_name + " " + t_value_max
                        if (t1 != "")
                            h_ = 24
                        var off_h = 2
                        var off_w = 2
                        var t_w_s = string_width(t_)
                        var t_w_e = string_width(t1)
                        w_ = off_w * 2 + (max(t_w_s, t_w_e))
                        language_set_font((0 << 0))
                        scr_draw_box(s_box_testo_pop_up, (xx + 8 - w_ / 2), (global.status_y + 18), w_, h_, 1)
                        draw_text_ext((xx + global.language_font_offset.x + 8), (global.status_y + global.language_font_offset.y + 17 + 1), t_, 10, w_)
                        language_set_font((0 << 0))
                        draw_text_ext((xx + global.language_font_offset.x + 8), (global.status_y + global.language_font_offset.y + 29 + 1), t1, 10, w_)
                    }
                }
            }
        }
        var attivo = false
        for (i = 0; i < array_length_1d(global.injector_factor); i++)
        {
            if (global.injector_factor[i] != 0)
                attivo = true
        }
        if (attivo == true)
        {
            var sx = 154
            draw_sprite(s_item_injector_vuoto, 0, sx, global.status_y)
            if scr_mouse_over_hud((camx + sx), (camy + global.status_y), 16, 16)
            {
                var list_injector = ds_list_create()
                for (i = 0; i < array_length_1d(global.injector_factor); i++)
                {
                    if (global.injector_factor[i] != 0 && global.injector_show_on_HUD[i] == true)
                        ds_list_add(list_injector, i)
                }
                language_set_font((0 << 0))
                draw_set_halign(fa_left)
                draw_set_valign(fa_top)
                var ww = 0
                for (i = 0; i < ds_list_size(list_injector); i++)
                {
                    var quale = ds_list_find_value(list_injector, i)
                    ww = max(ww, (string_width(language_get_string(global.injector_des[quale])) + 24))
                }
                var tx = sx - ww / 2
                var ty = global.status_y + 20
                var sep_h = 14
                var off = 2
                var hh = sep_h * ds_list_size(list_injector) + off * 2
                scr_draw_box(s_box_testo_pop_up, (tx - off), ty, (ww + 3), hh, 1)
                for (i = 0; i < ds_list_size(list_injector); i++)
                {
                    quale = ds_list_find_value(list_injector, i)
                    draw_set_halign(fa_left)
                    draw_text((tx + global.language_font_offset.x), (ty + global.language_font_offset.y + i * sep_h), language_get_string(global.injector_des[quale]))
                    draw_set_halign(fa_center)
                    var _value = global.injector_factor[quale]
                    if (global.injector_overtime[quale] == true)
                        _value *= 60
                    draw_text((tx + global.language_font_offset.x + ww - 14), (ty + global.language_font_offset.y + i * sep_h), string(_value))
                }
            }
        }
        var ammo_magazine = player_loadout_get_magazine_size(_player, _player.weapon_slot_now)
        var ammo_now = gml_Script_player_loadout_get_ammo(_player, _player.weapon_slot_now)
        var s_ammo = s_ammo_counter_small
        var sh = sprite_get_height(s_ammo)
        var sw = sprite_get_width(s_ammo)
        var offy = 0
        for (i = 0; i < ammo_magazine; i++)
        {
            var offx = 0
            if (i < ammo_now)
                var sub = 0
            else
                sub = 1
            draw_sprite(s_ammo, sub, (2 + offx), (268 - (sh - 1) * offy))
            if (global.ammo_counter_i_fired == true && i == ammo_now)
            {
                global.ammo_counter_i_fired = false
                var ff = instance_create_depth(camx, camy, 0, obj_ammo_counter_fired)
                ff.sprite_index = s_ammo_counter_fired_small
                ff.dx = 2 + offx
                ff.dy = 268 - (sh - 1) * offy
            }
            offy++
        }
    }
}
if (_player.arms_holder != undefined)
{
    var _item_id = _player.arms_holder.item_id
    if item_fits_category(_item_id, "grenade")
    {
        if (item_grenade_get_throw_type(_item_id) != "GRENADE_throw_no_move")
        {
            var _min = item_grenade_get_throw_min(_item_id)
            var _max = item_grenade_get_throw_max(_item_id)
            var _dis = point_distance(x, y, obj_cursor.aa_x, obj_cursor.aa_y)
            _dis = clamp(_dis, _min, _max)
            var _dir = point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y)
            var _base = 4
            var _offset_from_p = 8
            var x1 = x + (lengthdir_x((_base / 2), (_dir + 90))) - camx + (lengthdir_x(_offset_from_p, _dir))
            var y1 = y + (lengthdir_y((_base / 2), (_dir + 90))) - camy + (lengthdir_y(_offset_from_p, _dir))
            var x2 = x + (lengthdir_x((_base / 2), (_dir - 90))) - camx + (lengthdir_x(_offset_from_p, _dir))
            var y2 = y + (lengthdir_y((_base / 2), (_dir - 90))) - camy + (lengthdir_y(_offset_from_p, _dir))
            var x3 = x + (lengthdir_x(_dis, _dir)) - camx
            var y3 = y + (lengthdir_y(_dis, _dir)) - camy
            var _c = 16777215
            var _a = 0.6
            draw_set_alpha(_a)
            draw_triangle_color(x1, y1, x2, y2, x3, y3, _c, _c, _c, false)
            draw_set_alpha(1)
        }
    }
}
if player_local_state_is(gml_Script_scr_player_state_move)
{
    var _can_draw = true
    if instance_exists(obj_npc_draw_text)
    {
        with (obj_npc_draw_text)
        {
            if (id_che_parla == _player.id)
                _can_draw = false
        }
    }
    if (global.change_ammo_now == true)
        _can_draw = false
    if (_can_draw == true)
    {
        if (ds_list_size(global.list_interact) > 0)
        {
            language_set_font((0 << 0))
            draw_set_halign(fa_center)
            draw_set_valign(fa_middle)
            xx = _player.x - camx
            yy = _player.y - camy - 16
            for (i = 0; i < ds_list_size(global.list_interact); i++)
            {
                subi = 0
                cc = c_white
                if (global.p_int_instance_id == i)
                {
                    subi = 1
                    cc = 0x91F2FF
                }
                var tt = array_get(p_int_text, ds_list_find_value(global.list_interact, i))
                if (ds_list_find_value(global.list_interact, i) == (10 << 0))
                {
                    var _quest_pos = ds_list_find_value(global.list_interact_id, i)
                    var _quest_id = global.quest_state[_quest_pos].id
                    var _task_pos = ds_list_find_value(global.list_interact_task_pos, i)
                    if (variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_prompt != "")
                        tt = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_prompt
                }
                if (ds_list_find_value(global.list_interact, i) == (5 << 0))
                {
                    if is_in_raid()
                    {
                        if (_player.y > obj_map_generator.map_height)
                            tt = "Exit"
                    }
                }
                if (ds_list_find_value(global.list_interact, i) == (1 << 0))
                {
                    var _chest_id = ds_list_find_value(global.list_interact_id, i)
                    if instance_exists(_chest_id)
                    {
                        if (_chest_id.already_looted == true)
                            cc = 7105644
                    }
                }
                _drawn_at = draw_text_outlined_with_control(xx, (yy - 13 * i + 5), language_get_string(tt), (6 << 0), cc)
                if (subi == 1)
                {
                    if (ds_list_size(global.list_interact) > 1)
                        draw_sprite_ext(s_hud_selector, 0, (_drawn_at[0] - _drawn_at[2] / 2 - 5), (_drawn_at[1] - 2), 1, 1, 0, 0x91F2FF, 1)
                }
            }
        }
    }
}
display_set_gui_size(1920, 1080)
gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Draw()
display_set_gui_size(480, 270)
if global.general_debug
{
    var _show_debug = true
    if (global.debug_hide_hud == true)
        _show_debug = false
    if player_exists_local()
    {
        if (is_in_raid() && player_local_state_is(gml_Script_scr_player_state_free_camera))
            _show_debug = false
    }
    if (_show_debug == true)
    {
        language_set_font((0 << 0))
        draw_set_halign(fa_right)
        draw_set_valign(fa_top)
        var _text = ""
        _text += "DEBUG [F1]\n"
        _text += ("seed: " + string(global.map_seed) + "\n")
        if player_exists_local()
            _text += ("player: " + string(floor(_player.x)) + "," + string(floor(_player.y)) + "\n")
        draw_text(400, 1, _text)
    }
    if (debug_menu == true)
    {
        var box_x = 50
        var box_y = 20
        var box_w = 380
        var box_h = 230
        hh = 12
        scr_draw_box(s_box_testo2, box_x, box_y, box_w, box_h, 1)
        language_set_font((0 << 0))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        for (i = 0; i < array_length_1d(d_k); i++)
        {
            draw_text((box_x + global.language_font_offset.x + 10), (box_y + global.language_font_offset.y + 3 + i * hh), d_k[i])
            draw_text((box_x + global.language_font_offset.x + 90), (box_y + global.language_font_offset.y + 3 + i * hh), d_t[i])
        }
    }
    if keyboard_check_direct(vk_f2)
    {
        scr_draw_box(s_box_testo2, 25, 25, 430, 220, 1)
        language_set_font((0 << 0))
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        for (i = 0; i < array_length_1d(global.sk_k); i++)
        {
            xx = 0
            hh = 0
            if (i >= 18 && i < 36)
            {
                xx = 130
                hh = 18
            }
            if (i >= 36 && i < 54)
            {
                xx = 260
                hh = 36
            }
            var t = global.sk_na[i] + " " + string(global.sk_k[i])
            draw_text((30 + global.language_font_offset.x + xx), (30 + global.language_font_offset.y + 12 * (i - hh)), t)
        }
    }
    if keyboard_check_direct(vk_f3)
    {
        scr_draw_box(s_box_testo2, 25, 25, 430, 220, 1)
        draw_set_halign(fa_left)
        for (i = 0; i < array_length_1d(global.sk_id); i++)
        {
            var get_id = global.sk_id[i]
            draw_text((50 + global.language_font_offset.x), (50 + global.language_font_offset.y + 10 * i), (string(global.sk_lvl[get_id]) + "  " + global.sk_name[get_id]))
        }
    }
}
var collisione = false
if (!(player_local_state_is(gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
{
    with (player_get_local())
    {
        if place_meeting(x, y, obj_solid)
            collisione = true
    }
}
if collisione
{
    t_ = text_split(language_get_string("You are stuck, hold [CTRL] and press [WASD] to move in that direction"), 360, true)
    language_set_font((0 << 0))
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    scr_draw_text_outlined(240, (230 - (string_height(t_) - string_height("M"))), t_, c_white, c_black, 1, 1)
}
if global.general_debug
{
    if keyboard_check(vk_numpad1)
    {
        if is_in_raid()
        {
            if instance_exists(obj_map_generator)
            {
                var o = obj_map_generator
                var _sx = 10
                var _sy = 50
                language_set_font((0 << 0))
                draw_set_halign(fa_left)
                draw_set_valign(fa_top)
                for (i = 0; i < (20 << 0); i++)
                {
                    _t = string(o.tempo_generazione[i] / 1000)
                    var _tt = _t + "   : " + o.tempo_gen_name[i]
                    draw_text((_sx + global.language_font_offset.x), (_sy + global.language_font_offset.y + i * 10), language_get_string(string(_tt)))
                }
                draw_text((_sx + global.language_font_offset.x), (_sy + global.language_font_offset.y + 200), ((language_get_string("TOTAL TIME")) + ": " + (string((o.tempo_gen_assoluto[(18 << 0)]) / 1000))))
            }
        }
    }
}
if global.hud_glance_sysytem
{
    draw_set_halign(fa_left)
    i = 0
    draw_text((10 + global.language_font_offset.x), (100 + global.language_font_offset.y + 10 * i), ("mouse: " + string(player_get_local().recoil_from_moving_mouse)))
    i++
    draw_text((10 + global.language_font_offset.x), (100 + global.language_font_offset.y + 10 * i), ("move: " + string(player_get_local().recoil_from_movement)))
    i++
    draw_text((10 + global.language_font_offset.x), (100 + global.language_font_offset.y + 10 * i), ("shot: " + string(player_get_local().recoil_from_shooting)))
    i++
    draw_text((10 + global.language_font_offset.x), (100 + global.language_font_offset.y + 10 * i), ("total: " + string(player_get_local().recoil_total)))
    i++
    draw_text((10 + global.language_font_offset.x), (100 + global.language_font_offset.y + 10 * i), ("prec: " + string(player_get_local().total_precision)))
    i++
}
if is_in_raid()
{
    if (player_exists_local() && instance_exists(obj_map_generator))
    {
        if player_local_state_is(gml_Script_scr_player_state_move)
        {
            if (_player.y < obj_map_generator.map_height)
            {
                if (_player.can_run_after_exit_building == true)
                {
                    var size_ = ds_list_size(global.list_minimap_marker_x)
                    if (size_ > 0)
                    {
                        for (i = 0; i < size_; i++)
                        {
                            xx = (ds_list_find_value(global.list_minimap_marker_x, i)) * 16 / 4
                            yy = (ds_list_find_value(global.list_minimap_marker_y, i)) * 16 / 4
                            var dir_ = point_direction(x, y, xx, yy)
                            x1 = x
                            y1 = y
                            off = 10
                            if (!(point_in_rectangle(xx, yy, (camx + off), (camy + off), (camx + 480 - off), (camy + 270 - off))))
                            {
                                var _temp_local_var_14 = 25
                                if (25 <= 0)
                                {
                                }
                                else
                                {
                                    while (true)
                                    {
                                        x1 += lengthdir_x(15, dir_)
                                        y1 += lengthdir_y(15, dir_)
                                        x1 = clamp(x1, (camx + off), (camx + 480 - off))
                                        y1 = clamp(y1, (camy + off), (camy + 270 - off))
                                        if (!(point_in_rectangle(x1, y1, (camx + off), (camy + off), (camx + 480 - off), (camy + 270 - off))))
                                            break
                                        else
                                        {
                                            var _temp_local_var_14 = (25 - 1)
                                            if (25 - 1)
                                                continue
                                        }
                                    }
                                }
                                draw_sprite_ext(s_minimap_marker, 0, (x1 - camx), (y1 - camy), 1, 1, (dir_ + 90), c_white, 1)
                            }
                            else
                                draw_sprite_ext(s_minimap_marker, 0, (xx - camx), (yy - camy), 1, 1, 0, c_white, 1)
                        }
                    }
                }
            }
        }
    }
}
