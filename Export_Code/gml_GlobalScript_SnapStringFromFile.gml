function SnapStringFromFile(argument0, argument1) //gml_Script_SnapStringFromFile
{
    if (argument1 == undefined)
        argument1 = true
    var _buffer = buffer_load(argument0)
    if (argument1 && buffer_get_size(_buffer) >= 4 && ((buffer_peek(_buffer, 0, buffer_u32)) & 16777215) == 12565487)
        buffer_seek(_buffer, buffer_seek_start, 3)
    var _string = buffer_read(_buffer, buffer_text)
    buffer_delete(_buffer)
    return _string;
}

