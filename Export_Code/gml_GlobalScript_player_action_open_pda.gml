function player_action_open_pda() //gml_Script_player_action_open_pda
{
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/pda.ui", "pda layer")
    player_set_local_state(gml_Script_scr_player_state_pda)
    audio_play_sound(snd_ui_pda_open, 10, false)
    audio_play_sound(snd_ui_pda_open_finish, 10, false)
    return true;
}

