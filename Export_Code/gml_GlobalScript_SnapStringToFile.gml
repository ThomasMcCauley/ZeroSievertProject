function SnapStringToFile(argument0, argument1, argument2) //gml_Script_SnapStringToFile
{
    if (argument2 == undefined)
        argument2 = false
    var _buffer = buffer_create((string_byte_length(argument0) + (argument2 ? 3 : 0)), buffer_fixed, 1)
    if argument2
    {
        buffer_write(_buffer, buffer_u32, 12565487)
        buffer_seek(_buffer, buffer_seek_relative, -1)
    }
    buffer_write(_buffer, buffer_text, argument0)
    var _result = buffer_save(_buffer, argument1)
    buffer_delete(_buffer)
    return _result;
}

