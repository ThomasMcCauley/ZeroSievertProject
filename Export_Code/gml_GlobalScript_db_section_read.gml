var _temp_local_var_3;
function db_section_read(argument0) //gml_Script_db_section_read
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
    if variable_struct_exists(_root_struct, argument0)
        var _temp_local_var_3 = variable_struct_get(_root_struct, argument0)
    else
    {
        var _temp_local_var_3 = {}
    }
    return {};
}

