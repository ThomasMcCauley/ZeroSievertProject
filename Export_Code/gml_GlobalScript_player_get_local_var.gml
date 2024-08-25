function player_get_local_var(argument0, argument1) //gml_Script_player_get_local_var
{
    if (argument1 == undefined)
        argument1 = 0
    return player_get_var(argument0, player_get_local_index(), argument1);
}

