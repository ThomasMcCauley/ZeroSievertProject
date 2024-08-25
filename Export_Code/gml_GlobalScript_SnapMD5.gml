function SnapMD5(argument0) //gml_Script_SnapMD5
{
    var _buffer = buffer_create(1024, buffer_grow, 1)
    SnapBufferWriteBinary(_buffer, argument0, true)
    var _hash = buffer_md5(_buffer, 0, buffer_tell(_buffer))
    buffer_delete(_buffer)
    return _hash;
}

