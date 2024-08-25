function npc_ai_effective_range(argument0, argument1, argument2, argument3, argument4) //gml_Script_npc_ai_effective_range
{
    var _struct = 
    {
        ok_min: -1,
        ok_max: -1,
        bad_min: -1,
        bad_max: -1,
        range_type: (2 << 0)
    }

    var _get_type_eff_range = item_weapon_get_type_effective_range(argument0)
    var _array_points = glance_get_eff_range(_get_type_eff_range)
    for (var i = 0; i < array_length(_array_points); i++)
    {
        var _array_position = _array_points[i]
        if (i < (array_length(_array_points) - 1))
        {
            var _array_next_pos = _array_points[(i + 1)]
            var _value = argument2
            if (_struct.bad_max == -1)
                _value = argument3
            if (_struct.ok_max == -1 || _struct.ok_min == -1)
                _value = 1
            if (_struct.bad_min == -1)
                _value = argument2
            if (_array_position[1] >= 1 && _array_next_pos[1] != 1 && _struct.ok_min != -1)
                _struct.ok_max = _array_position[0]
            if (_array_position[1] >= 1 && _struct.ok_min == -1)
                _struct.ok_min = _array_position[0]
        }
    }
    _struct.ok_min -= argument4
    _struct.ok_min = clamp(_struct.ok_min, 0, 1000)
    _struct.bad_min = _struct.ok_min - argument2
    _struct.bad_max = _struct.ok_max + argument3
    _struct.bad_min = clamp(_struct.bad_min, 0, 500)
    if (argument1 >= _struct.bad_min && argument1 <= _struct.bad_max)
        _struct.range_type = (1 << 0)
    if (argument1 >= _struct.ok_min && argument1 <= _struct.ok_max)
        _struct.range_type = (0 << 0)
    return _struct;
}

