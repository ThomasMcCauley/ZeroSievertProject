function SnapToYAML(argument0, argument1, argument2) //gml_Script_SnapToYAML
{
    if (argument1 == undefined)
        argument1 = false
    if (argument2 == undefined)
        argument2 = false
    var _buffer = buffer_create(1024, buffer_grow, 1)
    SnapBufferWriteYAML(_buffer, argument0, argument1, argument2)
    buffer_seek(_buffer, buffer_seek_start, 0)
    var _string = buffer_read(_buffer, buffer_string)
    buffer_delete(_buffer)
    return _string;
}

