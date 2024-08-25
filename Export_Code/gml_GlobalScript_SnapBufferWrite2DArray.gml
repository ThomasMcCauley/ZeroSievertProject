function SnapBufferWrite2DArray(argument0, argument1, argument2) //gml_Script_SnapBufferWrite2DArray
{
    if (argument2 == buffer_text)
        show_error("SNAP:\nCannot use buffer_text for the datatype\n ", true)
    var _width = array_length(argument1)
    var _height = array_length(argument1[0])
    buffer_write(argument0, buffer_u8, argument2)
    buffer_write(argument0, buffer_u32, _width)
    buffer_write(argument0, buffer_u32, _height)
    var _x = 0
    repeat _width
    {
        var _sub_array = argument1[_x]
        var _y = 0
        repeat _height
        {
            buffer_write(argument0, argument2, _sub_array[_y])
            _y++
        }
        _x++
    }
}

