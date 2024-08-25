function set_state_after_consumable() //gml_Script_set_state_after_consumable
{
    if (!instance_exists(obj_exit_screen))
        player_set_state(gml_Script_scr_player_state_move, follow_id.mp_index)
    else
        player_set_state(gml_Script_scr_player_state_start, follow_id.mp_index)
}

