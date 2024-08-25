function exit_to_main_menu() //gml_Script_exit_to_main_menu
{
    if is_in_hub()
    {
        scr_save_player_status()
        gml_Script_db_force_save("pre_raid")
    }
    audio_stop_all()
    with (obj_main_menu)
        stop_video = false
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Clear()
    room_goto(r_menu)
}

