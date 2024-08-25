function db_read(argument0, argument1, argument2) //gml_Script_db_read
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_read()")
        return;
    }
    if ((!global.database_current.loaded) && global.database_current.allow_load)
    {
        __db_error("\"", global.database_alias, "\" has not been loaded")
        return;
    }
    var _root_struct = global.database_data_root
    var _section_struct = variable_struct_get(_root_struct, argument0)
    if (!is_struct(_section_struct))
        return argument2;
    if (!(variable_struct_exists(_section_struct, argument1)))
        return argument2;
    return variable_struct_get(_section_struct, argument1);
}

