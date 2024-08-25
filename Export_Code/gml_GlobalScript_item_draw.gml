function item_draw(argument0, argument1, argument2, argument3) //gml_Script_item_draw
{
    if (argument3 == undefined)
        argument3 = 4
    if (!item_exists(argument0))
        return;
    draw_sprite_ext(item_get_sprite_inv(argument0), 0, argument1, argument2, argument3, argument3, 0, c_white, 1)
}

