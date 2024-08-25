function db_cloud_wipe(argument0) //gml_Script_db_cloud_wipe
{
    if db_cloud_enabled()
    {
        __db_trace("Removing \"", argument0, "\" from Steam Cloud")
        steam_file_delete(argument0)
        file_delete(global.database_savedata_root + argument0)
    }
}

