function SnapBufferWriteYAML(argument0, argument1, argument2, argument3) //gml_Script_SnapBufferWriteYAML
{
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = false
    return __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, 0);
}

function __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, argument4) //gml_Script___SnapToYAMLBufferValue
{
    if (is_real(argument1) || is_int32(argument1) || is_int64(argument1))
        buffer_write(argument0, buffer_text, SnapNumberToString(argument1, argument3))
    else if is_string(argument1)
    {
        var _length = string_length(argument1)
        var _hasColon = string_pos(":", argument1) > 0
        argument1 = string_replace_all(argument1, "\\", "\\\\")
        argument1 = string_replace_all(argument1, "\"", "\\\"")
        argument1 = string_replace_all(argument1, "\n", "\\n")
        argument1 = string_replace_all(argument1, "\r", "\\r")
        argument1 = string_replace_all(argument1, "	", "\\t")
        if (_length != string_length(argument1) || _hasColon)
        {
            buffer_write(argument0, buffer_u8, 34)
            buffer_write(argument0, buffer_text, argument1)
            buffer_write(argument0, buffer_u8, 34)
        }
        else
            buffer_write(argument0, buffer_text, argument1)
    }
    else if is_array(argument1)
    {
        var _array = argument1
        var _count = array_length(_array)
        if (_count > 0)
        {
            var _i = 0
            repeat _count
            {
                argument1 = _array[_i]
                if (_i > 0)
                {
                    repeat argument4
                        buffer_write(argument0, buffer_u16, 8224)
                }
                buffer_write(argument0, buffer_u16, 8237)
                argument4++
                __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, argument4)
                argument4--
                buffer_write(argument0, buffer_u8, 10)
                _i++
            }
            buffer_seek(argument0, buffer_seek_relative, -1)
        }
        else
            buffer_write(argument0, buffer_u16, 23899)
    }
    else if is_method(argument1)
        buffer_write(argument0, buffer_text, string(argument1))
    else if is_struct(argument1)
    {
        var _struct = argument1
        var _namesArray = variable_struct_get_names(_struct)
        if argument2
            array_sort(_namesArray, true)
        _count = array_length(_namesArray)
        if (_count > 0)
        {
            _i = 0
            repeat _count
            {
                var _name = _namesArray[_i]
                argument1 = variable_struct_get(_struct, _name)
                if (is_struct(_name) || is_array(_name))
                {
                    show_error(("SNAP:\nKey type \"" + typeof(_name) + "\" not supported\n "), false)
                    _name = string(ptr(_name))
                }
                if (_i > 0)
                {
                    repeat argument4
                        buffer_write(argument0, buffer_u16, 8224)
                }
                buffer_write(argument0, buffer_text, string(_name))
                buffer_write(argument0, buffer_u16, 8250)
                if is_struct(argument1)
                {
                    if (variable_struct_names_count(argument1) > 0)
                    {
                        buffer_write(argument0, buffer_u8, 10)
                        repeat (argument4 + 1)
                            buffer_write(argument0, buffer_u16, 8224)
                    }
                    argument4++
                    __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, argument4)
                    argument4--
                }
                else if is_array(argument1)
                {
                    if (array_length(argument1) > 0)
                    {
                        buffer_write(argument0, buffer_u8, 10)
                        repeat argument4
                            buffer_write(argument0, buffer_u16, 8224)
                    }
                    __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, argument4)
                }
                else
                {
                    argument4++
                    __SnapToYAMLBufferValue(argument0, argument1, argument2, argument3, argument4)
                    argument4--
                }
                buffer_write(argument0, buffer_u8, 10)
                _i++
            }
            buffer_seek(argument0, buffer_seek_relative, -1)
        }
        else
            buffer_write(argument0, buffer_u16, 32123)
    }
    else if is_undefined(argument1)
    {
    }
    else if is_bool(argument1)
        buffer_write(argument0, buffer_text, (argument1 ? "true" : "false"))
    else if is_ptr(argument1)
    {
        buffer_write(argument0, buffer_u8, 34)
        buffer_write(argument0, buffer_text, string(argument1))
        buffer_write(argument0, buffer_u8, 34)
    }
    else if is_numeric(argument1)
        buffer_write(argument0, buffer_text, string(real(argument1)))
    else
        buffer_write(argument0, buffer_text, string(argument1))
    return argument0;
}

