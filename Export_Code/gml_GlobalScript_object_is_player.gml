function object_is_player(argument0) //gml_Script_object_is_player
{
    if (argument0 >= 100000)
    {
        if (!instance_exists(argument0))
            return false;
        argument0 = argument0.object_index
    }
    return (argument0 == obj_player || argument0 == 65);
}

