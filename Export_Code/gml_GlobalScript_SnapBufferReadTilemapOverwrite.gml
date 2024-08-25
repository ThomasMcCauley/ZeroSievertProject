function SnapBufferReadTilemapOverwrite(argument0, argument1, argument2, argument3) //gml_Script_SnapBufferReadTilemapOverwrite
{
    if (argument3 == undefined)
        argument3 = false
    if (argument1 != undefined)
    {
        var _oldOffset = buffer_tell(argument0)
        buffer_seek(argument0, buffer_seek_start, argument1)
    }
    var _x = buffer_read(argument0, buffer_f64)
    var _y = buffer_read(argument0, buffer_f64)
    var _width = buffer_read(argument0, buffer_u32)
    var _height = buffer_read(argument0, buffer_u32)
    var _tilesetName = buffer_read(argument0, buffer_string)
    if (tilemap_get_width(argument2) != _width || tilemap_get_height(argument2) != _height)
        trace("SNAP: Warning! Tilemap size mismatch (read as " + string(_width) + " x " + string(_height) + ", currently " + string(tilemap_get_width(argument2)) + " x " + string(tilemap_get_height(argument2)) + ")")
    if (tilemap_get_width(argument2) > _width || tilemap_get_height(argument2) > _height)
        tilemap_clear(argument2, 0)
    if argument3
    {
        tilemap_x(argument2, _x)
        tilemap_y(argument2, _y)
    }
    _x = 0
    repeat _width
    {
        _y = 0
        repeat _height
        {
            tilemap_set(argument2, buffer_read(argument0, buffer_u32), _x, _y)
            _y++
        }
        _x++
    }
    if (argument1 != undefined)
        buffer_seek(argument0, buffer_seek_start, _oldOffset)
}

