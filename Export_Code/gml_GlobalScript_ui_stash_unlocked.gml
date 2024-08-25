function ui_stash_unlocked(argument0) //gml_Script_ui_stash_unlocked
{
    if (argument0 < global.storage_slot_unlocked)
        return true;
    return false;
}

