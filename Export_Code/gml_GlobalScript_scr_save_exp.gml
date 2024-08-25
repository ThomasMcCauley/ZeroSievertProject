function scr_save_exp() //gml_Script_scr_save_exp
{
    db_open("general")
    db_write("Exp", "Amount", global.esperienza)
    db_write("Exp", "Livello", global.livello_now)
    db_close()
}

