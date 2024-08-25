function loot_draw_on_grid(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_loot_draw_on_grid
{
    if (argument3 == undefined)
        argument3 = undefined
    if (argument4 == undefined)
        argument4 = 4
    if (argument5 == undefined)
        argument5 = 16777215
    if (argument6 == undefined)
        argument6 = 1
    if (!is_struct(argument0))
        return;
    var _width = gml_Script_loot_get_sprite_width(argument0, argument3)
    var _height = gml_Script_loot_get_sprite_height(argument0, argument3)
    var _grid_width = 16 * (ceil(_width / 16))
    var _grid_height = 16 * (ceil(_height / 16))
    argument1 += (0.5 * argument4 * (_grid_width - _width))
    argument2 += (0.5 * argument4 * (_grid_height - _height))
    return gml_Script_loot_draw(argument0, argument1, argument2, argument3, argument4, argument5, argument6);
}

