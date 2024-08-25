function instance_line_of_sight(argument0, argument1, argument2) //gml_Script_instance_line_of_sight
{
    if (!instance_exists(argument2))
        return false;
    return (!(collision_line(argument0, argument1, argument2.x, argument2.y, obj_solid, true, true)));
}

