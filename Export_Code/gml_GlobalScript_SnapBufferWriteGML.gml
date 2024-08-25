function SnapBufferWriteGML(argument0, argument1, argument2) //gml_Script_SnapBufferWriteGML
{
    if (argument2 == undefined)
        argument2 = false
    __SnapBufferWriteGMLInner(argument0, argument1, argument2, 0, "")
}

function __SnapBufferWriteGMLInner(argument0, argument1, argument2, argument3, argument4) //gml_Script___SnapBufferWriteGMLInner
{
    if is_method(argument1)
    {
        buffer_write(argument0, buffer_text, "\"")
        buffer_write(argument0, buffer_text, string(argument1))
        buffer_write(argument0, buffer_text, "\"")
    }
    else if is_struct(argument1)
    {
        var _struct = argument1
        var _names = variable_struct_get_names(_struct)
        var _count = array_length(_names)
        var _i = 0
        if argument2
            array_sort(_names, true)
        if (_count > 0)
        {
            if (argument3 != 0)
            {
                buffer_write(argument0, buffer_text, "{\n")
                var _preIndent = argument4
                argument4 += "    "
            }
            _i = 0
            repeat _count
            {
                var _name = _names[_i]
                if (is_struct(_name) || is_array(_name))
                {
                    show_error(("SNAP:\nKey type \"" + typeof(_name) + "\" not supported\n "), false)
                    _name = string(ptr(_name))
                }
                if (argument3 == 0)
                {
                    buffer_write(argument0, buffer_text, argument4)
                    buffer_write(argument0, buffer_text, string(_name))
                    buffer_write(argument0, buffer_text, " = ")
                    __SnapBufferWriteGMLInner(argument0, variable_struct_get(_struct, _name), argument2, (argument3 + 1), argument4)
                    buffer_write(argument0, buffer_text, ";\n")
                }
                else
                {
                    buffer_write(argument0, buffer_text, argument4)
                    buffer_write(argument0, buffer_text, string(_name))
                    buffer_write(argument0, buffer_text, ": ")
                    __SnapBufferWriteGMLInner(argument0, variable_struct_get(_struct, _name), argument2, (argument3 + 1), argument4)
                    buffer_write(argument0, buffer_text, ",\n")
                }
                _i++
            }
            if (argument3 != 0)
            {
                argument4 = _preIndent
                buffer_write(argument0, buffer_text, argument4)
                buffer_write(argument0, buffer_text, "}")
            }
        }
        else
            buffer_write(argument0, buffer_text, "{}")
    }
    else if is_array(argument1)
    {
        var _array = argument1
        _count = array_length(_array)
        if (_count > 0)
        {
            _preIndent = argument4
            argument4 += "    "
            buffer_write(argument0, buffer_text, "[\n")
            _i = 0
            repeat _count
            {
                buffer_write(argument0, buffer_text, argument4)
                __SnapBufferWriteGMLInner(argument0, _array[_i], argument2, (argument3 + 1), argument4)
                buffer_write(argument0, buffer_text, ",\n")
                _i++
            }
            argument4 = _preIndent
            buffer_write(argument0, buffer_text, argument4)
            buffer_write(argument0, buffer_text, "]")
        }
        else
            buffer_write(argument0, buffer_text, "[]")
    }
    else if is_string(argument1)
    {
        argument1 = string_replace_all(argument1, "\\", "\\\\")
        argument1 = string_replace_all(argument1, "\n", "\\n")
        argument1 = string_replace_all(argument1, "\r", "\\r")
        argument1 = string_replace_all(argument1, "	", "\\t")
        argument1 = string_replace_all(argument1, "\"", "\\\"")
        buffer_write(argument0, buffer_text, "\"")
        buffer_write(argument0, buffer_text, argument1)
        buffer_write(argument0, buffer_text, "\"")
    }
    else if is_undefined(argument1)
        buffer_write(argument0, buffer_text, "undefined")
    else if is_bool(argument1)
        buffer_write(argument0, buffer_text, (argument1 ? "true" : "false"))
    else if is_real(argument1)
        buffer_write(argument0, buffer_text, SnapNumberToString(argument1, true))
    else if is_ptr(argument1)
    {
        buffer_write(argument0, buffer_text, "ptr(0x")
        buffer_write(argument0, buffer_text, string(argument1))
        buffer_write(argument0, buffer_text, ")")
    }
    else if (is_int32(argument1) || is_int64(argument1))
    {
        buffer_write(argument0, buffer_text, "0x")
        buffer_write(argument0, buffer_text, string(ptr(argument1)))
    }
    else if is_numeric(argument1)
        buffer_write(argument0, buffer_text, string(real(argument1)))
    else
        buffer_write(argument0, buffer_text, string(argument1))
}

