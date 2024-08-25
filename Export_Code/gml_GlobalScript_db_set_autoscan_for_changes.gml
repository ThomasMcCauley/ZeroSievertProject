function db_set_autoscan_for_changes(argument0, argument1) //gml_Script_db_set_autoscan_for_changes
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    __db_trace("Database \"", _database.alias, "\" scan for changes = ", argument1)
    return _database.autoscan_for_changes;
}

