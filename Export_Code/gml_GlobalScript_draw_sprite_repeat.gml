function draw_sprite_repeat(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_draw_sprite_repeat
{
    var _width = argument6 * sprite_get_width(argument0)
    var _height = argument6 * sprite_get_height(argument0)
    var _y = argument3
    repeat ceil((argument5 - argument3) / _height)
    {
        var _x = argument2
        repeat ceil((argument4 - argument2) / _width)
        {
            draw_sprite_ext(argument0, argument1, _x, _y, argument6, argument7, 0, argument8, argument9)
            _x += _width
        }
        _y += _height
    }
}

