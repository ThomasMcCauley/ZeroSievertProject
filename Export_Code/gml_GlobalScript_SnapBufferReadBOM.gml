function SnapBufferReadBOM(argument0) //gml_Script_SnapBufferReadBOM
{
    var _tell = buffer_tell(argument0)
    if (buffer_get_size(argument0) >= 3 && buffer_peek(argument0, _tell, buffer_u8) == 239 && buffer_peek(argument0, (_tell + 1), buffer_u8) == 187 && buffer_peek(argument0, (_tell + 2), buffer_u8) == 191)
    {
        buffer_seek(argument0, buffer_seek_relative, 3)
        return true;
    }
    return false;
}

