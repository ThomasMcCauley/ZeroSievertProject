function fun_target_near(argument0, argument1) //gml_Script_fun_target_near
{
    var _state = false
    if instance_exists(argument0)
    {
        var _x = argument0.x
        var _y = argument0.y
        if (point_distance(x, y, _x, _y) < argument1)
            _state = true
        else
            _state = false
    }
    else
        _state = false
    return _state;
}

function fun_move_to_target(argument0, argument1) //gml_Script_fun_move_to_target
{
    if instance_exists(argument0)
    {
        _x = argument0.x
        _y = argument0.y
        move_towards_point(_x, _y, argument1)
    }
}

function fun_move_to_pos(argument0, argument1, argument2) //gml_Script_fun_move_to_pos
{
    move_towards_point(argument0, argument1, argument2)
}

function fun_target_found() //gml_Script_fun_target_found
{
    _state = false
    if instance_exists(obj_light_controller)
    {
        var alert_distance = npc_get_alert_visual_distance(npc_id)
        var alert_angle = npc_get_alert_radius(npc_id)
        var lc = obj_light_controller
        var t_hm = time_get_hours_fraction()
        var k = 1.5
        if (lc.ciclo_now == (3 << 0))
        {
            alert_distance = npc_get_alert_visual_distance(npc_id) / k
            alert_angle = npc_get_alert_radius(npc_id) / k
        }
        if (lc.ciclo_now == (0 << 0))
        {
            var hours_sunrise = (lc.ciclo_time[(1 << 0)]) - (lc.ciclo_time[(0 << 0)])
            var amount = (t_hm - (lc.ciclo_time[(0 << 0)])) / hours_sunrise
            alert_angle = lerp((npc_get_alert_radius(npc_id) / k), npc_get_alert_radius(npc_id), amount)
            alert_distance = lerp((npc_get_alert_visual_distance(npc_id) / k), npc_get_alert_visual_distance(npc_id), amount)
        }
        if (lc.ciclo_now == (2 << 0))
        {
            hours_sunrise = (lc.ciclo_time[(3 << 0)]) - (lc.ciclo_time[(2 << 0)])
            amount = (t_hm - (lc.ciclo_time[(2 << 0)])) / hours_sunrise
            alert_angle = lerp(npc_get_alert_radius(npc_id), (npc_get_alert_radius(npc_id) / k), amount)
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id), (npc_get_alert_visual_distance(npc_id) / k), amount)
        }
        var x2 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        var y2 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        var x3 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        var y3 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        var _target = noone
        var _d = alert_distance
        var _relation = global.faction_limit_max
        var my_id = id
        var _temp_relation = (1 << 0)
        with (obj_npc_parent)
        {
            if (id != my_id)
            {
                var relation = faction_get_rep(faction, other.faction)
                if (relation <= _relation)
                {
                    if (point_distance(x, y, other.x, other.y) < alert_distance)
                    {
                        if instance_line_of_sight(x, y, other)
                        {
                            var temp_id = id
                            if point_in_triangle(temp_id.x, temp_id.y, other.x, other.y, x2, y2, x3, y3)
                            {
                                _target = id
                                _relation = relation
                            }
                            if (point_distance(x, y, temp_id.x, temp_id.y) <= npc_get_alert_min_distance(npc_id))
                            {
                                _target = id
                                _relation = relation
                            }
                        }
                    }
                }
            }
        }
        alert_distance *= global.sk_k[(10 << 0)]
        x2 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        y2 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        x3 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        y3 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        var _nearest_player = player_nearest_instance(x, y)
        if instance_exists(_nearest_player)
        {
            var _player_index = _nearest_player.mp_index
            if (!(player_state_is(_player_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
            {
                relation = faction_get_rep(faction, "Player")
                if (relation <= _relation)
                {
                    if instance_line_of_sight(x, y, _nearest_player)
                    {
                        var _distance_to_player = player_distance(x, y, _player_index)
                        if (point_in_triangle(_nearest_player.x, _nearest_player.y, x, y, x2, y2, x3, y3) || _distance_to_player <= npc_get_alert_min_distance(npc_id))
                        {
                            alert_player += (human_tick_max * alert_distance / (max(1, _distance_to_player)))
                            if (alert_player >= alert_player_max)
                            {
                                _target = _nearest_player
                                _relation = relation
                            }
                        }
                    }
                }
            }
        }
        var _ho_gia_target = false
        var _target_rel = (1 << 0)
        var _n_rel = _relation
        var _new_target = _target
        if instance_exists(target)
        {
            _ho_gia_target = true
            _target_rel = faction_get_rep(faction, target.faction)
        }
        if (_new_target != noone)
            _n_rel = faction_get_rep(faction, _new_target.faction)
        if (_ho_gia_target == true)
        {
            if (_new_target == noone)
            {
                _target = target
                _temp_relation = _target_rel
            }
            else if (target != _target)
            {
                if (_n_rel > _target_rel)
                {
                    _target = target
                    _temp_relation = _target_rel
                }
                else
                {
                    _temp_relation = _n_rel
                    _target = _new_target
                }
            }
        }
        if is_in_hub()
            _target = noone
        if (_target != noone)
        {
            _state = true
            if instance_exists(_target)
            {
                target_relation = scr_get_relation(faction, _target.faction)
                if instance_line_of_sight(x, y, _target)
                {
                    last_seen_x = _target.x
                    last_seen_y = _target.y
                }
            }
        }
        target = _target
    }
    return _state;
}

function fun_target_in_sight(argument0) //gml_Script_fun_target_in_sight
{
    if (argument0 == undefined)
        argument0 = noone
    _state = false
    if instance_exists(argument0)
    {
        if instance_line_of_sight(x, y, argument0)
            _state = true
    }
    return _state;
}

function fun_need_reload() //gml_Script_fun_need_reload
{
    _state = false
    if (need_reload_already_check == false)
    {
        if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.3))
        {
            var chance = 100 - ammo_now * 100 / item_weapon_get_magazine(arma_now)
            if scr_chance(chance)
            {
                _state = true
                need_reload_already_check = true
            }
        }
    }
    else
        _state = true
    return _state;
}

function fun_target_last_seen_is_near(argument0) //gml_Script_fun_target_last_seen_is_near
{
    if (argument0 == undefined)
        argument0 = obj_santa_claus
    _state = false
    if (point_distance(x, y, last_seen_x, last_seen_y) < argument0)
        _state = true
    return _state;
}

function fun_weapon_dir_towards_target(argument0) //gml_Script_fun_weapon_dir_towards_target
{
    if (argument0 == undefined)
        argument0 = noone
    _state = false
    if instance_exists(argument0)
    {
        var _tx = argument0.x
        var _ty = argument0.y
        var _dir = point_direction(x, y, _tx, _ty)
        var _angle_diff = angle_difference(weapon_pointing_direction, _dir)
        if (abs(_angle_diff) <= angle_min_to_rotate)
            _state = true
    }
    return _state;
}

function fun_pos_cover_found() //gml_Script_fun_pos_cover_found
{
    _state = false
    if instance_exists(target)
    {
        var list_x = ds_list_create()
        var list_y = ds_list_create()
        var list_length = ds_list_create()
        _array[0] = 0
        _array[1] = 0
        var pos_found = 0
        var pos_found_max = 7
        var _g_w = 16
        var _g_x = x div _g_w
        var _g_y = y div _g_w
        var _grid_max = 12
        var _grid_check = ds_grid_create((_grid_max * 2), (_grid_max * 2))
        ds_grid_clear(_grid_check, false)
        for (var _grid_now = 1; _grid_now < _grid_max; _grid_now++)
        {
            for (var xx = 0; xx <= (_grid_now * 2); xx++)
            {
                for (var yy = 0; yy <= (_grid_now * 2); yy++)
                {
                    if (pos_found < pos_found_max)
                    {
                        if (ds_grid_get(_grid_check, xx, yy) == false)
                        {
                            ds_grid_set(_grid_check, xx, yy, true)
                            var _sx = _g_x - _grid_now + xx
                            var _sy = _g_y - _grid_now + yy
                            if (ds_grid_get(obj_controller.grid_motion, _sx, _sy) == 0)
                            {
                                var _new_x = _sx * 16 + 8
                                var _new_y = _sy * 16 + 8
                                if (!(instance_line_of_sight(_new_x, _new_y, target)))
                                {
                                    pos_found++
                                    var _length = point_distance(x, y, _new_x, _new_y)
                                    ds_list_add(list_x, _new_x)
                                    ds_list_add(list_y, _new_y)
                                    ds_list_add(list_length, _length)
                                    instance_create_depth(_new_x, _new_y, -9999, object215)
                                }
                            }
                        }
                    }
                }
            }
        }
        if (pos_found > 0)
        {
            var _dis = 9999
            var _index = 0
            var list_size = ds_list_size(list_x)
            _index = irandom(list_size - 1)
            last_cover_pos_x = ds_list_find_value(list_x, _index)
            last_cover_pos_y = ds_list_find_value(list_y, _index)
            _state = true
        }
        ds_list_destroy(list_x)
        ds_list_destroy(list_y)
        ds_list_destroy(list_length)
        ds_grid_destroy(_grid_check)
    }
    return _state;
}

function fun_pos_near(argument0, argument1, argument2) //gml_Script_fun_pos_near
{
    _state = false
    if (point_distance(x, y, argument0, argument1) < argument2)
        _state = true
    return _state;
}

