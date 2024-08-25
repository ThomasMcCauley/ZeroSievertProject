function SnapBufferWriteBOM(argument0) //gml_Script_SnapBufferWriteBOM
{
    buffer_write(argument0, buffer_u8, 239)
    buffer_write(argument0, buffer_u8, 187)
    buffer_write(argument0, buffer_u8, 191)
}

