var _temp_local_var_4;
function db_group_setup(argument0, argument1) //gml_Script_db_group_setup
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    _database.is_group = true
    _database.group_names = argument1
    variable_struct_set(_database.data, argument0, {})
    var _i = 0
    var _temp_local_var_4 = array_length(argument1)
    if (array_length(argument1) <= 0)
    {
    }
    else
    {
        while (true)
        {
            var _alias = argument1[_i]
            variable_struct_set(_database.data, _alias, {})
            variable_struct_set(global.database_struct, _alias, _database)
            _i++
            var _temp_local_var_4 = (array_length(argument1) - 1)
            if (array_length(argument1) - 1)
            {
                continue
                break
            }
        }
    }
    __db_trace("Set database \"", argument0, "\" group to ", argument1)
}

