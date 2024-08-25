function player_all_dead() //gml_Script_player_all_dead
{
    with (obj_player_parent)
    {
        if (!(player_state_is(mp_index, gml_Script_scr_player_state_dead)))
            return false;
    }
    return true;
}

