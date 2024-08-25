function scr_load_unique_action() //gml_Script_scr_load_unique_action
{
    db_open("general")
    for (var i = 0; i < array_length_1d(global.az_section); i++)
        global.az_done[i] = db_read(global.az_section[i], global.az_key[i], false)
    db_close()
}

