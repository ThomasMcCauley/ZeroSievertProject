function exit_to_main_menu_permadeath() //gml_Script_exit_to_main_menu_permadeath
{
    db_file_delete("shared")
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.Clear()
    room_goto(r_menu)
}

