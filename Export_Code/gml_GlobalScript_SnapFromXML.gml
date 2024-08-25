function SnapFromXML(argument0) //gml_Script_SnapFromXML
{
    var _buffer = buffer_create(string_byte_length(argument0), buffer_fixed, 1)
    buffer_write(_buffer, buffer_text, argument0)
    var _data = SnapBufferReadXML(_buffer, 0, buffer_get_size(_buffer))
    buffer_delete(_buffer)
    return _data;
}

