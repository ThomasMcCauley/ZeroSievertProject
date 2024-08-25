function scr_aggiorna_save_slot(argument0) //gml_Script_scr_aggiorna_save_slot
{
    db_set_filename("shared", ("save_shared_" + string(argument0) + ".dat"))
}

