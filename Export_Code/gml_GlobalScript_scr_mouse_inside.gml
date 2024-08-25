function scr_mouse_inside(argument0, argument1, argument2, argument3) //gml_Script_scr_mouse_inside
{
    if (mouse_x >= argument0 && mouse_x <= (argument0 + argument2) && mouse_y >= argument1 && mouse_y < (argument1 + argument3))
        return true;
}

