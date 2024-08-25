function db_create(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_db_create
{
    if variable_struct_exists(global.database_struct, argument0)
    {
        __db_trace("Database \"", argument0, "\" already exists")
        return;
    }
    var _database = 
    {
        alias: argument0,
        metadata: {},
        data: {},
        is_group: false,
        group_names: [],
        autoscan_for_changes: true,
        changed: false,
        save_on_close: true,
        filename: undefined,
        loaded: false,
        create_backups: argument1,
        allow_load: argument2,
        allow_save: argument3,
        pretty_output: argument4,
        cloud: argument5,
        save_hash: undefined
    }

    array_push(global.database_array, argument0)
    variable_struct_set(global.database_struct, argument0, _database)
}

