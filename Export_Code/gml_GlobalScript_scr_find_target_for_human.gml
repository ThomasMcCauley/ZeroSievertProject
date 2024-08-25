function scr_find_target_for_human() //gml_Script_scr_find_target_for_human
{
    if instance_exists(obj_light_controller)
    {
        var alert_distance = npc_get_alert_visual_distance(npc_id)
        var alert_angle = npc_get_alert_radius(npc_id)
        var lc = obj_light_controller
        var t_hm = time_get_hours_fraction()
        var k = 1
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
        alert_distance = scr_npc_oval_view(alert_distance, weapon_pointing_direction)
        var x2 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        var y2 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction + alert_angle / 2)))
        var x3 = x + (lengthdir_x(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        var y3 = y + (lengthdir_y(alert_distance, (weapon_pointing_direction - alert_angle / 2)))
        var n = noone
        var d = alert_distance
        var r = 1000
        var my_id = id
        var patrol = true
        if (state != "human_patrol" && state != "human_aim_neutral_target" && human_state_now != (0 << 0))
            patrol = false
        var temp_relation = (1 << 0)
        with (obj_npc_parent)
        {
            if (id != my_id)
            {
                var relation = faction_get_rep_temp(faction, other.faction)
                if (relation <= r)
                {
                    if (point_distance(x, y, other.x, other.y) < alert_distance)
                    {
                        if instance_line_of_sight(x, y, other)
                        {
                            var temp_id = id
                            if point_in_triangle(temp_id.x, temp_id.y, other.x, other.y, x2, y2, x3, y3)
                            {
                                n = id
                                r = relation
                            }
                            if (point_distance(x, y, temp_id.x, temp_id.y) <= npc_get_alert_min_distance(npc_id))
                            {
                                n = id
                                r = relation
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
                relation = faction_get_rep_temp(faction, "Player")
                if (relation <= r)
                {
                    if instance_line_of_sight(x, y, _nearest_player)
                    {
                        var _distance_to_player = player_distance(x, y, _player_index)
                        if (point_in_triangle(_nearest_player.x, _nearest_player.y, x, y, x2, y2, x3, y3) || _distance_to_player <= npc_get_alert_min_distance(npc_id))
                        {
                            alert_player += (human_tick_max * alert_distance / (max(1, _distance_to_player)))
                            if (alert_player >= alert_player_max)
                            {
                                n = _nearest_player
                                r = relation
                            }
                        }
                    }
                }
            }
        }
        var _ho_gia_target = false
        var _target_rel = (1 << 0)
        var _n_rel = r
        var _new_target = n
        if instance_exists(target)
        {
            _ho_gia_target = true
            _target_rel = faction_get_rep_temp(faction, target.faction)
        }
        if (_new_target != noone)
            _n_rel = faction_get_rep_temp(faction, _new_target.faction)
        if (_ho_gia_target == true)
        {
            if (_new_target == noone)
            {
                n = target
                temp_relation = _target_rel
            }
            else if (target != n)
            {
                if (_n_rel > _target_rel)
                {
                    n = target
                    temp_relation = _target_rel
                }
                else
                {
                    temp_relation = _n_rel
                    n = _new_target
                }
            }
        }
        if (_ho_gia_target == false)
        {
            if (_new_target != noone)
            {
                temp_relation = _n_rel
                n = _new_target
            }
        }
        if is_in_hub()
            n = noone
        if (n != noone)
            target_relation = scr_get_relation(faction, n.faction)
    }
    else
        n = noone
    return n;
}

