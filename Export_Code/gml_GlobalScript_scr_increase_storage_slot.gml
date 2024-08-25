function scr_increase_storage_slot(argument0) //gml_Script_scr_increase_storage_slot
{
    var _amount = argument0
    global.storage_slot_unlocked += _amount
    db_open("chest")
    db_write("Storage", "slot now", global.storage_slot_unlocked)
    db_close()
}

