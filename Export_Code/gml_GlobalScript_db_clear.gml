var _temp_local_var_4;
function db_clear(argument0) //gml_Script_db_clear
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    __db_trace("Clearing database \"", argument0, "\"")
    _database.metadata = {}
    if _database.is_group
    {
        var _i = 0
        var _temp_local_var_4 = array_length(_database.group_names)
        if (array_length(_database.group_names) <= 0)
        {
        }
        else
        {
            while (true)
            {
                variable_struct_set(_database.data, _database.group_names[_i], {})
                _i++
                var _temp_local_var_4 = (array_length(_database.group_names) - 1)
                if (array_length(_database.group_names) - 1)
                {
                    continue
                    break
                }
            }
        }
    }
    else
    {
        _database.data = {}
    }
}

