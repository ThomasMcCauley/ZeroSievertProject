function glance_effective_range_get_mastery(argument0, argument1) //gml_Script_glance_effective_range_get_mastery
{
    if (argument1 == undefined)
        argument1 = -4
    var _array_points_updated = array_create(array_length(argument0))
    var _array_count = array_length(argument0)
    for (var i = 0; i < _array_count; i++)
    {
        for (var j = 0; j < array_length(argument0[i]); j++)
            _array_points_updated[i][j] = argument0[i][j]
    }
    var _stage = 0
    var _last_value_to_add = 0
    with (player_get_local())
    {
        var _min = 1 - 1 * settings_get("decrease_minimum_range") / 100
        var _max = 1 + settings_get("increase_maximum_range") / 100
    }
    for (i = 0; i < _array_count; i++)
    {
        switch _stage
        {
            case 0:
                _array_points_updated[i][0] *= _min
                if (_array_points_updated[i][1] >= 1)
                    _stage++
                break
            case 1:
                var _last_value = _array_points_updated[i][0]
                _array_points_updated[i][0] *= _max
                _last_value_to_add = _array_points_updated[i][0] - _last_value
                _stage++
                break
            case 2:
                _array_points_updated[i][0] += _last_value_to_add
                break
        }

    }
    return _array_points_updated;
}

