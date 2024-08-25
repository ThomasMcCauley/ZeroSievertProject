function db_get_data(argument0) //gml_Script_db_get_data
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    var _root_struct = _database.data
    if _database.is_group
        _root_struct = variable_struct_get(_root_struct, argument0)
    return _root_struct;
}

