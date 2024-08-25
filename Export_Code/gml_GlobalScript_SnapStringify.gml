function SnapStringify(argument0) //gml_Script_SnapStringify
{
    var _foundMap = ds_map_create()
    var _stringifyBuffer = buffer_create(1024, buffer_grow, 1)
    buffer_seek(_stringifyBuffer, buffer_seek_start, 0)
    __SnapStringifyValue(argument0, "<origin>", _foundMap, _stringifyBuffer)
    buffer_write(_stringifyBuffer, buffer_u8, 0)
    buffer_seek(_stringifyBuffer, buffer_seek_start, 0)
    var _string = buffer_read(_stringifyBuffer, buffer_string)
    ds_map_destroy(_foundMap)
    buffer_delete(_stringifyBuffer)
    return _string;
}

function __SnapStringifyValue(argument0, argument1, argument2, argument3) //gml_Script___SnapStringifyValue
{
    if is_struct(argument0)
    {
        var _circularRef = ds_map_find_value(argument2, argument0)
        if (_circularRef != undefined)
            buffer_write(argument3, buffer_text, _circularRef)
        else
        {
            ds_map_set(argument2, argument0, argument1)
            buffer_write(argument3, buffer_u16, 8315)
            var _names = variable_struct_get_names(argument0)
            var _length = array_length(_names)
            var _i = 0
            repeat _length
            {
                var _name = _names[_i]
                buffer_write(argument3, buffer_text, _name)
                buffer_write(argument3, buffer_u8, 32)
                buffer_write(argument3, buffer_u8, 58)
                buffer_write(argument3, buffer_u8, 32)
                __SnapStringifyValue(variable_struct_get(argument0, _name), (argument1 + "." + _name), argument2, argument3)
                if (_i < (_length - 1))
                    buffer_write(argument3, buffer_u16, 8236)
                _i++
            }
            buffer_write(argument3, buffer_u16, 32032)
        }
    }
    else if is_array(argument0)
    {
        var _circular_ref = ds_map_find_value(argument2, argument0)
        if (_circular_ref != undefined)
            buffer_write(argument3, buffer_text, _circular_ref)
        else
        {
            ds_map_set(argument2, argument0, argument1)
            buffer_write(argument3, buffer_u16, 8283)
            _length = array_length(argument0)
            _i = 0
            repeat _length
            {
                __SnapStringifyValue(argument0[_i], (argument1 + "[" + string(_i) + "]"), argument2, argument3)
                if (_i < (_length - 1))
                    buffer_write(argument3, buffer_u8, 44)
                _i++
            }
            buffer_write(argument3, buffer_u16, 23840)
        }
    }
    else if is_string(argument0)
    {
        buffer_write(argument3, buffer_u8, 34)
        buffer_write(argument3, buffer_text, argument0)
        buffer_write(argument3, buffer_u8, 34)
    }
    else
        buffer_write(argument3, buffer_text, string(argument0))
}

