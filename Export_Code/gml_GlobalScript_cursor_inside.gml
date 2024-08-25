function cursor_inside(argument0, argument1, argument2, argument3) //gml_Script_cursor_inside
{
    if (obj_cursor.aa_x >= argument0 && obj_cursor.aa_x <= (argument0 + argument2) && obj_cursor.aa_y >= argument1 && obj_cursor.aa_y < (argument1 + argument3))
        return true;
    return false;
}

