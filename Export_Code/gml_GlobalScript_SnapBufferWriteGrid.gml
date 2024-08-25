function SnapBufferWriteGrid(argument0, argument1, argument2) //gml_Script_SnapBufferWriteGrid
{
    if (argument2 == buffer_text)
        show_error("SNAP:\nCannot use buffer_text for the datatype\n ", true)
    var _width = ds_grid_width(argument1)
    var _height = ds_grid_height(argument1)
    buffer_write(argument0, buffer_u8, argument2)
    buffer_write(argument0, buffer_u32, _width)
    buffer_write(argument0, buffer_u32, _height)
    var _x = 0
    repeat _width
    {
        var _y = 0
        repeat _height
        {
            buffer_write(argument0, argument2, ds_grid_get(argument1, _x, _y))
            _y++
        }
        _x++
    }
}

