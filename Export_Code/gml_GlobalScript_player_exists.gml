function player_exists(argument0) //gml_Script_player_exists
{
    if (argument0 == undefined)
        argument0 = 0
    with (obj_player_parent)
    {
        if (mp_index == argument0)
            return true;
    }
    return false;
}

