/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_fire_mode

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
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
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_fire_mode

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function player_action_shoot() //gml_Script_player_action_shoot
{
    if (gml_Script_player_loadout_get_fire_mode(self, weapon_slot_now) == "automatic")
    {
        if (mouse_check_button(mb_left) || obj_gamepad.action[(27 << 0)].value)
        {
            if (shooting == false)
            {
                shoot_input = true
                shoot_input_delay = 0
            }
        }
    }
    if (gml_Script_player_loadout_get_fire_mode(self, weapon_slot_now) == "semi_automatic")
    {
        if (mouse_check_button_pressed(mb_left) || obj_gamepad.action[(27 << 0)].pressed)
        {
            shoot_input = true
            shoot_input_delay = 0
        }
    }
    if (gml_Script_player_loadout_get_fire_mode(self, weapon_slot_now) == "bolt_action")
    {
        if (mouse_check_button_pressed(mb_left) || obj_gamepad.action[(27 << 0)].pressed)
        {
            shoot_input = true
            shoot_input_delay = 0
        }
    }
    if (shoot_input == true)
    {
        shoot_input_delay++
        if (shoot_input_delay >= 15)
            shoot_input = false
    }
    if (abs(hspd) > 0 || abs(vspd) > 0)
    {
        if global.kb_hold[(4 << 0)]
            shoot_input = false
    }
    if (switching_weapon == true)
    {
        shoot_input = false
        action = true
        var _slot_next = next_weapon_slot
        var _ergo_now = now_ergo
        if (switching_fase == 0)
        {
            if player_loadout_exists(self, _slot_next)
                _ergo_now = item_weapon_get_ergo(player_loadout_get_item(self, _slot_next))
        }
        switching_weapon_max_now = switching_weapon_max * ((100 - _ergo_now) / 100)
        if (switching_fase == 0)
        {
            switching_weapon_now += 1
            weapon_holder.off_angle_switching += (90 / switching_weapon_max_now)
            if (switching_weapon_now >= switching_weapon_max_now)
            {
                weapon_slot_now = _slot_next
                arma_now = player_loadout_get_item(self, weapon_slot_now)
                switching_fase = 1
                switching_weapon_now = 0
            }
        }
        else
        {
            switching_weapon_now += 1
            weapon_holder.off_angle_switching -= (90 / switching_weapon_max_now)
            if (switching_weapon_now >= switching_weapon_max_now)
            {
                switching_weapon_now = 0
                switching_weapon = false
                recoil_from_shooting = 0
                weapon_holder.off_angle_switching = 0
            }
        }
    }
    if (shoot_stop_ani == true)
    {
        shoot_input = false
        if (mouse_check_button_released(mb_left) || obj_gamepad.action[(27 << 0)].released)
            shoot_stop_ani = false
    }
    var ergo_backpack = 0
    if item_exists(backpack_now)
        ergo_backpack = item_backpack_get_ergonomic(backpack_now)
    var ergo_weapon = 0
    if item_exists(arma_now)
        ergo_weapon = now_ergo
    total_ergo = ergo_weapon * (1 + ergo_backpack / 100)
    if (global.kb_hold[(3 << 0)] || global.kb_hold[(0 << 0)] || global.kb_hold[(2 << 0)] || global.kb_hold[(1 << 0)])
        recoil_from_movement += (150 + (100 - total_ergo))
    var _weapon_rec_from_mouse = 1
    if item_exists(arma_now)
        _weapon_rec_from_mouse = item_weapon_get_recover_from_mouse_movement(arma_now)
    var _sono_sopra_col_mouse = false
    if ((!(global.kb_hold[(3 << 0)])) && (!(global.kb_hold[(1 << 0)])) && (!(global.kb_hold[(2 << 0)])) && (!(global.kb_hold[(0 << 0)])))
    {
        recoil_from_movement -= ((225 + total_ergo * 2) * _weapon_rec_from_mouse)
        if (item_exists(arma_now) && (!(global.kb_hold[(4 << 0)])))
        {
            var _quanti_bullet = item_ammo_get_number(gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now))
            if instance_exists(obj_npc_parent)
            {
                with (obj_mouse)
                {
                    if (distance_to_object(obj_npc_parent) < 7)
                    {
                        if (linea_libera_gun_mouse == true)
                        {
                            other.recoil_from_movement -= (other.total_ergo * 1.25)
                            if (_quanti_bullet == 1)
                            {
                            }
                            _sono_sopra_col_mouse = true
                        }
                    }
                }
            }
        }
    }
    if instance_exists(obj_mouse)
    {
        var _o = obj_mouse
        var _dis_mouse_prev = point_distance(_o.x, _o.y, _o.previous_x, _o.previous_y)
        if (_dis_mouse_prev != 0)
            recoil_from_movement += (_dis_mouse_prev * 100)
    }
    var _recoil_max = 1
    if (_sono_sopra_col_mouse == true)
        _recoil_max = 0.6
    var _weapon_weight = item_get_weight(arma_now)
    recoil_from_movement = clamp(recoil_from_movement, 0, min((1 / (total_ergo * _weapon_weight) * 500000), 5500))
    recoil_from_shooting -= (2 + recoil_from_shooting * 0.05)
    recoil_from_shooting = clamp(recoil_from_shooting, 0, (now_recoil * 2))
    recoil_total = recoil_from_shooting + recoil_from_movement
    recoil_total = clamp(recoil_total, 0, 6500)
    if item_exists(arma_now)
    {
        var _k_dur = 1
        if (gml_Script_player_loadout_get_durability(self, weapon_slot_now) < 70)
            _k_dur = (100 + (gml_Script_player_loadout_get_durability(self, weapon_slot_now)) - 70) * 0.01
        total_precision = (100 - now_precision / _k_dur) * 0.04 + recoil_from_movement * 0.001
    }
    else
    {
        total_precision = 0
        recoil_from_shooting = 0
    }
    var _ho_tutte_le_mod_necessarie = item_weapon_can_fire(arma_now, player_loadout_get_mod_container(self, weapon_slot_now))
    if (shoot_input && (!_ho_tutte_le_mod_necessarie))
    {
        shoot_input = false
        if (!instance_exists(obj_draw_something))
            scr_draw_text_with_box("Essential parts of the weapon are missing")
    }
    if is_in_hub()
    {
        if (mouse_check_button_pressed(mb_left) || obj_gamepad.action[(27 << 0)].pressed)
            scr_draw_text_with_box("This is a safe zone!")
    }
    else if (item_exists(arma_now) && (!reloading) && (!shooting) && shoot_input)
    {
        if (gml_Script_player_loadout_get_ammo(self, weapon_slot_now) <= 0 && (!global.general_debug))
        {
            if (mouse_check_button_pressed(mb_left) || obj_gamepad.action[(27 << 0)].pressed)
            {
                if (!audio_is_playing(snd_no_ammo))
                    audio_play_sound(snd_no_ammo, 2, false)
            }
        }
        else
        {
            var dur = gml_Script_player_loadout_get_durability(self, weapon_slot_now)
            if (dur < 70)
            {
                var k_jam = (-dur) / 10 + 10
                if scr_chance(k_jam)
                    player_loadout_set_jammed(weapon_slot_now, true)
            }
            if (!(gml_Script_player_loadout_get_jammed(self, weapon_slot_now)))
            {
                shoot_input = false
                shoot_input_delay = 0
                var _dis = point_distance(x, y, aim_point_x, aim_point_y)
                var dir = point_direction(x, y, aim_point_x, aim_point_y)
                dur = gml_Script_player_loadout_get_durability(self, weapon_slot_now)
                var k_dam = 0.75 + 0.25 * dur / 100
                var dam = now_damage * k_dam
                var prec = total_precision
                if (gml_Script_player_loadout_get_ammo(self, weapon_slot_now) != 1)
                    prec = (100 - now_precision) * 0.04
                scr_shoot(dir, (1 << 0), dam, prec)
                var _ammo = clamp(((gml_Script_player_loadout_get_ammo(self, weapon_slot_now)) - 1), 0, 999)
                player_loadout_set_ammo(weapon_slot_now, _ammo)
                inventory_set_weapon_ammo(weapon_slot_now, _ammo, gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now))
                global.ammo_counter_i_fired = true
                alarm[1] = item_weapon_get_rate_of_fire(arma_now)
                shooting = true
                var _recoil_k = 1
                if (_sono_sopra_col_mouse == true)
                    _recoil_k = 0.6
                var _eff_range_recoil = glance_effective_range_recoil(arma_now, _dis)
                recoil_from_shooting += (now_recoil * _eff_range_recoil * (global.sk_k[(16 << 0)]))
                var _recoil = now_recoil * (global.sk_k[(16 << 0)])
                var rec_dir = weapon_pointing_direction + (choose(-90, 90))
                var _dis_max = 240
                var shake_ = dam * (item_ammo_get_number(gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now))) / 10 * 2
                shake_ = clamp(shake_, 0, 5)
                if (mp_index == 0)
                {
                    var _k = (aiming ? 1.2 : 1)
                    var _k_dist = 1
                    var _dist = point_distance(x, y, obj_cursor.aa_x, obj_cursor.aa_y)
                    if (_dist < 120)
                        _k_dist = lerp(0, 1, (_dist / 120))
                    var _k_tot = _k * _k_dist
                    var _amount_h = recoil_from_shooting * 0.12
                    var rechx = (lengthdir_x(_amount_h, rec_dir)) * _k_tot * (_dis / _dis_max)
                    var rechy = (lengthdir_y(_amount_h, rec_dir)) * _k_tot * (_dis / _dis_max)
                    var _amount_v = recoil_from_shooting * 0.12
                    var recvx = (lengthdir_x(_amount_v, weapon_pointing_direction)) * _k_tot
                    var recvy = (lengthdir_y(_amount_v, weapon_pointing_direction)) * _k_tot
                    move_cursor_relative((rechx + recvx), (rechy + recvy))
                    scr_camera_shake((shake_ / 4), (-dir))
                }
                weapon_holder.off_angle += shake_
                weapon_holder.off_amount += (shake_ / 2)
                weapon_holder.off_dir = (-dir)
                if (mp_index == 0)
                {
                    var _durability_loss = (item_ammo_get_dur(gml_Script_player_loadout_get_ammo_item(self, weapon_slot_now))) * (global.sk_k[(32 << 0)])
                    var _dur_now = gml_Script_player_loadout_get_durability(self, weapon_slot_now)
                    player_loadout_set_durability(weapon_slot_now, (_dur_now - _durability_loss))
                }
                if (item_weapon_get_fire_mode(arma_now) == "bolt_action")
                    alarm[10] = 15
            }
        }
    }
}

