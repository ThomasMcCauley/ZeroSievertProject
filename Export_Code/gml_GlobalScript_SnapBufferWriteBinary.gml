function SnapBufferWriteBinary(argument0, argument1, argument2) //gml_Script_SnapBufferWriteBinary
{
    if (argument2 == undefined)
        argument2 = false
    if is_method(argument1)
    {
        buffer_write(argument0, buffer_u8, 3)
        buffer_write(argument0, buffer_string, string(argument1))
    }
    else if is_struct(argument1)
    {
        var _struct = argument1
        var _names = variable_struct_get_names(_struct)
        if (argument2 && is_array(_names))
            array_sort(_names, true)
        var _count = array_length(_names)
        buffer_write(argument0, buffer_u8, 1)
        buffer_write(argument0, buffer_u64, _count)
        var _i = 0
        repeat _count
        {
            var _name = _names[_i]
            if (!is_string(_name))
                show_error("SNAP:\nKeys must be strings\n ", true)
            buffer_write(argument0, buffer_string, string(_name))
            SnapBufferWriteBinary(argument0, variable_struct_get(_struct, _name), argument2)
            _i++
        }
    }
    else if is_array(argument1)
    {
        var _array = argument1
        _count = array_length(_array)
        buffer_write(argument0, buffer_u8, 2)
        buffer_write(argument0, buffer_u64, _count)
        _i = 0
        repeat _count
        {
            SnapBufferWriteBinary(argument0, _array[_i], argument2)
            _i++
        }
    }
    else if is_string(argument1)
    {
        buffer_write(argument0, buffer_u8, 3)
        buffer_write(argument0, buffer_string, argument1)
    }
    else if is_real(argument1)
    {
        if (argument1 == 0)
            buffer_write(argument0, buffer_u8, 5)
        else if (argument1 == 1)
            buffer_write(argument0, buffer_u8, 6)
        else
        {
            buffer_write(argument0, buffer_u8, 4)
            buffer_write(argument0, buffer_f64, argument1)
        }
    }
    else if is_bool(argument1)
        buffer_write(argument0, buffer_u8, (argument1 ? 6 : 5))
    else if is_undefined(argument1)
        buffer_write(argument0, buffer_u8, 7)
    else if is_int32(argument1)
    {
        buffer_write(argument0, buffer_u8, 8)
        buffer_write(argument0, buffer_s32, argument1)
    }
    else if is_int64(argument1)
    {
        buffer_write(argument0, buffer_u8, 9)
        buffer_write(argument0, buffer_u64, argument1)
    }
    else if is_ptr(argument1)
    {
        buffer_write(argument0, buffer_u8, 10)
        buffer_write(argument0, buffer_u64, int64(argument1))
    }
    else if (typeof(argument1) == "ref")
    {
        buffer_write(argument0, buffer_u8, 11)
        buffer_write(argument0, buffer_u64, int64(real(argument1)))
    }
    else
        show_message("Datatype \"" + typeof(argument1) + "\" not supported")
    return argument0;
}

