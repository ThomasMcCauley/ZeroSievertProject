var _player = player_get_local()
depth = (-y) - sprite_get_height(sprite_index) / 2
audio_emitter_position(emitter_shoot, x, y, 0)
audio_emitter_position(emitter_walk, x, y, 0)
audio_emitter_position(emitter_talk, x, y, 0)
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
var _lista_near_me = undefined
alert_player -= 0.5
alert_player = clamp(alert_player, 0, alert_player_max)
if (last_seen_delay == true)
{
    last_seen_delay_timer++
    if (last_seen_delay_timer >= last_seen_delay_timer_max)
    {
        last_seen_delay = false
        last_seen_x = last_seen_delay_x
        last_seen_y = last_seen_delay_y
    }
}
recoil_shooting -= 0.4
recoil_shooting = clamp(recoil_shooting, 0, 10)
if (path_create_now == true)
{
    if (follow_path == true)
    {
        path_create_now = false
        var _path_amount_max = array_length(path_goto_x)
        var _valid_x = x
        var _valid_y = y
        for (var i = 0; i < _path_amount_max; i++)
        {
            var _path = path_add()
            if mp_grid_path(global.grid_move, _path, _valid_x, _valid_y, path_goto_x[i], path_goto_y[i], true)
            {
                var _path_size = path_get_number(_path)
                if (_path_size > 0)
                {
                    for (var j = 0; j < _path_size; j++)
                    {
                        var _p_x = path_get_point_x(_path, j)
                        var _p_y = path_get_point_y(_path, j)
                        ds_list_add(lista_path_x, _p_x)
                        ds_list_add(lista_path_y, _p_y)
                    }
                }
                _valid_x = path_goto_x[i]
                _valid_y = path_goto_y[i]
            }
            path_delete(_path)
        }
    }
}
if can_talk_reset
{
    can_talk_reset_timer++
    if (can_talk_reset_timer >= can_talk_reset_timer_max)
    {
        can_talk = true
        can_talk_reset = false
    }
}
switch state
{
    case "dummy":
        break
    case "human_no_move":
        if player_exists_local()
            target_for_image_scale = _player.x
        break
    case "sacriel_hub":
        target_for_image_scale = x + 1
        break
    case "deactivate":
        if (human_tick >= human_tick_max)
        {
            human_tick_max = human_tick_max_ref + 10 + (irandom_range(-2, 2))
            human_tick = 0
            if player_exists_local()
            {
                var _x_start = _player.x - 480
                var _y_start = _player.y - 270
                if point_in_rectangle(x, y, _x_start, _y_start, (_x_start + 960), (_y_start + 540))
                    state = state_before
            }
        }
        break
    case "unknown_sewer":
        if player_exists_local()
            target_for_image_scale = _player.x
        if (can_talk == true)
        {
            if (global.az_done[(7 << 0)] == false)
            {
                global.az_done[(7 << 0)] = true
                can_talk = false
                scr_draw_npc_text(id, (137 << 0))
            }
        }
        target = scr_find_target_for_human()
        if (target != noone)
        {
            switch target_relation
            {
                case (2 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_shoot"
                    break
                case (0 << 0):
                    break
                case (1 << 0):
                    break
            }

        }
        break
    case "forest_trader":
        if player_exists_local()
        {
            target_for_image_scale = _player.x
            if (point_distance(x, y, _player.x, _player.y) < 80)
            {
                if (can_talk == true)
                {
                    can_talk = false
                    var prima_volta_fatta = global.az_done[(0 << 0)]
                    if (prima_volta_fatta == false)
                    {
                        scr_draw_npc_text(id, (105 << 0))
                        global.az_done[(0 << 0)] = true
                    }
                    else
                        scr_draw_npc_text(id, (107 << 0))
                }
            }
        }
        break
    case "junk_trader":
        target_for_image_scale = 1
        if player_exists_local()
        {
            if (point_distance(x, y, _player.x, _player.y) < 80)
            {
                if (can_talk == true)
                {
                    can_talk = false
                    prima_volta_fatta = global.az_done[(10 << 0)]
                    if (prima_volta_fatta == false)
                    {
                        scr_draw_npc_text(id, (112 << 0))
                        global.az_done[(10 << 0)] = true
                    }
                    else
                        scr_draw_npc_text(id, (117 << 0))
                }
            }
        }
        break
    case "guardia_ingresso":
        if scr_chance(2)
            weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
        weapon_pointing_direction += weapon_pointing_amount
        weapon_pointing_direction = clamp(weapon_pointing_direction, 240, 300)
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        if (object_index == obj_guardia_ingresso_2)
        {
            if (can_talk == true)
            {
                if player_exists_local()
                {
                    if (_player.y > (y + 4) && _player.y < (y + 18) && instance_line_of_sight(x, y, _player))
                    {
                        var first_time_ = global.az_done[(2 << 0)]
                        if (first_time_ == false)
                        {
                            scr_draw_npc_text(id, (122 << 0))
                            global.az_done[(2 << 0)] = true
                            can_talk = false
                        }
                        first_time_ = global.az_done[(3 << 0)]
                        if (first_time_ == true)
                        {
                            var pp_ = (4 << 0)
                            var _first_time_ = global.az_done[pp_]
                            if (_first_time_ == false)
                            {
                                scr_draw_npc_text(id, (129 << 0))
                                global.az_done[pp_] = true
                                can_talk = false
                            }
                        }
                    }
                }
            }
        }
        if (object_index == obj_guardia_ingresso_1)
        {
            if (can_talk == true)
            {
                if player_exists_local()
                {
                    if (_player.y > (y + 4) && _player.y < (y + 18) && instance_line_of_sight(x, y, _player))
                    {
                        var _active = scr_check_quest_in_corso((37 << 0))
                        if (_active == (1 << 0))
                        {
                            can_talk = false
                            scr_draw_npc_text(id, (134 << 0))
                        }
                        _active = scr_check_quest_in_corso((37 << 0))
                        if ((_active == (2 << 0) || global.quest_unique_done[(37 << 0)] == true) && global.az_done[(6 << 0)] == false)
                        {
                            can_talk = false
                            scr_draw_npc_text(id, (135 << 0))
                            global.az_done[(6 << 0)] = true
                        }
                    }
                }
            }
        }
        var point_player = false
        if player_exists_local()
        {
            if (object_index == obj_guardia_ingresso_1 || object_index == obj_guardia_ingresso_2)
            {
                if instance_exists(obj_npc_draw_text)
                {
                    with (obj_npc_draw_text)
                    {
                        if (global.t_npc_text_next_id[text_id] == 849 || global.t_npc_text_next_id[text_id] == 850)
                            point_player = true
                    }
                }
            }
            if (point_player == true)
            {
                weapon_pointing_direction = point_direction(x, y, _player.x, _player.y)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
            }
        }
        break
    case "guardia_iniziale":
        if scr_chance(2)
            weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
        weapon_pointing_direction += weapon_pointing_amount
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15)
        if (quest_is_complete("unlock_makeshift_camp") == false)
        {
            if (player_distance_local(x, y) < 48)
            {
                if instance_line_of_sight(x, y, _player)
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y)
                    if (can_talk == true)
                    {
                        can_talk = false
                        scr_draw_npc_text(id, (97 << 0))
                    }
                }
            }
        }
        if (!instance_exists(obj_solid_bunker_green_army))
            npc_speaker_id = "guardia_iniziale_posso_passare"
        if (quest_is_complete("unlock_makeshift_camp") == true)
        {
            if (player_distance_local(x, y) < 16 && instance_line_of_sight(x, y, _player))
            {
                if (can_talk == true)
                {
                    can_talk = false
                    scr_draw_npc_text(id, (98 << 0))
                }
            }
        }
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        break
    case "guardia_iniziale_posso_passare":
        if scr_chance(2)
            weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
        weapon_pointing_direction += weapon_pointing_amount
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15)
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        break
    case "crimson_ingresso_base":
        if scr_chance(2)
            weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
        weapon_pointing_direction += weapon_pointing_amount
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15)
        if player_exists_local()
        {
            _active = scr_check_quest_in_corso((69 << 0))
            if (_active == (2 << 0))
            {
                if (player_distance_local(x, y) < 64)
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y)
                    if (can_talk == true)
                    {
                        if (global.az_done[(9 << 0)] == false)
                        {
                            scr_draw_npc_text(id, (143 << 0))
                            can_talk = false
                            global.az_done[(9 << 0)] = true
                        }
                    }
                }
            }
            if (global.quest_unique_done[(69 << 0)] == false || _active != (2 << 0))
            {
                if (player_distance_local(x, y) < 96)
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y)
                    if (player_distance_local(x, y) < 64)
                    {
                        if (can_talk == true)
                        {
                            scr_draw_npc_text(id, (140 << 0))
                            can_talk = false
                        }
                    }
                }
            }
            if (global.quest_unique_done[(70 << 0)] == true)
            {
                if (player_distance_local(x, y) < 48)
                {
                    if (can_talk == true)
                    {
                        scr_draw_npc_text(id, (142 << 0))
                        can_talk = false
                    }
                }
            }
        }
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        target = scr_find_target_for_human()
        if (target != noone)
        {
            switch target_relation
            {
                case (2 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_shoot"
                    break
                case (0 << 0):
                    break
                case (1 << 0):
                    break
            }

        }
        break
    case "crimson_leader":
        if ((!(global.az_done[(8 << 0)])) && player_exists_local())
        {
            if (player_distance_local(x, y) < 128)
            {
                if (can_talk == true)
                {
                    can_talk = false
                    global.az_done[(8 << 0)] = true
                    scr_draw_npc_text(id, (146 << 0))
                }
            }
        }
        break
    case "human_fuma_sigaretta":
        scr_npc_state_arms(obj_arms_smoke)
        break
    case "human_eat":
        scr_npc_state_arms(obj_arms_eat)
        break
    case "human_drink":
        scr_npc_state_arms(obj_arms_drink)
        break
    case "human_play_guitar":
        scr_npc_state_arms(obj_arms_guitar)
        break
    case "human_go_near_fire":
        scr_enemy_path()
        if (point_distance(x, y, move_point_x, move_point_y) < 12)
        {
            path_end()
            if (!instance_exists(obj_arms_guitar))
                scr_npc_arms("human_play_guitar", obj_arms_guitar)
            else
                state = "human_patrol"
        }
        break
    case "human_hub_general":
        if is_in_hub()
        {
            if (x > (camx - 240) && x < (camx + 720) && y > (camy - 135) && y < (camy + 405))
            {
                scr_enemy_choose_idle_or_move()
                scr_collision()
            }
        }
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        if (x > xprevious)
        {
            target_for_image_scale = x + 2
            weapon_pointing_direction = 300
        }
        else if (x == xprevious)
        {
        }
        else if (x < xprevious)
        {
            target_for_image_scale = x - 2
            weapon_pointing_direction = 240
        }
        break
    case "human_go_to_bancone_hub":
        scr_enemy_path()
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            path_end()
            move_point_x = original_x
            move_point_y = original_y
            if scr_chance(50)
            {
                state = "human_eat"
                var aa = instance_create_depth(x, y, 0, obj_arms_eat)
                aa.linked_id = id
                aa.image_xscale = image_xscale
            }
            else
            {
                state = "human_drink"
                aa = instance_create_depth(x, y, 0, obj_arms_drink)
                aa.linked_id = id
                aa.image_xscale = image_xscale
            }
        }
        break
    case "human_go_to_original_position":
        scr_enemy_path()
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            path_end()
            state = "human_hub_general"
        }
        break
    case "human_patrol":
        scr_enemy_choose_idle_or_move()
        scr_collision()
        draw_weapon = true
        if is_in_hub()
        {
            target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
            if (x > xprevious)
            {
                target_for_image_scale = x + 2
                weapon_pointing_direction = 300
            }
            else if (x == xprevious)
            {
            }
            else if (x < xprevious)
            {
                target_for_image_scale = x - 2
                weapon_pointing_direction = 240
            }
        }
        else
        {
            if scr_chance(2)
                weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
            weapon_pointing_direction += weapon_pointing_amount
            if (object_index == obj_green_quest_swamp)
            {
                if instance_exists(obj_faro)
                    weapon_pointing_direction = point_direction(x, y, obj_faro.x, (obj_faro.y - 150))
            }
            target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        }
        target = scr_find_target_for_human()
        if (target != noone)
        {
            switch target_relation
            {
                case (2 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_shoot"
                    break
                case (0 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_aim_neutral_target"
                    break
                case (1 << 0):
                    break
            }

        }
        if scr_chance(1)
        {
            if (faction == "Loners")
            {
                if (!instance_exists(obj_arms_guitar))
                {
                    if instance_exists(obj_barrel_acciaio_fire)
                    {
                        var nearest = instance_nearest(x, y, obj_barrel_acciaio_fire)
                        if (point_distance(x, y, nearest.x, nearest.y) < 160)
                        {
                            move_point_x = nearest.x + (irandom_range(-10, 10))
                            move_point_y = nearest.y
                            state = "human_go_near_fire"
                        }
                    }
                }
            }
        }
        break
    case "human_aim_neutral_target":
        scr_collision()
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        target = scr_find_target_for_human()
        if (target != noone)
        {
            switch target_relation
            {
                case (2 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_shoot"
                    break
                case (0 << 0):
                    weapon_pointing_direction = point_direction(x, y, target.x, target.y)
                    var dis = point_distance(x, y, target.x, target.y)
                    if (point_distance(x, y, mouse_x, mouse_y) < 8 && dis < 96)
                    {
                        if (can_talk == true)
                        {
                            can_talk = false
                            scr_draw_npc_text(id, (29 << 0))
                        }
                    }
                    if (!(instance_line_of_sight(x, y, target)))
                        state = "human_patrol"
                    break
                case (1 << 0):
                    state = "human_patrol"
                    break
            }

        }
        else
            state = "human_patrol"
        break
    case "human_bt":
        tick_from_roof = false
        tick_now++
        if (tick_now >= tick_max)
        {
            tick_from_roof = true
            tick_now = 0
            node_state_now = 3
            pos_now = pos_roof
            trace("\n\nNEW TICK\n")
            fun_bt_traverse(pos_now)
            for (i = 0; i < array_length(tree_id); i++)
            {
                tree_condition_checked[i] += 1
                tree_node_child_now[i] = 0
            }
        }
        if (tick_from_roof == false)
        {
            node_state_now = 2
            pos_now = node_running_now
            fun_bt_traverse(pos_now)
        }
        break
    case "human_general":
        var _next_state = -1
        if (state_finito == true)
        {
            human_tick = human_tick_max
            path_timer = path_timer_reset
        }
        NPCrecoil.radius_decreasing_value.NPCrecoil.radius_decreasing_value.IncreaseRadius(NPCrecoil)
        if instance_exists(target)
        {
            target.target.NewCenter(NPCrecoil)
            NPCrecoil.NPCrecoil.MoveCrosshair()
            NPCrecoil.NPCrecoil.StuckCheck()
            var _dis = point_distance(last_seen_x, last_seen_y, target.x, target.y)
            if (reflexes_can_change == true)
            {
                var _dis_target = point_distance(x, y, target.x, target.y)
                var _dir_target = point_direction(x, y, target.x, target.y)
                var _dir_weapon = weapon_pointing_direction
                if (_dis < reflex_min_distance_last_known)
                {
                    if (reflexes_shot == true)
                    {
                        riflessi_max = reflexes_minimum
                        reflexes_shot = false
                    }
                    if (!(instance_line_of_sight(x, y, target)))
                        riflessi_max = reflexes_minimum
                }
                else
                {
                    reflexes_can_change = false
                    reflexes_distance = lerp(reflexes_distance_min, reflexes_distance_max, (_dis_target / 180))
                    reflexes_distance = clamp(reflexes_distance, reflexes_distance_min, reflexes_distance_max)
                    var _angle_diff = abs(angle_difference(_dir_target, _dir_weapon))
                    reflexes_angle = lerp(reflexes_angle_min, reflexes_angle_max, (_angle_diff / 180))
                    reflexes_angle = clamp(reflexes_angle, reflexes_angle_min, reflexes_angle_max)
                    riflessi_max = reflexes_minimum + reflexes_distance + reflexes_angle
                }
            }
            riflessi = clamp(riflessi, 0, riflessi_max)
        }
        scr_bullet_near()
        human_tick++
        if (human_tick >= human_tick_max)
        {
            human_tick_max = human_tick_max_ref + (irandom_range(-2, 2))
            human_tick = 0
            target = scr_find_target_for_human()
            scr_enemy_alert_others()
            var _list_action = ds_priority_create()
            var _new_just_shot = just_shot
            var _no_target_or_ally = false
            if (target == noone)
                _no_target_or_ally = true
            if (target != noone)
            {
                if instance_exists(target)
                {
                    if (target_relation == (1 << 0))
                        _no_target_or_ally = true
                }
            }
            var _my_faction = npc_get_faction(npc_id)
            if (_no_target_or_ally == true)
            {
                last_patrol_x = x
                last_patrol_y = y
                ds_priority_add(_list_action, (0 << 0), global.sub_ai_peso[(0 << 0)])
                if scr_chance(1)
                {
                    var pp = choose((3 << 0), (4 << 0), (2 << 0))
                    ds_priority_add(_list_action, pp, global.sub_ai_peso[pp])
                }
                if (object_index == obj_scientist || object_index == obj_scientist_2)
                {
                    var p = (1 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
                if (object_index == obj_scientist_2)
                {
                    p = (5 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
                if (object_index == obj_crimson_guardia_ingresso)
                {
                    p = (6 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
                if (object_index == obj_crimson_guardia_ingresso)
                {
                    if (point_distance(x, y, original_x, original_y) > 20)
                    {
                        p = (9 << 0)
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                    }
                }
                if scr_chance(1)
                {
                    if (faction == "Loners")
                    {
                        if (!instance_exists(obj_arms_guitar))
                        {
                            if instance_exists(obj_barrel_acciaio_fire)
                            {
                                nearest = instance_nearest(x, y, obj_barrel_acciaio_fire)
                                if (point_distance(x, y, nearest.x, nearest.y) < 160)
                                {
                                    move_point_x = nearest.x + (irandom_range(-10, 10))
                                    move_point_y = nearest.y
                                    p = (7 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                        }
                    }
                }
                var _my_id = id
                var _alleato_morto_vicino = 0
                var _ally_morto_x = 0
                var _ally_morto_y = 0
                var _id_chest_ally_dead = noone
                if (alleato_morto_vicino != 2)
                {
                    if instance_exists(obj_chest_general)
                    {
                        with (obj_chest_general)
                        {
                            if (chest_faction == _my_faction)
                            {
                                if (point_distance(x, y, _my_id.x, _my_id.y) < 260)
                                {
                                    if instance_line_of_sight(x, y, _my_id)
                                    {
                                        _alleato_morto_vicino = 1
                                        _ally_morto_x = x
                                        _ally_morto_y = y
                                        _id_chest_ally_dead = id
                                    }
                                }
                            }
                        }
                    }
                }
                if (_alleato_morto_vicino == 1)
                {
                    alleato_morto_vicino = 1
                    ally_morto_x = _ally_morto_x
                    ally_morto_y = _ally_morto_y
                    id_chest_ally_dead = _id_chest_ally_dead
                }
                if (_alleato_morto_vicino == 1)
                {
                    p = (28 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
                if (follow_path == true)
                {
                    p = (10 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
            }
            var _grenade_close = false
            var _grenade_close_same_faction = false
            if instance_exists(obj_grenade_parent)
            {
                var __x = x
                var __y = y
                var _near = instance_nearest(x, y, obj_grenade_parent)
                if (grenade_close_id != _near)
                {
                    grenade_can_cover = true
                    grenade_close_id = _near
                }
                else
                    grenade_can_cover = false
                if (_near.faction == npc_get_faction(npc_id))
                {
                    grenade_can_cover = true
                    _grenade_close_same_faction = true
                }
                if (grenade_can_cover == true)
                {
                    with (_near)
                    {
                        if (point_distance(x, y, __x, __y) < radius_min_damage)
                        {
                            if (!(collision_line(x, y, __x, __y, obj_solid, true, true)))
                            {
                                _grenade_close = true
                                var _array_grenade_cover = scr_enemy_search_cover_grenade(_near)
                            }
                        }
                    }
                }
            }
            var _grenade_flash = grenade_flash
            if (target != noone)
            {
                var _tx = target.x
                var _ty = target.y
                var _line_of_sight = false
                var _lo_vedo = false
                target_visto = false
                var _arma_dir_target = true
                var _distanza_a_tiro = false
                var _vedo_ultima_pos_vista_da_alleati = false
                var _vedo_ultima_pos_vista_da_me = false
                var _mouse_over_npc = false
                var _counter_same_target = 0
                var _counter_same_faction = 0
                var _counter_first_time = 0
                for (i = 0; i < array_length_1d(global.sub_ai_peso); i++)
                {
                    _counter_array_action_ally[i] = 0
                    _counter_array_action_same_target[i] = 0
                }
                var _counter_near_me = 0
                _lista_near_me = ds_list_create()
                var _cover_pos_found = false
                var _sono_vicino_al_target = false
                var _distance_to_target_in_sight = 0
                var _distance_to_target = 0
                var _grenade_id = "no_item"
                var _player_grenade_flashed_k = 1
                var _distance_target = point_distance(x, y, _tx, _ty)
                var _array_range = glance_get_eff_range(item_weapon_get_type_effective_range(arma_now))
                var _struct_range = npc_ai_effective_range(arma_now, _distance_target, 20, 5, 0)
                var _array_range_pos = scr_enemy_search_range_position(_struct_range)
                precision_uneffective_range = 0
                if (can_shoot_uneffective_range == true)
                {
                    if (_distance_target <= _struct_range.ok_min)
                    {
                        _struct_range.range_type = (0 << 0)
                        precision_uneffective_range = 30
                    }
                    timer_shoot_uneffective_range += human_tick_max
                    if (timer_shoot_uneffective_range >= timer_shoot_uneffective_range_max)
                        timer_shoot_uneffective_range = 0
                }
                var _eff_range_pos = []
                var _same_faction_throw_grenade = false
                var _same_faction_near_last_known = false
                _distance_to_target = point_distance(x, y, target.x, target.y)
                if instance_line_of_sight(x, y, target)
                {
                    _line_of_sight = true
                    _distance_to_target_in_sight = point_distance(x, y, target.x, target.y)
                    if (_distance_to_target_in_sight < 100)
                        _sono_vicino_al_target = true
                }
                _lo_vedo = scr_enemy_target_inside_cone()
                if (!(collision_line(x, y, last_seen_x, last_seen_y, obj_solid, true, true)))
                    _vedo_ultima_pos_vista_da_alleati = true
                if (!(collision_line(x, y, last_known_x, last_known_y, obj_solid, true, true)))
                    _vedo_ultima_pos_vista_da_me = true
                with (obj_arms_grenade)
                {
                    if instance_exists(linked_id)
                    {
                        var _npc_id = linked_id.npc_id
                        var _faction = npc_get_faction(_npc_id)
                        if (_faction == _my_faction)
                            _same_faction_throw_grenade = true
                    }
                }
                if (_lo_vedo == true)
                {
                    last_seen_x = _tx
                    last_seen_y = _ty
                    last_known_x = _tx
                    last_known_y = _ty
                    last_my_target_seen_x = x
                    last_my_target_seen_y = y
                    target_seen = true
                }
                else
                {
                    target_seen = false
                    reflexes_can_change = true
                }
                var _dir = point_direction(x, y, _tx, _ty)
                _angle_diff = angle_difference(weapon_pointing_direction, _dir)
                if (abs(_angle_diff) > angle_min_to_rotate)
                {
                    _arma_dir_target = false
                    direction_to_aim = _dir
                    dir_to_aim_x = _tx
                    dir_to_aim_y = _ty
                }
                var _devo_ricaricare = scr_calcola_chance_reload()
                if (instance_exists(obj_mouse) && point_distance(x, y, obj_mouse.x, obj_mouse.y) < 10)
                    _mouse_over_npc = true
                if instance_exists(obj_hud_effect_flash)
                    _player_grenade_flashed_k = 3
                _my_faction = faction
                var _my_target = target
                _my_id = id
                var _my_x = x
                var _my_y = y
                with (obj_npc_parent)
                {
                    if (id != _my_id)
                    {
                        if (faction == _my_faction)
                        {
                            _counter_same_faction++
                            if (human_state_now != -1)
                                _counter_array_action_ally[human_state_now] += 1
                            if (point_distance(x, y, _my_x, _my_y) < 10)
                            {
                                _counter_near_me++
                                ds_list_add(_lista_near_me, id)
                            }
                            if (target == _my_target)
                            {
                                _counter_same_target++
                                if (human_state_now != -1)
                                    _counter_array_action_same_target[human_state_now] += 1
                            }
                        }
                    }
                }
                if (human_state_now != (12 << 0) && human_state_now != (13 << 0))
                {
                    var _array_cover = scr_enemy_search_cover_position_2()
                    if (_array_cover[0] != 0)
                    {
                        var _path_cover = path_add()
                        path_clear_points(_path_cover)
                        if mp_grid_path(global.grid_move, _path_cover, x, y, _array_cover[0], _array_cover[1], true)
                            _cover_pos_found = true
                        path_delete(_path_cover)
                    }
                }
                if instance_exists(target)
                {
                    if (target_relation == (2 << 0))
                    {
                        if (_lo_vedo == true)
                        {
                            alarm[5] = timer_searching_target_max
                            target_visto_prima_volta = true
                            target_visto = true
                            if (_devo_ricaricare == false)
                            {
                                if (_struct_range.range_type == (0 << 0) || (_struct_range.range_type == (1 << 0) && _mouse_over_npc))
                                {
                                    p = (11 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    last_known_x = target.x
                                    last_known_y = target.y
                                    if (_arma_dir_target == false)
                                    {
                                        p = (21 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                                if (_array_range_pos[0] != 0)
                                {
                                    if (_struct_range.range_type != (0 << 0) && (!_mouse_over_npc))
                                    {
                                        p = (29 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                            if (_devo_ricaricare == true)
                            {
                                if (_cover_pos_found == true)
                                {
                                    p = (12 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_mouse_over_npc == true)
                            {
                                if (_cover_pos_found == true)
                                {
                                    if scr_chance(10)
                                    {
                                        p = (12 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                            if scr_chance(1)
                            {
                                if (_cover_pos_found == true)
                                {
                                    p = (12 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_distance_target >= 100)
                            {
                                if (shooted_first_time == 1)
                                {
                                    shooted_first_time = 2
                                    if (_cover_pos_found == true)
                                    {
                                        p = (13 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                        }
                        if (_lo_vedo == false)
                        {
                            if (_devo_ricaricare == true)
                            {
                                p = (20 << 0)
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                            }
                            if (_devo_ricaricare == false)
                            {
                                if (_vedo_ultima_pos_vista_da_alleati == false)
                                {
                                    var _array = scr_enemy_search_shoot_position_2()
                                    if (_array[0] != 0)
                                    {
                                        p = (15 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                    else if (target_visto_prima_volta == true)
                                    {
                                        p = (16 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (target.faction != "Mutants")
                                    {
                                        var _chance_tipo_weapon = 0
                                        if (tipo_arma_equipped == (0 << 0))
                                            _chance_tipo_weapon = 25
                                        if (tipo_arma_equipped == (1 << 0))
                                            _chance_tipo_weapon = 8
                                        if (tipo_arma_equipped == (2 << 0))
                                            _chance_tipo_weapon = 0
                                        var _chance_counter_alleati_vicini = _counter_same_target
                                        var _chance_totale = _chance_tipo_weapon * _chance_counter_alleati_vicini * _player_grenade_flashed_k
                                        debug_chance_chase = _chance_totale
                                        if (npc_id == "killa")
                                            _chance_totale = 100
                                        if scr_chance(_chance_totale)
                                        {
                                            if (target_visto_prima_volta == true)
                                            {
                                                if (_counter_array_action_same_target[(16 << 0)] < 2)
                                                {
                                                    p = (16 << 0)
                                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                                }
                                            }
                                        }
                                        else if (_counter_array_action_same_target[(24 << 0)] < 2)
                                        {
                                            p = (24 << 0)
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                        }
                                        if instance_exists(obj_hud_effect_flash)
                                        {
                                            if (target == player_get_local())
                                            {
                                                p = (16 << 0)
                                                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                            }
                                        }
                                    }
                                }
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (point_distance(x, y, last_seen_x, last_seen_y) > 20)
                                    {
                                        var _array_aim_moving = scr_enemy_search_aim_moving(last_target_cover_x, last_target_cover_y)
                                        if (_array_aim_moving[0] != 0)
                                        {
                                            p = (25 << 0)
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                        }
                                    }
                                }
                                if (human_state_now == (16 << 0) || human_state_now == (23 << 0))
                                {
                                    if (state_finito == true)
                                    {
                                        p = (19 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (point_distance(x, y, last_seen_x, last_seen_y) < 10)
                                    {
                                        p = (19 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                                if (human_state_now == (18 << 0))
                                {
                                    if (point_distance(_tx, _ty, last_seen_x, last_seen_y) > 48)
                                    {
                                        if (point_distance(x, y, last_seen_x, last_seen_y) < 8)
                                        {
                                            p = (19 << 0)
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                        }
                                    }
                                }
                                if (chase_new_target_location == true)
                                {
                                    p = (18 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                                if (target_visto_prima_volta == false && chase_new_target_location == true)
                                {
                                    p = (18 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                                if (hear_target_shoot == true && _vedo_ultima_pos_vista_da_alleati == false)
                                {
                                    hear_target_shoot = false
                                    if scr_chance(85)
                                    {
                                        p = (23 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                                if (state_finito == true)
                                {
                                    if (human_state_now == (28 << 0))
                                    {
                                        p = (19 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                        }
                        if (_line_of_sight == false)
                        {
                            alert_player = 0
                            riflessi = 0
                            counter_target_cover++
                            if (counter_target_cover >= counter_target_cover_max && counter_target_toggle == true)
                            {
                                last_target_cover_x = _tx
                                last_target_cover_y = _ty
                                counter_target_toggle = false
                            }
                            if (human_state_now == (12 << 0))
                            {
                                if scr_chance(12)
                                {
                                    var _array_change_cover = scr_enemy_change_cover_2()
                                    if (_array_change_cover[0] != 0)
                                    {
                                        p = (14 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                        }
                        if (_line_of_sight == true)
                        {
                            counter_target_cover = 0
                            counter_target_toggle = true
                            if (_arma_dir_target == true && (_struct_range.range_type == (0 << 0) || (_struct_range.range_type == (1 << 0) && _mouse_over_npc)))
                            {
                                p = (11 << 0)
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                            }
                            if (_array_range_pos[0] != 0)
                            {
                                if (_arma_dir_target == true && _struct_range.range_type != (0 << 0))
                                {
                                    p = (29 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_arma_dir_target == false && just_shot == 2 && _sono_vicino_al_target == false)
                            {
                                if (_cover_pos_found == true)
                                {
                                    _new_just_shot = 0
                                    p = (13 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_arma_dir_target == false && just_shot == 1)
                            {
                                _new_just_shot = 0
                                p = (21 << 0)
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                            }
                        }
                        if (must_take_cover == true)
                        {
                            must_take_cover = false
                            if (human_state_before != (12 << 0) && human_state_now != (12 << 0))
                            {
                                if (_cover_pos_found == true)
                                {
                                    p = (12 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                        }
                        if (_counter_near_me >= 1)
                        {
                            p = (26 << 0)
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                        }
                        if (state_finito == true)
                        {
                            if (human_state_now == (13 << 0))
                            {
                                if (just_shot == 2)
                                {
                                    _new_just_shot = 0
                                    p = (27 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                        }
                        if (grenade_amount_thrown < grenade_amount_max)
                        {
                            if (_vedo_ultima_pos_vista_da_alleati == true && _line_of_sight == false && _same_faction_throw_grenade == false)
                            {
                                if scr_chance(npc_get_prob_grenade_throw(npc_id))
                                {
                                    if (_distance_to_target < 160)
                                    {
                                        var _array_grenade_id = []
                                        repeat npc_get_prob_grenade_f1(npc_id)
                                            array_push(_array_grenade_id, "grenade_f1")
                                        repeat npc_get_prob_grenade_rgd(npc_id)
                                            array_push(_array_grenade_id, "grenade_rgd5")
                                        repeat npc_get_prob_grenade_flash(npc_id)
                                            array_push(_array_grenade_id, "grenade_flash")
                                        _grenade_id = _array_grenade_id[irandom(array_length(_array_grenade_id) - 1)]
                                        if (_grenade_id != "no_item")
                                        {
                                            p = (32 << 0)
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (target_relation == (0 << 0))
                    {
                        if (_lo_vedo == true)
                        {
                            p = (0 << 0)
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                            if _mouse_over_npc
                            {
                                if (_arma_dir_target == false)
                                {
                                    p = (21 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                                if (_arma_dir_target == true && item_exists(player_get_local().arma_now))
                                {
                                    p = (37 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_distance_target <= neutral_distance_target)
                            {
                                if (counter_target_seen_neutral == 0)
                                {
                                    if (_arma_dir_target == false)
                                    {
                                        p = (21 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                    if (_arma_dir_target == true)
                                    {
                                        p = (36 << 0)
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                    }
                                }
                            }
                        }
                        if (_lo_vedo == false)
                        {
                            p = (0 << 0)
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                        }
                    }
                    if (target_relation == (1 << 0))
                    {
                    }
                    if (just_shot != 0)
                    {
                        _new_just_shot = 0
                        if (human_state_now != (11 << 0))
                        {
                            if scr_chance(15)
                            {
                                if (_cover_pos_found == true && _distance_to_target_in_sight > 200)
                                {
                                    p = (13 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                            if (_lo_vedo == false && _line_of_sight == true)
                            {
                                if (_arma_dir_target == false)
                                {
                                    p = (21 << 0)
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                                }
                            }
                        }
                    }
                }
                if (!instance_exists(target))
                {
                    p = (0 << 0)
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                }
            }
            if (_grenade_close == true && _grenade_close_same_faction == true)
            {
                if (_array_grenade_cover[0] != 0)
                {
                    if scr_chance(npc_get_prob_grenade_cover(npc_id))
                    {
                        p = (30 << 0)
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                    }
                }
            }
            if (_grenade_flash == true)
            {
                p = (31 << 0)
                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
            }
            if (global.is_emission_now == true)
            {
                if (!(player_get_local_var("is_indoor", false)))
                {
                    if (global.state_emission_now > (16 << 0))
                    {
                        p = (33 << 0)
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p])
                    }
                }
            }
            if (have_to_reload == true)
            {
                p = (20 << 0)
                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
            }
            if (human_state_now == -1)
            {
                human_state_now = (0 << 0)
                p = (0 << 0)
                ds_priority_add(_list_action, p, global.sub_ai_peso[p])
            }
            just_shot = _new_just_shot
            if (ds_priority_size(_list_action) > 0)
            {
                _next_state = ds_priority_find_max(_list_action)
                debug_next_state = _next_state
                var _change_state = false
                if (_next_state != human_state_now)
                {
                    if (global.sub_ai_stop[human_state_now] == true || _next_state == (31 << 0))
                    {
                        if (global.sub_ai_peso[human_state_now] < global.sub_ai_peso[_next_state])
                            _change_state = true
                    }
                }
                if (state_finito == true)
                    _change_state = true
                if (_change_state == true)
                {
                    if (human_state_now != _next_state)
                        human_state_before = human_state_now
                    state_finito = true
                    human_state_now = _next_state
                    timer_last_state = current_time
                    draw_weapon = true
                }
                if (state_finito == true)
                {
                    state_finito = false
                    switch _next_state
                    {
                        case (15 << 0):
                            path_end()
                            move_point_x = _array[0]
                            move_point_y = _array[1]
                            break
                        case (25 << 0):
                            path_end()
                            move_point_x = _array_aim_moving[0]
                            move_point_y = _array_aim_moving[1]
                            break
                        case (12 << 0):
                            move_point_x = _array_cover[0]
                            move_point_y = _array_cover[1]
                            if scr_chance(50)
                                scr_draw_npc_text(id, (1 << 0))
                            break
                        case (14 << 0):
                            path_end()
                            move_point_x = _array_change_cover[0]
                            move_point_y = _array_change_cover[1]
                            break
                        case (13 << 0):
                            move_point_x = _array_cover[0]
                            move_point_y = _array_cover[1]
                            if scr_chance(80)
                                scr_draw_npc_text(id, (10 << 0))
                            break
                        case (30 << 0):
                            move_point_x = _array_grenade_cover[0]
                            move_point_y = _array_grenade_cover[1]
                            if scr_chance(50)
                                scr_draw_npc_text(id, (16 << 0))
                            break
                        case (31 << 0):
                            path_end()
                            scr_draw_npc_text(id, (17 << 0))
                            break
                        case (32 << 0):
                            grenade_amount_thrown++
                            path_end()
                            scr_draw_npc_text(id, (18 << 0))
                            draw_weapon = false
                            var _sprite = item_grenade_get_animation(_grenade_id)
                            aa = instance_create_depth(x, y, 0, obj_arms_grenade)
                            aa.linked_id = id
                            aa.image_xscale = image_xscale
                            aa.sprite_index = _sprite
                            aa.target_x = last_seen_x
                            aa.target_y = last_seen_y
                            aa.grenade_id = _grenade_id
                            aa.faction = npc_get_faction(npc_id)
                            break
                        case (16 << 0):
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8)
                            if scr_chance(50)
                                scr_draw_npc_text(id, (8 << 0))
                            break
                        case (17 << 0):
                            _dir = point_direction(_tx, _ty, x, y)
                            _dis = npc_get_alert_visual_distance(npc_id) / 2
                            move_point_x = _tx + (lengthdir_x(_dis, _dir))
                            move_point_y = _ty + (lengthdir_y(_dis, _dir))
                            break
                        case (26 << 0):
                            path_end()
                            if (ds_list_size(_lista_near_me) > 0)
                            {
                                var _id_near = ds_list_find_value(_lista_near_me, 0)
                                var _x_near = _id_near.x
                                var _y_near = _id_near.y
                                var _dir_near = point_direction(x, y, _x_near, _y_near)
                                hspd = (-(lengthdir_x(0.5, _dir_near)))
                                vspd = (-(lengthdir_y(0.5, _dir_near)))
                            }
                            break
                        case (23 << 0):
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8)
                            if scr_chance(50)
                                scr_draw_npc_text(id, (14 << 0))
                            break
                        case (19 << 0):
                            path_end()
                            scr_enemy_choose_move_pos((last_seen_x + (irandom_range(-7, 7))), (last_seen_y + (irandom_range(-7, 7))), 0)
                            if scr_chance(75)
                                scr_draw_npc_text(id, (9 << 0))
                            break
                        case (27 << 0):
                            just_shot = 0
                            if scr_chance(75)
                                scr_draw_npc_text(id, (13 << 0))
                            break
                        case (18 << 0):
                            chase_new_target_location = false
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 16)
                            if scr_chance(50)
                                scr_draw_npc_text(id, (11 << 0))
                            break
                        case (20 << 0):
                            reloading = true
                            alarm[0] = irandom(100) + 80
                            path_end()
                            if scr_chance(50)
                                scr_draw_npc_text(id, (6 << 0))
                            have_to_reload = false
                            break
                        case (0 << 0):
                            path_end()
                            visto_prima_volta = false
                            break
                        case (11 << 0):
                            path_end()
                            if (human_state_before == (19 << 0))
                            {
                                if scr_chance(50)
                                    scr_draw_npc_text(id, (12 << 0))
                            }
                            break
                        case (21 << 0):
                            path_end()
                            if (human_state_before == (19 << 0))
                            {
                                if scr_chance(75)
                                    scr_draw_npc_text(id, (12 << 0))
                            }
                            break
                        case (28 << 0):
                            scr_enemy_choose_move_pos(ally_morto_x, ally_morto_y, 8)
                            alleato_morto_vicino = 2
                            scr_draw_npc_text(id, (15 << 0))
                            if instance_exists(id_chest_ally_dead.id_of_the_killer)
                                target = id_chest_ally_dead.id_of_the_killer
                            break
                        case (33 << 0):
                            var _y = y
                            var _pos_found = false
                            move_point_x = x + 64
                            move_point_y = y
                            break
                        case (29 << 0):
                            path_end()
                            move_point_x = _array_range_pos[0]
                            move_point_y = _array_range_pos[1]
                            break
                        case (36 << 0):
                            path_end()
                            if (target == _player.id)
                            {
                                if (can_talk == true)
                                {
                                    if scr_chance(50)
                                    {
                                        scr_npc_reset_talk(true, 180)
                                        scr_draw_npc_text(id, (3 << 0))
                                    }
                                }
                            }
                            break
                        case (37 << 0):
                            path_end()
                            if (target == _player.id)
                            {
                                if (can_talk == true)
                                {
                                    if scr_chance(101)
                                    {
                                        scr_npc_reset_talk(true, 120)
                                        scr_draw_npc_text(id, (4 << 0))
                                    }
                                }
                            }
                            break
                        case (9 << 0):
                            scr_enemy_choose_move_pos(x, y, 0)
                            break
                        case (10 << 0):
                            var _next_x = ds_list_find_value(lista_path_x, (path_position_now + 1))
                            var _next_y = ds_list_find_value(lista_path_y, (path_position_now + 1))
                            var _prev_x = ds_list_find_value(lista_path_x, path_position_now)
                            var _prev_y = ds_list_find_value(lista_path_y, path_position_now)
                            if ((!is_undefined(_next_x)) && (!is_undefined(_next_y)) && (!is_undefined(_prev_x)) && (!is_undefined(_prev_y)))
                            {
                                move_point_x = _next_x
                                move_point_y = _next_y
                                path_position_now++
                            }
                            break
                        case (3 << 0):
                            path_end()
                            scr_npc_create_animation(obj_arms_drink)
                            break
                        case (4 << 0):
                            path_end()
                            scr_npc_create_animation(obj_arms_smoke)
                            break
                        case (2 << 0):
                            path_end()
                            scr_npc_create_animation(obj_arms_eat)
                            break
                        case (8 << 0):
                            path_end()
                            scr_npc_create_animation(obj_arms_guitar)
                            break
                        case (5 << 0):
                            path_end()
                            scr_npc_create_animation(obj_arms_scientist_working)
                            break
                        case (7 << 0):
                            path_end()
                            break
                    }

                }
            }
            ds_priority_destroy(_list_action)
        }
        switch human_state_now
        {
            case (0 << 0):
                path_end()
                scr_enemy_choose_idle_or_move()
                scr_collision()
                draw_weapon = true
                if is_in_hub()
                {
                    target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                    if (x > xprevious)
                    {
                        target_for_image_scale = x + 2
                        weapon_pointing_direction = 300
                    }
                    else if (x == xprevious)
                    {
                    }
                    else if (x < xprevious)
                    {
                        target_for_image_scale = x - 2
                        weapon_pointing_direction = 240
                    }
                }
                else
                {
                    scr_move_arma_random(2, weapon_pointing_angle, 1)
                    if (object_index == obj_green_quest_swamp)
                    {
                        if instance_exists(obj_faro)
                            weapon_pointing_direction = point_direction(x, y, obj_faro.x, (obj_faro.y - 150))
                    }
                    target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                }
                break
            case (1 << 0):
                path_end()
                scr_collision()
                draw_weapon = true
                scr_move_arma_random(2, weapon_pointing_angle, 1)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                if (object_index == obj_scientist_2)
                {
                    scr_npc_state_arms(obj_arms_scientist_working)
                    if scr_chance(0.5)
                        scr_draw_npc_text(id, (95 << 0))
                }
                break
            case (11 << 0):
                var _termina_state = false
                if (shoot_time == 0)
                {
                    path_end()
                    if scr_chance(75)
                    {
                        var _xx = irandom_range(-8, 8)
                        scr_enemy_choose_move_pos((x + _xx), (y + _xx), 16)
                    }
                    else
                    {
                        move_point_x = x
                        move_point_y = y
                    }
                }
                if instance_exists(target)
                {
                    if (target_relation == (2 << 0))
                    {
                        NPCrecoil.NPCrecoil.SetAimDirection()
                        weapon_pointing_direction = NPCrecoil.direction_aim
                        scr_enemy_shoot()
                        shoot_time++
                        if (shoot_time >= shoot_time_max)
                        {
                            shoot_time = 0
                            if scr_chance(30)
                                _termina_state = true
                        }
                        if (target_visto == false)
                            _termina_state = true
                    }
                    else
                        _termina_state = true
                }
                else
                    _termina_state = true
                if (_termina_state == true)
                {
                    can_shoot_uneffective_range = false
                    state_finito = true
                }
                scr_enemy_path()
                break
            case (20 << 0):
                if (reloading == false)
                {
                    state_finito = true
                    if (image_xscale == 1)
                        weapon_pointing_direction = 0
                    else
                        weapon_pointing_direction = 180
                }
                if (current_time > (timer_last_state + aim_still_timer))
                {
                    reloading = false
                    state_finito = true
                }
                break
            case (23 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                break
            case (16 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                break
            case (17 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                break
            case (26 << 0):
                scr_collision()
                _my_faction = faction
                _my_target = target
                _my_id = id
                _my_x = x
                _my_y = y
                var _exit_state = true
                with (obj_npc_parent)
                {
                    if (id != _my_id)
                    {
                        if (faction == _my_faction)
                        {
                            if (point_distance(x, y, _my_x, _my_y) < 10)
                                _exit_state = false
                        }
                    }
                }
                if (_exit_state == true)
                    state_finito = true
                break
            case (18 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                break
            case (12 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (13 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (14 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y)
                break
            case (30 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (31 << 0):
                path_end()
                grenade_flash_timer++
                if (grenade_flash_timer >= grenade_flash_timer_max)
                {
                    grenade_flash_timer = 0
                    grenade_flash = false
                    state_finito = true
                }
                flash_weapon_dir_timer++
                if (flash_weapon_dir_timer > flash_weapon_dir_timer_max)
                {
                    flash_weapon_dir = irandom(360)
                    flash_weapon_dir_timer = 0
                }
                _angle_diff = angle_difference(flash_weapon_dir, weapon_pointing_direction)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                if (abs(_angle_diff) > angle_min_to_rotate)
                {
                    if (_angle_diff > 0)
                        weapon_pointing_direction += angle_increase_for_target
                    if (_angle_diff < 0)
                        weapon_pointing_direction -= angle_increase_for_target
                }
                shoot_time++
                if (shoot_time >= 15)
                {
                    riflessi_max = 15
                    scr_enemy_shoot()
                    shoot_time = 0
                }
                break
            case (32 << 0):
                scr_npc_arms_animation(obj_arms_drink)
                break
            case (15 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                if (current_time >= (timer_last_state + timer_last_state_max))
                    state_finito = true
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y)
                break
            case (25 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                break
            case (24 << 0):
                path_end()
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                if (current_time >= (timer_last_state + aim_still_timer))
                    state_finito = true
                break
            case (19 << 0):
                if scr_chance(npc_get_prob_idle(npc_id))
                {
                    hspd = 0
                    vspd = 0
                }
                if scr_chance(npc_get_prob_move(npc_id) * 6)
                {
                    var dir = irandom(360)
                    hspd = lengthdir_x(npc_get_spd_not_alerted(npc_id), dir)
                    vspd = lengthdir_y(npc_get_spd_not_alerted(npc_id), dir)
                }
                scr_collision()
                scr_move_arma_random(4, weapon_pointing_angle, 3)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                break
            case (27 << 0):
                path_end()
                scr_move_arma_random(4, weapon_pointing_angle, 3)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                break
            case (21 << 0):
                _dir = point_direction(x, y, dir_to_aim_x, dir_to_aim_y)
                _angle_diff = angle_difference(direction_to_aim, weapon_pointing_direction)
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                if (abs(_angle_diff) > angle_min_to_rotate)
                {
                    if (_angle_diff > 0)
                        weapon_pointing_direction += angle_increase_for_target
                    if (_angle_diff < 0)
                        weapon_pointing_direction -= angle_increase_for_target
                }
                else
                    state_finito = true
                break
            case (29 << 0):
                riflessi++
                scr_enemy_path()
                timer_recheck_eff_range++
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                {
                    state_finito = true
                    timer_recheck_eff_range = 0
                }
                if (timer_recheck_eff_range >= timer_recheck_eff_range_max)
                {
                    state_finito = true
                    timer_recheck_eff_range = 0
                    can_shoot_uneffective_range = true
                }
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y)
                break
            case (9 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (28 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (33 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true
                break
            case (36 << 0):
                if instance_exists(target)
                {
                    var _x = target.x
                    _y = target.y
                    _dir = point_direction(x, y, _x, _y)
                    weapon_pointing_direction = _dir
                    target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                    if (!(instance_line_of_sight(x, y, target)))
                        state_finito = true
                    if (point_distance(x, y, _x, _y) >= (neutral_distance_target * 1.5))
                        state_finito = true
                    timer_see_neutral++
                    if (timer_see_neutral >= timer_see_neutral_max)
                    {
                        state_finito = true
                        counter_target_seen_neutral = 1
                        timer_see_neutral = 0
                    }
                }
                break
            case (37 << 0):
                if instance_exists(target)
                {
                    _x = target.x
                    _y = target.y
                    _dir = point_direction(x, y, _x, _y)
                    weapon_pointing_direction = _dir
                    target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                    if (!(instance_line_of_sight(x, y, target)))
                        state_finito = true
                    if (instance_exists(obj_mouse) && point_distance(x, y, obj_mouse.x, obj_mouse.y) > 10)
                        state_finito = true
                }
                break
            case (10 << 0):
                scr_enemy_path()
                scr_move_arma_random(2, 1, 1)
                if (point_distance(x, y, move_point_x, move_point_y) < 2)
                {
                    state_finito = true
                    for (i = 0; i < array_length(global.list_n_id); i++)
                    {
                        if (global.list_n_id[i] == id)
                        {
                            global.list_n_x[i] = x
                            global.list_n_y[i] = y
                        }
                    }
                }
                break
            case (3 << 0):
                scr_npc_arms_animation(obj_arms_drink)
                break
            case (4 << 0):
                scr_npc_arms_animation(obj_arms_smoke)
                break
            case (2 << 0):
                scr_npc_arms_animation(obj_arms_eat)
                break
            case (5 << 0):
                scr_npc_arms_animation(obj_arms_scientist_working)
                break
            case (8 << 0):
                scr_npc_arms_animation(obj_arms_guitar)
                break
            case (7 << 0):
                scr_enemy_path()
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    path_end()
                    if (!instance_exists(obj_arms_guitar))
                    {
                        scr_npc_create_animation(obj_arms_guitar)
                        human_state_now = (8 << 0)
                    }
                    else
                        human_state_now = (0 << 0)
                }
                break
            case (6 << 0):
                path_end()
                scr_move_arma_random(2, weapon_pointing_angle, 1)
                _active = scr_check_quest_in_corso((69 << 0))
                if (global.quest_unique_done[(70 << 0)] == true)
                {
                    if (player_exists_local() && player_distance_local(x, y) < 48)
                    {
                        if (can_talk == true)
                        {
                            scr_draw_npc_text(id, (142 << 0))
                            can_talk = false
                        }
                    }
                }
                target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
                break
        }

        break
    case "human_alert":
        target = scr_find_target_for_human()
        draw_weapon = true
        if (target != noone)
        {
            if (target_relation == (2 << 0))
            {
                weapon_pointing_direction = point_direction(x, y, target.x, target.y)
                scr_enemy_alert_near_enemy()
                if instance_line_of_sight(x, y, target)
                    state = "human_shoot"
                else
                {
                    move_point_x = 0
                    move_point_y = 0
                    if (point_distance(x, y, target.x, target.y) < 200)
                    {
                        scr_enemy_search_shoot_position()
                        if (move_point_x != 0)
                            state = "human_move_to_shoot_position"
                        else
                        {
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 64)
                            state = "human_chase_target"
                        }
                    }
                    else if scr_chance(0.5)
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 64)
                        state = "human_chase_target"
                    }
                }
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        break
    case "human_take_cover":
        if (object_index == obj_green_quest_swamp)
            state = "human_alert"
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            target = scr_find_target_for_human()
            if (target_relation == (2 << 0))
            {
                if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.5))
                {
                    var chance = (100 - ammo_now * 100 / item_weapon_get_magazine(arma_now)) * 2
                    if scr_chance(chance)
                    {
                        state = "human_reloading"
                        reloading = true
                        alarm[0] = irandom(100) + 60
                        scr_draw_npc_text(id, (6 << 0))
                    }
                }
                else if (target != noone)
                    state = "human_alert"
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        scr_enemy_path()
        break
    case "human_move_to_shoot_position":
        target = scr_find_target_for_human()
        if (target != noone)
        {
            if (target_relation == (2 << 0))
            {
                weapon_pointing_direction = point_direction(x, y, target.x, target.y)
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    if instance_line_of_sight(x, y, target)
                        state = "human_shoot"
                    else
                        state = "human_alert"
                }
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        scr_enemy_path()
        break
    case "human_shoot":
        draw_weapon = true
        if (shoot_time == 0)
        {
            path_end()
            if scr_chance(75)
                scr_enemy_choose_move_pos(x, y, 16)
            else
            {
                move_point_x = x
                move_point_y = y
            }
        }
        if (hp <= (0.3 * npc_get_hp(npc_id)))
        {
            if scr_chance(1)
                scr_draw_npc_text(id, (2 << 0))
        }
        target = scr_find_target_for_human()
        if (target != noone)
        {
            if (target_relation == (2 << 0))
            {
                last_seen_x = target.x
                last_seen_y = target.y
                if instance_line_of_sight(x, y, target)
                {
                    if (point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.5))
                    {
                        scr_enemy_alert_near_enemy()
                        scr_enemy_shoot()
                        shoot_time++
                        if (shoot_time >= shoot_time_max)
                        {
                            shoot_time = 0
                            if scr_chance(50)
                            {
                                if scr_chance(80)
                                {
                                    scr_enemy_search_cover_position()
                                    state = "human_take_cover"
                                    scr_draw_npc_text(id, (1 << 0))
                                }
                                else
                                {
                                    scr_enemy_change_cover()
                                    state = "human_take_cover"
                                }
                            }
                            else
                            {
                                state = "human_shoot"
                                if scr_chance(10)
                                    scr_draw_npc_text(id, (0 << 0))
                            }
                            if (point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y) < 16)
                            {
                                scr_enemy_search_cover_position()
                                state = "human_take_cover"
                                scr_draw_npc_text(id, (1 << 0))
                            }
                        }
                    }
                    else
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8)
                        state = "human_chase_target"
                        scr_draw_npc_text(id, (8 << 0))
                    }
                }
                else
                {
                    shoot_time = 0
                    riflessi = 0
                    if scr_chance(0.13)
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8)
                        state = "human_chase_target"
                        scr_draw_npc_text(id, (8 << 0))
                    }
                }
                if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.5))
                {
                    chance = 100 - ammo_now * 100 / item_weapon_get_magazine(arma_now)
                    if scr_chance(chance)
                    {
                        scr_enemy_search_cover_position()
                        state = "human_take_cover"
                        scr_draw_npc_text(id, (7 << 0))
                    }
                    if (npc_get_spd_alerted(npc_id) == 0)
                    {
                        if scr_chance(chance)
                        {
                            state = "human_reloading"
                            reloading = true
                            alarm[0] = irandom(100) + 60
                            scr_draw_npc_text(id, (6 << 0))
                        }
                    }
                }
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        scr_enemy_path()
        break
    case "human_chase_target":
        target = scr_find_target_for_human()
        draw_weapon = true
        if (target != noone)
        {
            if (target_relation == (2 << 0))
            {
                if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.4))
                    state = "human_shoot"
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    if (!(instance_line_of_sight(x, y, target)))
                    {
                        path_end()
                        alarm[5] = reset_state_to_patrol_time
                        state = "human_look_around"
                        scr_draw_npc_text(id, (9 << 0))
                    }
                }
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        scr_enemy_path()
        break
    case "human_encounter_chase":
        if (faction != "Mutants")
        {
            target = scr_find_target_for_human()
            if (target != noone)
            {
                if (target_relation == (2 << 0))
                {
                    if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.2))
                        state = "human_shoot"
                }
                if (target_relation == (0 << 0))
                {
                    hspd = 0
                    vspd = 0
                    state = "human_aim_neutral_target"
                }
                if (target_relation == (1 << 0))
                {
                    hspd = 0
                    vspd = 0
                    state = "human_patrol"
                }
            }
        }
        if (faction == "Mutants")
        {
            if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < 400)
                state = "mutant_alert"
        }
        move_point_x = target.x
        move_point_y = target.y
        scr_enemy_path()
        break
    case "human_look_around":
        target = scr_find_target_for_human()
        draw_weapon = true
        if scr_chance(npc_get_prob_idle(npc_id))
        {
            hspd = 0
            vspd = 0
        }
        if scr_chance(npc_get_prob_move(npc_id) * 6)
        {
            dir = irandom(360)
            hspd = lengthdir_x(npc_get_spd_not_alerted(npc_id), dir)
            vspd = lengthdir_y(npc_get_spd_not_alerted(npc_id), dir)
        }
        scr_collision()
        if (target != noone)
        {
            if scr_chance(2)
                weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
            weapon_pointing_direction += weapon_pointing_amount
            target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
            if (target_relation == (2 << 0))
            {
                if instance_line_of_sight(x, y, target)
                {
                    scr_draw_npc_text(id, (12 << 0))
                    state = "human_alert"
                }
            }
            if (target_relation == (0 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_aim_neutral_target"
            }
            if (target_relation == (1 << 0))
            {
                hspd = 0
                vspd = 0
                state = "human_patrol"
            }
        }
        break
    case "human_reloading":
        if (reloading == false)
            state = "human_alert"
        if (image_xscale == 1)
            weapon_pointing_direction = 0
        else
            weapon_pointing_direction = 180
        break
    case "quest_swamp_leader_talk":
        break
    case "scientist_idle":
        scr_enemy_choose_idle_or_move()
        scr_collision()
        if scr_chance(2)
            weapon_pointing_amount = choose((-weapon_pointing_angle), weapon_pointing_angle, 0)
        weapon_pointing_direction += weapon_pointing_amount
        target_for_image_scale = x + (lengthdir_x(2, weapon_pointing_direction))
        target = scr_find_target_for_human()
        if (target != noone)
        {
            switch target_relation
            {
                case (2 << 0):
                    hspd = 0
                    vspd = 0
                    state = "human_shoot"
                    break
                case (0 << 0):
                    break
                case (1 << 0):
                    break
            }

        }
        break
    case "scientist_working":
        scr_npc_state_arms(obj_arms_scientist_working)
        if scr_chance(0.2)
            scr_draw_npc_text(id, (95 << 0))
        break
    case "mutant_patrol":
        scr_bullet_near()
        state_enemy_mutant_patrol()
        break
    case "mutant_alert":
        scr_bullet_near()
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            if instance_exists(target)
            {
                target_for_image_scale = target.x
                if (move_point_x == 0)
                {
                    var range_ = 64
                    move_point_x = target.x + (irandom_range((-range_), range_))
                    move_point_y = target.y + (irandom_range((-range_), range_))
                }
                last_seen_x = target.x
                last_seen_y = target.y
                range_ = 64
                if scr_chance(npc_get_prob_move(npc_id))
                {
                    move_point_x = target.x + (irandom_range((-range_), range_))
                    move_point_y = target.y + (irandom_range((-range_), range_))
                    path_timer = path_timer_reset + 1
                }
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    move_point_x = target.x + (irandom_range(((-range_) * 2), (range_ * 2)))
                    move_point_y = target.y + (irandom_range(((-range_) * 2), (range_ * 2)))
                    path_timer = path_timer_reset + 1
                }
                if scr_chance(npc_get_prob_attack(npc_id))
                {
                    move_point_x = target.x
                    move_point_y = target.y
                    path_timer = path_timer_reset + 1
                }
                if (object_index == obj_enemy_ghoul)
                {
                    if (point_distance(x, y, target.x, target.y) < 80 && point_distance(x, y, target.x, target.y) > 40)
                    {
                        if (can_attack == true)
                        {
                            if scr_chance(2)
                                state = "ghoul_attack1"
                        }
                    }
                }
                if (object_index == obj_enemy_big)
                {
                    if scr_chance(0.2)
                        state = "big_aggro"
                    if (point_distance(x, y, target.x, target.y) > 32 && point_distance(x, y, target.x, target.y) < 80)
                    {
                        if (can_attack == true)
                        {
                            if scr_chance(20)
                            {
                                can_attack = false
                                alarm[8] = attack_recovery
                                dir_attack = point_direction(x, y, target.x, target.y)
                                state = "big_attack1"
                                var sspd = 3
                                hspd = lengthdir_x(sspd, dir_attack)
                                vspd = lengthdir_y(sspd, dir_attack)
                            }
                        }
                    }
                }
                if (object_index == obj_enemy_blink)
                {
                    if (point_distance(x, y, target.x, target.y) < 16)
                    {
                        if (can_attack == true)
                        {
                            can_attack = false
                            state = "blink_attack1"
                            alarm[8] = attack_recovery
                            audio_play_sound_on(emitter_talk, snd_blink_attack1, false, 20)
                        }
                    }
                }
            }
        }
        else
            scr_mutant_target_not_in_sight()
        scr_enemy_path()
        break
    case "wolf_idle1":
        scr_enemy_choose_idle_or_move()
        scr_collision()
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            state = "wolf_ringhio"
        }
        if (target == noone)
        {
            tick++
            if (tick >= tick_max)
            {
                tick = 0
                _x = x
                _y = y
                _next_state = "wolf_idle1"
                if scr_chance(8)
                    _next_state = "wolf_idle2"
                if scr_chance(5)
                    _next_state = "wolf_sleep"
                if scr_chance(0.5)
                    _next_state = "wolf_ululato"
                var _move_x = 0
                var _move_y = 0
                with (obj_chest_general)
                {
                    if chest_is_drop(tipo)
                    {
                        if (point_distance(x, y, _x, _y) < 96)
                        {
                            var _r = 10
                            _move_x = x + (irandom_range((-_r), _r))
                            _move_y = y + (irandom_range(((-_r) / 2), (_r / 2)))
                        }
                    }
                }
                if (_move_x != 0 && _move_y != 0)
                {
                    var _eat_counter = 0
                    with (obj_enemy_wolf_brown)
                    {
                        if (state == "wolf_eat" || state == "wolf_move_to_eat")
                            _eat_counter++
                    }
                    if (_eat_counter < 2)
                    {
                        _next_state = "wolf_move_to_eat"
                        move_point_x = _move_x
                        move_point_y = _move_y
                        path_timer = path_timer_reset
                    }
                }
                if (_next_state != "wolf_move_to_eat")
                    var _ret = scr_wolf_decidi_attaccare()
                if (_next_state == "wolf_ululato")
                {
                    var _sound = choose(293, 294)
                    var sound_durata = audio_sound_length(_sound)
                    wolf_ululato_max = sound_durata * 60
                    wolf_ululato = 0
                    audio_play_sound_on(emitter_shoot, _sound, false, 20)
                }
                state = _next_state
            }
        }
        break
    case "wolf_idle2":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            state = "wolf_ringhio"
        }
        if (target == noone)
        {
            var _end = scr_animation_end(188)
            if (_end == true)
                state = "wolf_idle1"
        }
        break
    case "wolf_move_to_eat":
        target = scr_find_target_for_mutant(wolf_alert_raggio2)
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            state = "wolf_ringhio"
        }
        if (target == noone)
        {
            if (point_distance(x, y, move_point_x, move_point_y) < 4)
                state = "wolf_eat"
        }
        scr_enemy_path()
        break
    case "wolf_eat":
        target = scr_find_target_for_mutant(wolf_alert_raggio2)
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            state = "wolf_ringhio"
        }
        if (target == noone)
        {
            _end = scr_animation_end(190)
            if (_end == true)
            {
                if scr_chance(12)
                    state = "wolf_idle1"
            }
        }
        scr_enemy_path()
        break
    case "wolf_sleep":
        target = scr_find_target_for_mutant(wolf_alert_raggio2)
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            state = "wolf_ringhio"
            image_index = 0
        }
        if (target == noone)
        {
            _end = scr_animation_end(195)
            if (_end == true)
            {
                if scr_chance(20)
                    state = "wolf_idle1"
            }
        }
        break
    case "wolf_ringhio":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        path_end()
        if (target != noone)
        {
            hspd = 0
            vspd = 0
            _end = scr_animation_end(196)
            if (_end == true)
            {
                var _attack = scr_wolf_decidi_attaccare()
                if (_attack == true)
                    state = "wolf_alert"
            }
        }
        if (target == noone)
        {
            _end = scr_animation_end(196)
            if (_end == true)
                state = "wolf_idle1"
        }
        break
    case "wolf_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if instance_exists(target)
        {
            if (target != noone)
            {
                hspd = 0
                vspd = 0
                tick++
                if (tick >= tick_max)
                {
                    tick = 0
                    _next_state = "wolf_alert"
                    var _movex = 0
                    var _movey = 0
                    var _id = id
                    var _counter_attack = 0
                    var _max_attack = 3
                    var _counter_ululato = 0
                    var _ululato_max = 2
                    var _target = target
                    with (obj_enemy_wolf_brown)
                    {
                        if (id != _id)
                        {
                            if (state == "wolf_attack_1")
                            {
                                if (target == _target)
                                    _counter_attack++
                            }
                            if (state == "wolf_ululato")
                                _counter_ululato++
                        }
                    }
                    _id = id
                    _target = target
                    _x = x
                    _y = y
                    with (obj_enemy_wolf_brown)
                    {
                        if (_id != id)
                        {
                            if (target == noone)
                            {
                                if (point_distance(x, y, _x, _y) < 96)
                                {
                                    target = _target
                                    search_target_id = _target
                                }
                            }
                        }
                    }
                    if scr_chance(30)
                    {
                        _dir = irandom(360)
                        _dis = 32
                        _movex = target.x + (lengthdir_x(_dis, _dir))
                        _movey = target.y + (lengthdir_y(_dis, _dir))
                        path_timer = path_timer_reset
                    }
                    if scr_chance(5)
                        _next_state = "wolf_ringhio"
                    _dis = point_distance(x, y, target.x, target.y)
                    if (_dis < 32)
                    {
                        if (can_attack == true)
                        {
                            if (_counter_attack < _max_attack)
                            {
                                can_attack = false
                                alarm[8] = 60
                                _next_state = "wolf_attack_1"
                                dir_attack = point_direction(x, y, target.x, target.y)
                                sspd = 2.5
                                hspd = lengthdir_x(sspd, dir_attack)
                                vspd = lengthdir_y(sspd, dir_attack)
                            }
                        }
                    }
                    if (_counter_ululato < _ululato_max)
                    {
                        if (_counter_attack >= _max_attack)
                        {
                            if scr_chance(12)
                                _next_state = "wolf_ululato"
                        }
                        if scr_chance(2)
                            _next_state = "wolf_ululato"
                    }
                    _dis = point_distance(x, y, target.x, target.y)
                    if (_dis > 96)
                    {
                        _dir = irandom(360)
                        _dis = 32
                        _movex = target.x + (lengthdir_x(_dis, _dir))
                        _movey = target.y + (lengthdir_y(_dis, _dir))
                    }
                    if (_next_state == "wolf_ululato")
                    {
                        _sound = choose(293, 294)
                        sound_durata = audio_sound_length(_sound)
                        wolf_ululato_max = sound_durata * 60
                        wolf_ululato = 0
                        audio_play_sound_on(emitter_shoot, _sound, false, 20)
                    }
                    state = _next_state
                    move_point_x = _movex
                    move_point_y = _movey
                    _ret = scr_wolf_decidi_attaccare()
                }
                if (point_distance(x, y, move_point_x, move_point_y) < 3)
                {
                    _dis = 28
                    _dir = irandom(360)
                    _movex = target.x + (lengthdir_x(_dis, _dir))
                    _movey = target.y + (lengthdir_y(_dis, _dir))
                    move_point_x = _movex
                    move_point_y = _movey
                    path_timer = path_timer_reset
                    _ret = scr_wolf_decidi_attaccare()
                }
                if (move_point_x != 0 && move_point_y != 0)
                    scr_enemy_path()
                if (point_distance(x, y, target.x, target.y) > 220)
                    state = "wolf_idle1"
            }
            if (target == noone)
            {
                state = "wolf_idle1"
                if instance_exists(search_target_id)
                {
                    if (point_distance(x, y, search_target_id.x, search_target_id.y) > 220)
                        state = "wolf_idle1"
                    else
                        scr_mutant_target_not_in_sight()
                }
            }
        }
        break
    case "wolf_attack_1":
        path_end()
        _end = scr_animation_end(191)
        if (_end == true)
        {
            state = "wolf_alert"
            hspd = 0
            vspd = 0
        }
        if instance_exists(target)
        {
            if (image_index < 5)
            {
                dir_attack = point_direction(x, y, target.x, target.y)
                sspd = 3
                hspd = lengthdir_x(sspd, dir_attack)
                vspd = lengthdir_y(sspd, dir_attack)
            }
            if (image_index >= 5)
                scr_collision()
        }
        else
            state = "wolf_idle1"
        break
    case "wolf_attack_2":
        path_end()
        hspd = 0
        vspd = 0
        _end = scr_animation_end(193)
        if (_end == true)
        {
            state = "wolf_alert"
            hspd = 0
            vspd = 0
        }
        break
    case "wolf_run_to_amico":
        if (point_distance(x, y, move_point_x, move_point_y) < 10)
            state = "wolf_idle1"
        scr_enemy_path()
        break
    case "wolf_ululato":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        path_end()
        if (image_index >= (image_number - 2))
            image_index = image_number - 2
        wolf_ululato++
        if (wolf_ululato >= wolf_ululato_max)
        {
            if (target != noone)
            {
                hspd = 0
                vspd = 0
                state = "wolf_alert"
            }
            if (target == noone)
                state = "wolf_idle1"
        }
        break
    case "big_aggro":
        path_end()
        hspd = 0
        vspd = 0
        if (image_index >= 3)
        {
            sound_durata = audio_sound_length(snd_big_ruggito_1) - 2.5
            timer_ruggito_max = sound_durata * 60
            timer_ruggito = 0
            audio_play_sound_on(emitter_shoot, snd_big_ruggito_1, false, 20)
            state = "big_ruggito"
        }
        break
    case "big_ruggito":
        timer_ruggito++
        if (timer_ruggito >= timer_ruggito_max)
        {
            timer_ruggito = 0
            state = "mutant_alert"
        }
        break
    case "big_attack1":
        path_end()
        if instance_exists(target)
        {
            if (image_index >= (sprite_get_number(sprite_index) - 1))
            {
                state = "mutant_alert"
                path_timer = 999
            }
            if (image_index >= 4)
            {
                hspd = 0
                vsdp = 0
            }
            scr_collision()
        }
        break
    case "boar_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            target_for_image_scale = target.x
            if (move_point_x == 0)
            {
                range_ = 64
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            path_end()
            last_seen_x = target.x
            last_seen_y = target.y
            range_ = 64
            if scr_chance(npc_get_prob_attack(npc_id))
            {
                move_point_x = target.x
                move_point_y = target.y
            }
            if scr_chance(npc_get_prob_move(npc_id))
            {
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            if (point_distance(x, y, target.x, target.y) < 8)
            {
                dir = point_direction(x, y, target.x, target.y)
                var spazio_frenata = 64
                start_frenata_x = target.x + (lengthdir_x(spazio_frenata, dir))
                start_frenata_y = target.y + (lengthdir_y(spazio_frenata, dir))
                state = "boar_frenata"
                frenata_dir = dir
            }
            if (point_distance(x, y, target.x, target.y) > 80)
            {
                if scr_chance(5)
                {
                    state = "boar_raspare"
                    if (target == player_get_local())
                        audio_play_sound_on(emitter_shoot, snd_boar_charge, false, 10)
                }
            }
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid)
        }
        else
            scr_mutant_target_not_in_sight()
        break
    case "boar_frenata":
        frenata_step++
        if (frenata_step >= frenata_step_max)
        {
            frenata_step = 0
            state = "mutant_patrol"
        }
        hspd = (lengthdir_x(npc_get_spd_alerted(npc_id), frenata_dir)) - (lengthdir_x(npc_get_spd_alerted(npc_id), frenata_dir)) / frenata_step_max * frenata_step
        vspd = (lengthdir_y(npc_get_spd_alerted(npc_id), frenata_dir)) - (lengthdir_y(npc_get_spd_alerted(npc_id), frenata_dir)) / frenata_step_max * frenata_step
        scr_collision()
        break
    case "boar_raspare":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        _end = scr_animation_end(106)
        if (target != noone)
        {
            if (_end == true)
                state = "boar_carica"
        }
        else
            scr_mutant_target_not_in_sight()
        if (image_index == 2 || image_index == 8 || image_index == 14)
        {
            var a = (45 << 0)
            var ob = obj_particles_controller
            if (image_xscale == 1)
                part_type_direction(ob.particles_type[a], -10, 10, 0, 0)
            else
                part_type_direction(ob.particles_type[a], 170, 190, 0, 0)
            part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], (x + 2 * image_xscale), (x + 2 * image_xscale), (y + 13), (y + 11), 0, 1)
            part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 4)
        }
        hspd = 0
        vspd = 0
        scr_collision()
        break
    case "boar_carica":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            move_point_x = target.x
            move_point_y = target.y
            if (move_point_x != 0 && move_point_y != 0)
                scr_enemy_path()
            if (point_distance(x, y, target.x, target.y) < 8)
            {
                dir = point_direction(x, y, target.x, target.y)
                spazio_frenata = 64
                start_frenata_x = target.x + (lengthdir_x(spazio_frenata, dir))
                start_frenata_y = target.y + (lengthdir_y(spazio_frenata, dir))
                state = "boar_frenata"
                frenata_dir = dir
            }
        }
        else
            scr_mutant_target_not_in_sight()
        break
    case "blink_attack1":
        hspd = 0
        vspd = 0
        path_end()
        if (image_index >= (sprite_get_number(sprite_index) - 1))
            state = "mutant_alert"
        break
    case "wolf_attack":
        hspd = 0
        vspd = 0
        path_end()
        if (image_index >= (sprite_get_number(sprite_index) - 1))
            state = "mutant_alert"
        break
    case "wolf_attack2":
        path_end()
        if instance_exists(target)
        {
            if (image_index >= 6)
            {
                state = "mutant_alert"
                range_ = 64
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
                path_timer = 999
            }
            scr_collision()
        }
        else
            state = "mutant_patrol"
        break
    case "ghoul_attack1":
        path_end()
        hspd = 0
        vspd = 0
        if instance_exists(target)
        {
            if (image_index >= 8 && can_attack == true)
            {
                dir_attack = point_direction(x, y, target.x, target.y)
                can_attack = false
                alarm[8] = attack_recovery
                var bul = instance_create_depth(x, (y - 10), 0, obj_bullet_ghoul)
                sspd = 3
                bul.hspd = lengthdir_x(sspd, dir_attack)
                bul.vspd = lengthdir_y(sspd, dir_attack)
                bul.damage = 10
                bul.shooter_faction = faction
                bul.shooter_id = id
                audio_play_sound_on(emitter_talk, snd_ghoul_attack, false, 5)
            }
            if (image_index >= 11)
                state = "mutant_alert"
        }
        break
    case "wraith_fire_patrol":
        state_enemy_mutant_patrol()
        break
    case "wraith_fire_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            target_for_image_scale = target.x
            if (move_point_x == 0)
            {
                range_ = 64
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            path_end()
            range_ = 128
            if scr_chance(npc_get_prob_attack(npc_id))
            {
                move_point_x = target.x
                move_point_y = target.y
            }
            if scr_chance(npc_get_prob_move(npc_id))
            {
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            if scr_chance(prob_attac)
            {
                var vel = bullet_spd
                dir = point_direction(x, y, target.x, target.y)
                var bull = instance_create_depth(x, y, (-y), obj_bullet_wraith_fire)
                bull.hspd = lengthdir_x(vel, dir)
                bull.vspd = lengthdir_y(vel, dir)
                bull.damage = damage_bullet
                bull.shooter_faction = faction
                bull.shooter_id = id
            }
            if (abs(x - move_point_x) < 8 && abs(y - move_point_y) < 8)
            {
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid)
        }
        else
            scr_mutant_target_not_in_sight()
        break
    case "wraith_electric_patrol":
        state_enemy_mutant_patrol()
        break
    case "wraith_electric_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            target_for_image_scale = target.x
            if (move_point_x == 0)
            {
                range_ = 64
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            path_end()
            last_seen_x = target.x
            last_seen_y = target.y
            range_ = 64
            if scr_chance(npc_get_prob_attack(npc_id))
            {
                move_point_x = target.x
                move_point_y = target.y
            }
            if scr_chance(npc_get_prob_move(npc_id))
            {
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            if (point_distance(x, y, target.x, target.y) < 96)
            {
                if scr_chance(prob_attack1)
                {
                    instance_create_depth(x, y, 0, obj_hud_get_hit)
                    var dis_ = point_distance(x, y, target.x, target.y)
                    var dir_ = point_direction(x, y, target.x, target.y)
                    a = (9 << 0)
                    ob = obj_particles_controller
                    var dis1 = 0
                    var dir1 = 0
                    var amount_ = choose(-1, 1)
                    var dividendo = irandom(7) + 3
                    for (i = 0; i < dis_; i++)
                    {
                        var xo = x + (lengthdir_x(i, dir_))
                        var yo = y + (lengthdir_y(i, dir_))
                        dividendo = irandom(7) + 3
                        if (frac(i / dividendo) == 0)
                            amount_ = (-amount_)
                        dis1 += amount_
                        dir1 = dir_ + 90
                        var x1 = xo + (lengthdir_x(dis1, dir1))
                        var y1 = yo + (lengthdir_y(dis1, dir1))
                        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x1, x1, y1, y1, 0, 1)
                        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a])
                    }
                    instance_create_depth(x1, y1, 0, obj_light_electric_spark)
                    target.hp -= dmg_attack1
                }
            }
            if (abs(x - move_point_x) < 8 && abs(y - move_point_y) < 8)
            {
                move_point_x = target.x + (irandom_range((-range_), range_))
                move_point_y = target.y + (irandom_range((-range_), range_))
            }
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid)
        }
        else
            scr_mutant_target_not_in_sight()
        break
    case "rabbit_idle":
        scr_enemy_choose_idle_or_move()
        scr_collision()
        if scr_chance(0.5)
        {
            state = "rabbit_idle2"
            hspd = 0
            vspd = 0
        }
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != -4)
        {
            hspd = 0
            vspd = 0
            var range = 128
            move_point_x = x + (irandom_range(((-range) - range / 2), (range + range / 2)))
            move_point_y = y + (irandom_range(((-range) - range / 2), (range + range / 2)))
            state = "rabbit_escape"
        }
        break
    case "rabbit_idle2":
        scr_collision()
        if (image_index >= (sprite_get_number(s_rabbit_idle2) - 2))
            state = "rabbit_idle"
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != -4)
        {
            hspd = 0
            vspd = 0
            range = 128
            move_point_x = x + (irandom_range(((-range) - range / 2), (range + range / 2)))
            move_point_y = y + (irandom_range(((-range) - range / 2), (range + range / 2)))
            state = "rabbit_escape"
        }
        break
    case "rabbit_escape":
        path_timer++
        if (path_timer >= path_timer_reset)
        {
            path_timer = 0
            path_end()
            path_clear_points(path_to_target)
            mp_grid_path(global.grid_move, path_to_target, x, y, move_point_x, move_point_y, true)
            path_start(path_to_target, npc_get_spd_alerted(npc_id), path_action_stop, false)
        }
        target_for_image_scale = move_point_x
        if (abs(x - move_point_x) < 16 && abs(y - move_point_y) < 16)
            state = "rabbit_idle"
        break
    case "crow_idle1":
        scr_enemy_choose_idle_or_move()
        scr_collision()
        if scr_chance(0.5)
        {
            state = "crow_idle2"
            hspd = 0
            vspd = 0
        }
        scr_enemy_crow_check_if_escape()
        break
    case "crow_idle2":
        scr_collision()
        if (image_index >= (sprite_get_number(s_crow_idle2) - 2))
            state = "crow_idle1"
        scr_enemy_crow_check_if_escape()
        break
    case "crow_escape":
        move_towards_point(move_point_x, move_point_y, 2.5)
        if (point_distance(x, y, move_point_x, move_point_y) < 16)
            instance_destroy()
        break
    case "crow_eat":
        if scr_chance(0.5)
        {
            state = "crow_pause_eat"
            hspd = 0
            vspd = 0
        }
        scr_enemy_crow_check_if_escape()
        break
    case "crow_pause_eat":
        speed = 0
        if scr_chance(1)
        {
            image_index = 0
            state = "crow_eat"
        }
        scr_enemy_crow_check_if_escape()
        break
    case "crow_move_to_target":
        move_towards_point(move_point_x, move_point_y, 2)
        if (point_distance(x, y, move_point_x, move_point_y) < 128 && point_distance(x, y, move_point_x, move_point_y) > 64)
        {
            if scr_chance(10)
            {
                var ss = choose(320, 321, 322, 323, 324)
                if (!audio_is_playing(ss))
                    audio_play_sound(ss, 10, false)
            }
        }
        if (point_distance(x, y, move_point_x, move_point_y) < (irandom(3) + 1))
        {
            speed = 0
            range = 500
            dir = irandom_range(45, 135)
            move_point_x = x + (lengthdir_x(range, dir))
            move_point_y = y + (lengthdir_y(range, dir))
            if scr_chance(30)
                state = "crow_pause_eat"
            else
                state = "crow_eat"
        }
        break
    case "infestation_idle":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
        if (target != noone)
        {
            timer++
            if (timer >= timer_max)
            {
                timer = 0
                if (spawned < spawn_max)
                {
                    var _amount = spawn_amount
                    if (spawned == 0)
                        _amount = 3
                    repeat _amount
                    {
                        var oo = instance_create_depth(x, (y + 8), 0, obj_enemy_ghoul)
                        oo.target = target
                        oo.search_target_id = target
                    }
                    spawned += _amount
                }
            }
        }
        break
    default:
        trace_error("State \"", state, "\" unhandled")
        break
}

if is_in_raid()
{
    if (global.emission_make_npc_die == true)
    {
        if (global.is_emission_now == false)
        {
            if instance_exists(obj_map_generator)
            {
                if (y < obj_map_generator.map_height)
                    hp = -100
            }
        }
    }
}
if (hp <= 0)
{
    hp = -100
    if (play_sound_death == true)
    {
        var sound_ = -1
        switch object_index
        {
            case obj_enemy_wolf_brown:
                sound_ = 291
                break
            case 315:
                sound_ = 319
                break
            case 316:
                sound_ = 319
                break
            case 307:
                sound_ = 330
                break
            case 317:
                sound_ = 313
                break
            case 309:
                sound_ = 305
                break
        }

        if (sound_ != -1)
        {
            var emitter_death = instance_create_depth(x, y, 0, obj_emitter_death_sound)
            emitter_death.sound_ = sound_
        }
    }
    if (object_index == obj_enemy_infestation || object_index == obj_enemy_infestation_motel)
    {
        var o = obj_particles_controller
        a = (2 << 0)
        part_particles_create(o.particles_system[a], x, y, o.particles_type[a], o.particle_amount[a])
    }
    if (object_index == obj_forest_trader)
    {
        global.az_done[(1 << 0)] = true
        ga_addDesignEvent("UniqueNPC:Igor", 1)
    }
    if (object_index == obj_junk_trader)
    {
        global.az_done[(11 << 0)] = true
        ga_addDesignEvent("UniqueNPC:MrJunk", 1)
    }
    var _size = array_length_1d(global.list_n_id)
    for (i = 0; i < _size; i++)
    {
        if (id == global.list_n_id[i])
        {
            global.list_n_id[i] = -4
            global.list_n_hp[i] = -10
            part_create_blood(0, 360, 7)
        }
    }
    if (dead_outside_game_window == true)
        create_item_in_chest = false
    instance_destroy()
}
if (state == "wolf_ringhio" && state_before != "wolf_ringhio")
    audio_play_sound_on(emitter_talk, snd_wolf_growl, false, 8)
if (state != "deactivate")
    state_before = state
if (!is_in_hub())
{
    var _visibility = player_line_of_sight(x, y)
    if (_visibility == undefined)
    {
    }
    else if _visibility
        image_alpha = min(1, (image_alpha + a_gain))
    else
    {
        timer_visible++
        if (timer_visible >= timer_visible_max)
            image_alpha = max(0, (image_alpha - a_gain / 2))
    }
}
if (_lista_near_me != undefined)
    ds_list_destroy(_lista_near_me)
