function SnapToGML(argument0, argument1) //gml_Script_SnapToGML
{
    if (argument1 == undefined)
        argument1 = false
    var _buffer = buffer_create(1024, buffer_grow, 1)
    SnapBufferWriteGML(_buffer, argument0, argument1)
    buffer_seek(_buffer, buffer_seek_start, 0)
    var _string = buffer_read(_buffer, buffer_string)
    buffer_delete(_buffer)
    return _string;
}

