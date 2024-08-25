function db_section_exists(argument0) //gml_Script_db_section_exists
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_section_exists()")
        return;
    }
    if ((!global.database_current.loaded) && global.database_current.allow_load)
    {
        __db_error("\"", global.database_alias, "\" has not been loaded")
        return;
    }
    var _root_struct = global.database_data_root
    return variable_struct_exists(_root_struct, argument0);
}

