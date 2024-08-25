function SnapBufferWriteVDF(argument0, argument1, argument2, argument3) //gml_Script_SnapBufferWriteVDF
{
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = false
    if (!is_struct(argument1))
        show_error("SNAP:\nTop-level data structure must be a struct\n ", true)
    var _names = variable_struct_get_names(argument1)
    if argument2
        array_sort(_names, true)
    var _count = array_length(_names)
    if (_count > 0)
    {
        var _i = 0
        repeat _count
        {
            var _name = _names[_i]
            if (!is_string(_name))
                show_error("SNAP:\nKeys must be strings\n ", true)
            buffer_write(argument0, buffer_u8, 34)
            buffer_write(argument0, buffer_text, string(_name))
            buffer_write(argument0, buffer_u8, 34)
            __SnapToVDFBufferValue(argument0, variable_struct_get(argument1, _name), argument2, argument3, "")
            if (_i < (_count - 1))
                buffer_write(argument0, buffer_u8, 10)
            _i++
        }
    }
    return argument0;
}

function __SnapToVDFBufferValue(argument0, argument1, argument2, argument3, argument4) //gml_Script___SnapToVDFBufferValue
{
    if is_array(argument1)
        show_error("SNAP:\nArrays are not supported by the VDF format\n ", true)
    else if is_method(argument1)
    {
        buffer_write(argument0, buffer_u16, 8736)
        buffer_write(argument0, buffer_text, string(argument1))
        buffer_write(argument0, buffer_u8, 34)
    }
    else if is_struct(argument1)
    {
        var _struct = argument1
        _names = variable_struct_get_names(_struct)
        if argument2
            array_sort(_names, true)
        buffer_write(argument0, buffer_u8, 10)
        buffer_write(argument0, buffer_text, argument4)
        buffer_write(argument0, buffer_u16, 2683)
        _count = array_length(_names)
        if (_count > 0)
        {
            var _preIndent = argument4
            argument4 += "	"
            _i = 0
            repeat _count
            {
                _name = _names[_i]
                if (!is_string(_name))
                    show_error("SNAP:\nKeys must be strings\n ", true)
                buffer_write(argument0, buffer_text, argument4)
                buffer_write(argument0, buffer_u8, 34)
                buffer_write(argument0, buffer_text, string(_name))
                buffer_write(argument0, buffer_u8, 34)
                __SnapToVDFBufferValue(argument0, variable_struct_get(_struct, _name), argument2, argument3, argument4)
                buffer_write(argument0, buffer_u8, 10)
                _i++
            }
            argument4 = _preIndent
        }
        buffer_write(argument0, buffer_text, argument4)
        buffer_write(argument0, buffer_u8, 125)
    }
    else if (is_real(argument1) || is_int32(argument1) || is_int64(argument1))
    {
        buffer_write(argument0, buffer_u16, 8736)
        buffer_write(argument0, buffer_text, SnapNumberToString(argument1, argument3))
        buffer_write(argument0, buffer_u8, 34)
    }
    else
    {
        argument1 = string(argument1)
        argument1 = string_replace_all(argument1, "\\", "\\\\")
        argument1 = string_replace_all(argument1, "\n", "\\n")
        argument1 = string_replace_all(argument1, "\r", "\\r")
        argument1 = string_replace_all(argument1, "	", "\\t")
        argument1 = string_replace_all(argument1, "\"", "\\\"")
        buffer_write(argument0, buffer_u16, 8736)
        buffer_write(argument0, buffer_text, argument1)
        buffer_write(argument0, buffer_u8, 34)
    }
    return argument0;
}

