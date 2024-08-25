function SnapBufferWriteLooseJSON(argument0, argument1, argument2, argument3, argument4) //gml_Script_SnapBufferWriteLooseJSON
{
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = false
    if (argument4 == undefined)
        argument4 = false
    return __SnapToLooseJSONBufferValue(argument0, argument1, argument2, argument3, argument4, "");
}

function __SnapToLooseJSONBufferValue(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script___SnapToLooseJSONBufferValue
{
    if (is_real(argument1) || is_int32(argument1) || is_int64(argument1))
        buffer_write(argument0, buffer_text, SnapNumberToString(argument1, argument4))
    else if is_string(argument1)
    {
        argument1 = string_replace_all(argument1, "\\", "\\\\")
        argument1 = string_replace_all(argument1, "\n", "\\n")
        argument1 = string_replace_all(argument1, "\r", "\\r")
        argument1 = string_replace_all(argument1, "	", "\\t")
        argument1 = string_replace_all(argument1, "\"", "\\\"")
        if (argument1 == "true" || argument1 == "false" || argument1 == "null" || string_pos(":", argument1) > 0 || string_pos(",", argument1) > 0 || string_pos("{", argument1) > 0 || string_pos("}", argument1) > 0 || string_pos("[", argument1) > 0 || string_pos("]", argument1) > 0 || ord(string_char_at(argument1, 1)) <= 32 || ord(string_char_at(argument1, string_length(argument1))) <= 32)
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
        if (_count <= 0)
            buffer_write(argument0, buffer_u16, 23899)
        else if argument2
        {
            buffer_write(argument0, buffer_u16, 2651)
            var _preIndent = argument5
            argument5 += "	"
            var _i = 0
            repeat _count
            {
                buffer_write(argument0, buffer_text, argument5)
                __SnapToLooseJSONBufferValue(argument0, _array[_i], argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u16, 2604)
                _i++
            }
            argument5 = _preIndent
            buffer_seek(argument0, buffer_seek_relative, -2)
            buffer_write(argument0, buffer_u8, 10)
            buffer_write(argument0, buffer_text, argument5)
            buffer_write(argument0, buffer_u8, 93)
        }
        else
        {
            buffer_write(argument0, buffer_u8, 91)
            _i = 0
            repeat _count
            {
                __SnapToLooseJSONBufferValue(argument0, _array[_i], argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u8, 44)
                _i++
            }
            if (_count > 0)
                buffer_seek(argument0, buffer_seek_relative, -1)
            buffer_write(argument0, buffer_u8, 93)
        }
    }
    else if is_method(argument1)
        buffer_write(argument0, buffer_text, string(argument1))
    else if is_struct(argument1)
    {
        var _struct = argument1
        var _names = variable_struct_get_names(_struct)
        if argument3
            array_sort(_names, true)
        _count = array_length(_names)
        if (_count <= 0)
            buffer_write(argument0, buffer_u16, 32123)
        else if argument2
        {
            buffer_write(argument0, buffer_u16, 2683)
            _preIndent = argument5
            argument5 += "	"
            _i = 0
            repeat _count
            {
                var _name = _names[_i]
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true)
                buffer_write(argument0, buffer_text, argument5)
                __SnapToLooseJSONBufferValue(argument0, _name, argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u16, 8250)
                __SnapToLooseJSONBufferValue(argument0, variable_struct_get(_struct, _name), argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u16, 2604)
                _i++
            }
            argument5 = _preIndent
            buffer_seek(argument0, buffer_seek_relative, -2)
            buffer_write(argument0, buffer_u8, 10)
            buffer_write(argument0, buffer_text, argument5)
            buffer_write(argument0, buffer_u8, 125)
        }
        else
        {
            buffer_write(argument0, buffer_u8, 123)
            _i = 0
            repeat _count
            {
                _name = _names[_i]
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true)
                __SnapToLooseJSONBufferValue(argument0, _name, argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u8, 58)
                __SnapToLooseJSONBufferValue(argument0, variable_struct_get(_struct, _name), argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u8, 44)
                _i++
            }
            buffer_seek(argument0, buffer_seek_relative, -1)
            buffer_write(argument0, buffer_u8, 125)
        }
    }
    else if is_undefined(argument1)
        buffer_write(argument0, buffer_text, "null")
    else if is_bool(argument1)
        buffer_write(argument0, buffer_text, (argument1 ? "true" : "false"))
    else if is_ptr(argument1)
        buffer_write(argument0, buffer_text, string(argument1))
    else if is_numeric(argument1)
        buffer_write(argument0, buffer_text, string(real(argument1)))
    else
        buffer_write(argument0, buffer_text, string(argument1))
    return argument0;
}

