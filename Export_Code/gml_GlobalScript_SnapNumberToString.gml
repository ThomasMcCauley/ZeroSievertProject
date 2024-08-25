function SnapNumberToString(argument0, argument1) //gml_Script_SnapNumberToString
{
    if (argument1 && is_real(argument0) && floor(argument0) != argument0)
    {
        argument0 = string_format(argument0, 0, 10)
        var _length = string_length(argument0)
        var _i = _length
        repeat _length
        {
            if (string_char_at(argument0, _i) != "0")
                break
            else
                _i--
        }
        if (string_char_at(argument0, _i) == ".")
            _i--
        argument0 = string_delete(argument0, (_i + 1), (_length - _i))
        return argument0;
    }
    else
        return string(argument0);
}

