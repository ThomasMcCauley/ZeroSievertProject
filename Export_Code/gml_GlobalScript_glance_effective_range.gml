function glance_effective_range(argument0, argument1, argument2, argument3) //gml_Script_glance_effective_range
{
    if (argument2 == undefined)
        argument2 = 0
    if (argument3 == undefined)
        argument3 = false
    var _mult_dis_player = 1
    var _array_points = glance_return_range_array(argument0, argument1, argument2)
    if (_array_points == 1)
        return 1;
    var _scope_mult = 1
    if instance_exists(player_get_local())
    {
        if (player_get_local_var("aiming") || obj_gamepad.action[(28 << 0)].value)
        {
            var _player = player_get_local()
            var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope")
            if item_exists(_scope)
                _scope_mult = item_mod_get_scope_mult_eff_range(_scope)
        }
    }
    var _array_points_updated = array_create(array_length(_array_points))
    if argument3
    {
        var _is_bullet = -4
        if (object_get_parent(object_index) == 199)
            _is_bullet = id
        _array_points_updated = glance_effective_range_get_mastery(_array_points, _is_bullet)
    }
    else
        _array_points_updated = _array_points
    for (var i = 0; i < array_length(_array_points_updated); i++)
    {
        var _array_position = _array_points_updated[i]
        if (i < (array_length(_array_points_updated) - 1))
        {
            var _array_next_pos = _array_points_updated[(i + 1)]
            if (argument2 >= (_array_position[0] * _scope_mult) && argument2 < (_array_next_pos[0] * _scope_mult))
            {
                _mult_dis_player = lerp(_array_position[1], _array_next_pos[1], ((argument2 - _array_position[0] * _scope_mult) / (_array_next_pos[0] * _scope_mult - _array_position[0] * _scope_mult)))
                return _mult_dis_player;
            }
        }
        else
        {
            var _last_array_pos = _array_points_updated[(array_length(_array_points_updated) - 1)]
            if (argument2 > (_last_array_pos[0] * _scope_mult))
            {
                _mult_dis_player = _last_array_pos[1]
                return _mult_dis_player;
            }
        }
    }
    return _mult_dis_player;
}

