function player_step_freeze_shooting() //gml_Script_player_step_freeze_shooting
{
    if (!(player_state_is(mp_index, gml_Script_scr_player_state_move)))
    {
        shooting = true
        alarm[1] = 10
    }
}

