function db_key_delete(argument0, argument1) //gml_Script_db_key_delete
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_write()")
        return;
    }
    var _root_struct = global.database_data_root
    var _section_struct = variable_struct_get(_root_struct, argument0)
    if (!is_struct(_section_struct))
        return;
    variable_struct_remove(_section_struct, argument1)
}

