function player_get(argument0) //gml_Script_player_get
{
    if (argument0 == undefined)
        argument0 = 0
    with (obj_player_parent)
    {
        if (mp_index == argument0)
            return id;
    }
    return -4;
}

