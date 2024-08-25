function db_get_filename(argument0) //gml_Script_db_get_filename
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    return _database.filename;
}

