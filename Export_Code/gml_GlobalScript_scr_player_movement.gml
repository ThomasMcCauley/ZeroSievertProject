function scr_player_movement(argument0, argument1, argument2) //gml_Script_scr_player_movement
{
    var _speed_multiplier = argument0
    var _can_move = argument1
    var _can_run = argument2
    var camx = camera_get_view_x(view_camera[0])
    var camy = camera_get_view_y(view_camera[0])
    var action = false
    stamina_run_drain = lerp(0.18, 0.75, (player_weight / max_weight))
    stamina_run_drain *= global.sk_k[(4 << 0)]
    var can_run = true
    var can_walk = true
    var _left = max(global.kb_hold[(3 << 0)], obj_gamepad.action[(3 << 0)].decimal)
    var _right = max(global.kb_hold[(2 << 0)], obj_gamepad.action[(2 << 0)].decimal)
    var _up = max(global.kb_hold[(0 << 0)], obj_gamepad.action[(0 << 0)].decimal)
    var _down = max(global.kb_hold[(1 << 0)], obj_gamepad.action[(1 << 0)].decimal)
    var _run = max(global.kb_hold[(4 << 0)], obj_gamepad.action[(4 << 0)].value)
    if (_can_run == false)
        can_run = false
    if (_can_move == false)
        can_walk = false
    var walk_k = 1
    if (player_weight > max_weight)
    {
        can_run = false
        if is_in_hub()
            can_run = true
    }
    if (player_weight > max_weight)
    {
        walk_k = 0.5
        if is_in_hub()
            walk_k = 1
    }
    if (player_weight > (max_weight + 5))
    {
        can_walk = false
        walk_k = 0
        if is_in_hub()
        {
            walk_k = 1
            can_walk = true
        }
    }
    if (stamina <= 0)
        can_run = false
    if mouse_check_button(mb_right)
        can_run = false
    if (can_run_after_exit_building == false)
        can_run = false
    spd_walk = 0.75 * ((100 + item_backpack_get_movement_speed(backpack_now)) / 100) * _speed_multiplier
    spd_run = 1.2 * ((100 + item_backpack_get_movement_speed(backpack_now)) / 100) * _speed_multiplier
    if is_in_hub()
        spd_run = 1.7 * ((100 + item_backpack_get_movement_speed(backpack_now)) / 100)
    if (global.kb_pressed[(4 << 0)] || obj_gamepad.action[(4 << 0)].pressed)
    {
        if settings_get("toggle_sprint")
            sprint_is_toggled_now = (!sprint_is_toggled_now)
    }
    if (!settings_get("toggle_sprint"))
        sprint_is_toggled_now = false
    if (sprint_is_toggled_now == true)
        _run = true
    if _run
    {
        if (can_run == true)
        {
            if (_left || _down || _right || _up)
            {
                current_spd = spd_run * (global.sk_k[(5 << 0)]) + global.debug_speed * 4
                image_speed_move_current = 0.75
                walk_time++
                if (player_weight < global.sk_k[(2 << 0)])
                    stamina += stamina_run_drain
                if is_in_hub()
                    stamina += stamina_run_drain
            }
        }
        else
        {
            _run = false
            sprint_is_toggled_now = false
        }
    }
    if (!_run)
    {
        if (can_walk == true)
        {
            current_spd = spd_walk * walk_k
            image_speed_move_current = 0.4
        }
        else
            current_spd = 0
    }
    if (_left <= 0 && _down <= 0 && _right <= 0 && _up <= 0)
    {
        current_spd = 0
        sprint_is_toggled_now = false
    }
    hspd = current_spd * (_right - _left) * mutant_slow_multiplier
    vspd = current_spd * (_down - _up) * mutant_slow_multiplier
    if (hspd != 0 && vspd != 0)
    {
        hspd /= 1.4
        vspd /= 1.4
    }
    if mouse_check_button(mb_right)
    {
        hspd *= 0.5
        vspd *= 0.5
    }
    scr_collision()
    if _run
    {
        if (can_run == true)
        {
            if (_left || _down || _right || _up)
            {
                if (hspd != 0 || vspd != 0)
                    stamina -= stamina_run_drain
                if (hspd == 0 && vspd == 0)
                    sprint_is_toggled_now = false
            }
        }
    }
    if (hspd != 0 || vspd != 0)
    {
        fatigue -= (player_weight * 0.00003 * (global.sk_k[(56 << 0)]))
        if (!is_in_hub())
            scr_level_up_skill((0 << 0), (global.rate_cardio * (global.sk_k[(55 << 0)])))
    }
    scr_direzione_sprite()
    if (_left || _down || _right || _up)
    {
        recoil_from_movement += (item_get_weight(arma_now) / 5)
        walk_time++
        if (walk_time >= 28)
        {
            walk_time = 0
            if (hspd != 0 || vspd != 0)
                scr_choose_footstep_sound((1 << 0))
        }
    }
}

