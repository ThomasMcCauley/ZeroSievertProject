function db_cloud_sync(argument0, argument1) //gml_Script_db_cloud_sync
{
    if (argument1 == undefined)
        argument1 = 0
    if db_cloud_enabled()
    {
        __db_trace("Trying to sync \"", argument0, "\"")
        if (1 && steam_file_exists(argument0))
            db_cloud_try_restore(argument0, argument1)
        else
            db_cloud_clean_up(argument0, argument1)
    }
}

