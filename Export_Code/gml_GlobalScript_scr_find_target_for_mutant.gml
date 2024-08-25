function scr_find_target_for_mutant(argument0) //gml_Script_scr_find_target_for_mutant
{
    var alert_distance = argument0
    if instance_exists(obj_light_controller)
    {
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
            alert_distance = lerp((npc_get_alert_visual_distance(npc_id) / k), npc_get_alert_visual_distance(npc_id), amount)
        }
        if (lc.ciclo_now == (2 << 0))
        {
            hours_sunrise = (lc.ciclo_time[(3 << 0)]) - (lc.ciclo_time[(2 << 0)])
            amount = (t_hm - (lc.ciclo_time[(2 << 0)])) / hours_sunrise
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id), (npc_get_alert_visual_distance(npc_id) / k), amount)
        }
    }
    var n = noone
    var d = alert_distance
    with (obj_npc_parent)
    {
        if (faction != other.faction && faction != "All Friend")
        {
            if (distance_to_object(other) <= d)
            {
                if instance_line_of_sight(x, y, other)
                {
                    n = id
                    search_target_id = id
                    d = point_distance(n.x, n.y, x, y)
                }
            }
        }
    }
    alert_distance = npc_get_alert_visual_distance(npc_id) * (global.sk_k[(10 << 0)])
    var _nearest_player = player_nearest_instance(x, y)
    if instance_exists(_nearest_player)
    {
        var _player_index = _nearest_player.mp_index
        if (!(player_state_is(_player_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
        {
            var _distance_to_player = player_distance(x, y, _player_index)
            if (_distance_to_player <= d)
            {
                if instance_line_of_sight(x, y, _nearest_player)
                {
                    alert_player += (alert_distance / (max(1, _distance_to_player)))
                    if (alert_player >= alert_player_max)
                    {
                        n = _nearest_player
                        search_target_id = _nearest_player
                    }
                }
            }
        }
    }
    if instance_exists(target)
    {
        if (target != noone && n == -4)
        {
            if (point_distance(x, y, target.x, target.y) < 280)
                n = target
        }
    }
    if (!instance_exists(n))
        n = -4
    return n;
}

