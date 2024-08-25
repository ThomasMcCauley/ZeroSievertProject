function SnapBufferWriteNSV(argument0, argument1, argument2, argument3) //gml_Script_SnapBufferWriteNSV
{
    if (argument2 == undefined)
        argument2 = undefined
    if (argument3 == undefined)
        argument3 = false
    var _height = array_length(argument1)
    if (argument2 == undefined)
    {
        argument2 = 0
        var _y = 0
        repeat _height
        {
            argument2 = max(argument2, array_length(argument1[_y]))
            _y++
        }
    }
    buffer_write(argument0, buffer_u64, argument2)
    buffer_write(argument0, buffer_u64, _height)
    _y = 0
    repeat _height
    {
        var _row_array = argument1[_y]
        var _x = 0
        repeat array_length(_row_array)
        {
            var _value = _row_array[_x]
            if is_real(_value)
                buffer_write(argument0, buffer_string, SnapNumberToString(_value, argument3))
            else if is_string(_value)
                buffer_write(argument0, buffer_string, _value)
            else if is_method(_value)
                buffer_write(argument0, buffer_string, string(_value))
            else if (is_struct(_value) || is_array(_value))
                show_error("SNAP:\nArray contains a nested struct or array. This is incompatible with NSV\n ", true)
            else if (is_numeric(_value) && typeof(_value) == "ref")
                buffer_write(argument0, buffer_string, string(real(_value)))
            else
                buffer_write(argument0, buffer_string, string(_value))
            _x++
        }
        repeat (argument2 - _x)
            buffer_write(argument0, buffer_u8, 0)
        _y++
    }
    return argument0;
}

