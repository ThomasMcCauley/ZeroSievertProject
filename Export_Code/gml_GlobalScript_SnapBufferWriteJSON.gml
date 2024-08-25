function SnapBufferWriteJSON(argument0, argument1, argument2, argument3, argument4) //gml_Script_SnapBufferWriteJSON
{
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = false
    if (argument4 == undefined)
        argument4 = false
    return __SnapToJSONBufferValue(argument0, argument1, argument2, argument3, argument4, "");
}

function __SnapToJSONBufferValue(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script___SnapToJSONBufferValue
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
        buffer_write(argument0, buffer_u8, 34)
        buffer_write(argument0, buffer_text, argument1)
        buffer_write(argument0, buffer_u8, 34)
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
                __SnapToJSONBufferValue(argument0, _array[_i], argument2, argument3, argument4, argument5)
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
                __SnapToJSONBufferValue(argument0, _array[_i], argument2, argument3, argument4, argument5)
                buffer_write(argument0, buffer_u8, 44)
                _i++
            }
            if (_count > 0)
                buffer_seek(argument0, buffer_seek_relative, -1)
            buffer_write(argument0, buffer_u8, 93)
        }
    }
    else if is_method(argument1)
    {
        buffer_write(argument0, buffer_u8, 34)
        buffer_write(argument0, buffer_text, string(argument1))
        buffer_write(argument0, buffer_u8, 34)
    }
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
                buffer_write(argument0, buffer_u8, 34)
                buffer_write(argument0, buffer_text, string(_name))
                buffer_write(argument0, buffer_u32, 540680226)
                __SnapToJSONBufferValue(argument0, variable_struct_get(_struct, _name), argument2, argument3, argument4, argument5)
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
                buffer_write(argument0, buffer_u8, 34)
                buffer_write(argument0, buffer_text, string(_name))
                buffer_write(argument0, buffer_u16, 14882)
                __SnapToJSONBufferValue(argument0, variable_struct_get(_struct, _name), argument2, argument3, argument4, argument5)
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

