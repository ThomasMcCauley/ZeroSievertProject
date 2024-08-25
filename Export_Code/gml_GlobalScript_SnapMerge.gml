function SnapMerge(argument0, argument1, argument2) //gml_Script_SnapMerge
{
    if (argument2 == undefined)
        argument2 = false
    if is_struct(argument1)
    {
        if (!is_struct(argument0))
            show_error(("SNAP:\nRoot destination data structure is a struct but source is not (typeof=" + typeof(argument0) + ")"), true)
    }
    else if is_array(argument1)
    {
        if (!is_array(argument0))
            show_error(("SNAP:\nRoot destination data structure is an array but source is not (typeof=" + typeof(argument0) + ")"), true)
    }
    else
        show_error("SNAP:\nRoot destination data structure is not a struct or an array", true)
    __SnapMerge(argument0, argument1, argument2)
}

function __SnapMerge(argument0, argument1, argument2) //gml_Script___SnapMerge
{
    if is_struct(argument0)
    {
        if (!is_struct(argument1))
            return (argument2 ? argument0 : argument1);
        else
        {
            var _srcNames = variable_struct_get_names(argument0)
            var _i = 0
            repeat array_length(_srcNames)
            {
                var _name = _srcNames[_i]
                var _srcValue = variable_struct_get(argument0, _name)
                if variable_struct_exists(argument1, _name)
                    variable_struct_set(argument1, _name, __SnapMerge(_srcValue, variable_struct_get(argument1, _name), argument2))
                else
                    variable_struct_set(argument1, _name, _srcValue)
                _i++
            }
            return argument1;
        }
    }
    else if is_array(argument0)
    {
        if (!is_array(argument1))
            return (argument2 ? argument0 : argument1);
        else
        {
            var _srcLength = array_length(argument0)
            var _dstLength = array_length(argument1)
            if (_dstLength < _srcLength)
                array_resize(argument1, _srcLength)
            _i = 0
            repeat _srcLength
            {
                argument1[_i] = __SnapMerge(argument0[_i], argument1[_i], argument2)
                _i++
            }
            return argument1;
        }
    }
    else
        return argument0;
}

