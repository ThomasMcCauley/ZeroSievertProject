function SnapToQML(argument0, argument1, argument2, argument3) //gml_Script_SnapToQML
{
    if (argument2 == undefined)
        argument2 = false
    if (argument3 == undefined)
        argument3 = false
    var _buffer = buffer_create(1024, buffer_grow, 1)
    SnapBufferWriteQML(_buffer, argument0, argument1, argument2, argument3)
    buffer_seek(_buffer, buffer_seek_start, 0)
    var _string = buffer_read(_buffer, buffer_string)
    buffer_delete(_buffer)
    return _string;
}

