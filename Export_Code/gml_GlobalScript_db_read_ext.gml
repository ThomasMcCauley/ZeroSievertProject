function db_read_ext(argument0, argument1, argument2, argument3) //gml_Script_db_read_ext
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    if ((!_database.loaded) && _database.allow_load)
    {
        __db_error("\"", argument0, "\" has not been loaded")
        return;
    }
    var _root_struct = _database.data
    if (_database.is_group && argument0 != _database.alias)
        _root_struct = variable_struct_get(_root_struct, argument0)
    var _section_struct = variable_struct_get(_root_struct, argument1)
    if (!is_struct(_section_struct))
        return argument3;
    if (!(variable_struct_exists(_section_struct, argument2)))
        return argument3;
    return variable_struct_get(_section_struct, argument2);
}

