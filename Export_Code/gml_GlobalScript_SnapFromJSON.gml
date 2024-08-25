function SnapFromJSON(argument0) //gml_Script_SnapFromJSON
{
    var _buffer = buffer_create(string_byte_length(argument0), buffer_fixed, 1)
    buffer_write(_buffer, buffer_text, argument0)
    var _data = SnapBufferReadJSON(_buffer, 0)
    buffer_delete(_buffer)
    return _data;
}

