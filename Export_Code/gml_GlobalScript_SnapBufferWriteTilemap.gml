function SnapBufferWriteTilemap(argument0, argument1) //gml_Script_SnapBufferWriteTilemap
{
    var _width = tilemap_get_width(argument1)
    var _height = tilemap_get_height(argument1)
    buffer_write(argument0, buffer_f64, tilemap_get_x(argument1))
    buffer_write(argument0, buffer_f64, tilemap_get_y(argument1))
    buffer_write(argument0, buffer_u32, _width)
    buffer_write(argument0, buffer_u32, _height)
    buffer_write(argument0, buffer_string, tileset_get_name(tilemap_get_tileset(argument1)))
    var _x = 0
    repeat _width
    {
        var _y = 0
        repeat _height
        {
            buffer_write(argument0, buffer_u32, tilemap_get(argument1, _x, _y))
            _y++
        }
        _x++
    }
}

