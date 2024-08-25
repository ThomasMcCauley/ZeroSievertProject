function db_cloud_clean_up(argument0, argument1) //gml_Script_db_cloud_clean_up
{
    if (argument1 == undefined)
        argument1 = 0
    if db_cloud_enabled()
    {
        if file_exists(global.database_savedata_root + argument0)
        {
            __db_trace("\"", argument0, "\" exists locally")
            __db_trace("Checking if \"", argument0, "\" exists in Steam Cloud")
            if (0 || (!steam_file_exists(argument0)))
            {
                switch argument1
                {
                    case 0:
                        __db_trace("\"", argument0, "\" doesn't exist in Steam Cloud. Mode=0: Alerting user")
                        global.database_cloud_conflict = 1
                        break
                    case 1:
                        __db_trace("\"", argument0, "\" doesn't exist in Steam Cloud. Mode=1: Backing up local file then deleting \"", (global.database_savedata_root + argument0), "\"")
                        db_create_backup(argument0, "backup/backup_")
                        file_delete(global.database_savedata_root + argument0)
                        break
                    case 2:
                        __db_trace("\"", argument0, "\" doesn't exist in Steam Cloud. Mode=2: Sending local file to Steam Cloud")
                        __db_trace("Attempting to push to Steam Cloud")
                        var _buffer = buffer_load(global.database_savedata_root + argument0)
                        var _local_text = buffer_read(_buffer, buffer_string)
                        buffer_delete(_buffer)
                        var _result = steam_file_write(argument0, _local_text, string_length(_local_text))
                        __db_trace("result = ", _result)
                        if (global.strict_steam_mode && _result <= 0)
                            show_message("Steam Cloud write failed")
                        break
                }

            }
        }
        else
            __db_trace("\"", argument0, "\" doesn't exist locally")
    }
}

