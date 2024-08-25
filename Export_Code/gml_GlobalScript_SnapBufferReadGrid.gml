function SnapBufferReadGrid(argument0, argument1) //gml_Script_SnapBufferReadGrid
{
    if (argument1 != undefined)
    {
        var _oldOffset = buffer_tell(argument0)
        buffer_seek(argument0, buffer_seek_start, argument1)
    }
    var _datatype = buffer_read(argument0, buffer_u8)
    var _width = buffer_read(argument0, buffer_u32)
    var _height = buffer_read(argument0, buffer_u32)
    var _grid = ds_grid_create(_width, _height)
    var _x = 0
    repeat _width
    {
        var _y = 0
        repeat _height
        {
            ds_grid_set(_grid, _x, _y, buffer_read(argument0, _datatype))
            _y++
        }
        _x++
    }
    if (argument1 != undefined)
        buffer_seek(argument0, buffer_seek_start, _oldOffset)
    return _grid;
}

