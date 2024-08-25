function SnapShallowAdd(argument0, argument1) //gml_Script_SnapShallowAdd
{
    if is_struct(argument0)
    {
        if (!is_struct(argument1))
            show_error(("SNAP:\nSource is a struct but destination is not a struct (=" + typeof(argument1) + ")"), true)
        var _srcNames = variable_struct_get_names(argument0)
        var _i = 0
        repeat array_length(_srcNames)
        {
            var _name = _srcNames[_i]
            var _srcValue = variable_struct_get(argument0, _name)
            if is_numeric(_srcValue)
            {
                var _dstValue = variable_struct_get(argument1, _name)
                if (!is_numeric(_dstValue))
                    _dstValue = 0
                variable_struct_set(argument1, _name, (_dstValue + _srcValue))
            }
            _i++
        }
    }
    else if is_array(argument0)
    {
        if (!is_array(argument1))
            show_error(("SNAP:\nSource is an array but destination is not an array (=" + typeof(argument1) + ")"), true)
        var _srcLength = array_length(argument0)
        var _dstLength = array_length(argument1)
        if (_srcLength > _dstLength)
            array_resize(argument1, _srcLength)
        _i = 0
        repeat array_length(_srcLength)
        {
            _srcValue = argument0[_i]
            if is_numeric(_srcValue)
            {
                _dstValue = argument1[_i]
                if (!is_numeric(_dstValue))
                    _dstValue = 0
                argument1[_i] = _dstValue + _srcValue
            }
            _i++
        }
    }
    else
        show_error("SNAP:\nSource data structure is not a struct or array", true)
}

