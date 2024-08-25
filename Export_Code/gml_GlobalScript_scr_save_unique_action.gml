function scr_save_unique_action() //gml_Script_scr_save_unique_action
{
    db_open("general")
    for (var i = 0; i < array_length_1d(global.az_section); i++)
    {
        if (global.az_done[i] == true)
            db_write(global.az_section[i], global.az_key[i], true)
    }
    db_close()
}

