function player_set_local_index(argument0) //gml_Script_player_set_local_index
{
    __mp_trace("Set local player to index ", argument0)
    global.mp_state.local_player = argument0
}

