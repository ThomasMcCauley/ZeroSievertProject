function db_open(argument0) //gml_Script_db_open
{
    if (global.database_alias != undefined)
        __db_error("Please call db_close() before db_open()")
    global.database_current = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(global.database_current))
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
    global.database_alias = argument0
    global.database_data_root = global.database_current.data
    if (global.database_current.is_group && argument0 != global.database_current.alias)
    {
        global.database_data_root = variable_struct_get(global.database_data_root, argument0)
        if (!is_struct(global.database_data_root))
            __db_error("Database \"", argument0, "\" has not been set up with db_group_setup()")
    }
}

