function player_get_data(argument0) //gml_Script_player_get_data
{
    if (argument0 == undefined)
        argument0 = 0
    return global.mp_state.player_data_array[argument0];
}

