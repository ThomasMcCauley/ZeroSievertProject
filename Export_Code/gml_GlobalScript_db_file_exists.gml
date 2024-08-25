function db_file_exists(argument0) //gml_Script_db_file_exists
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    var _filename = _database.filename
    if (_filename == undefined)
    {
        __db_error("Database \"", argument0, "\" has not has its filename set")
        return;
    }
    return file_exists(global.database_savedata_root + _filename);
}

