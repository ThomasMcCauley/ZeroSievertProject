function db_set_filename(argument0, argument1) //gml_Script_db_set_filename
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    var _unload = _database.filename != argument1
    __db_trace("Set database \"", argument0, "\" filename to \"", argument1, "\"")
    _database.filename = argument1
    if _unload
    {
        __db_trace("Database \"", argument0, "\" unloaded due to filename change")
        _database.loaded = false
    }
}

