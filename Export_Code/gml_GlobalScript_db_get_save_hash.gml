function db_get_save_hash(argument0) //gml_Script_db_get_save_hash
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    return _database.save_hash;
}

