function db_is_loaded(argument0) //gml_Script_db_is_loaded
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    return _database.loaded;
}

