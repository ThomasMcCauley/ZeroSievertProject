function array_max_value(argument0) //gml_Script_array_max_value
{
    var _running_best = (-infinity)
    var _running_best_id = undefined
    var _array_length = array_length(argument0)
    for (var i = 0; i < _array_length; i++)
    {
        if (argument0[i] > _running_best)
        {
            _running_best = argument0[i]
            _running_best_id = i
        }
    }
    return _running_best;
}

