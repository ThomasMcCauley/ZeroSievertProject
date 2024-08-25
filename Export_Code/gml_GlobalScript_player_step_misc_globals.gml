function player_step_misc_globals() //gml_Script_player_step_misc_globals
{
    if (!(player_state_is(mp_index, gml_Script_scr_player_state_move)))
        global.change_ammo_now = false
    if is_in_raid()
        is_indoor = y > obj_map_generator.map_height
}

