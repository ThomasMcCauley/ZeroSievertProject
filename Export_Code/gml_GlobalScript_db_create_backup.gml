function db_create_backup(argument0, argument1) //gml_Script_db_create_backup
{
    var _new_filename = argument1 + string(5) + "_" + argument0
    file_delete(global.database_savedata_root + _new_filename)
    var _i = 5
    repeat (4)
    {
        var _old_filename = argument1 + (string(_i - 1)) + "_" + argument0
        _new_filename = argument1 + string(_i) + "_" + argument0
        if file_exists(global.database_savedata_root + _old_filename)
            file_copy((global.database_savedata_root + _old_filename), (global.database_savedata_root + _new_filename))
        _i--
    }
    _new_filename = argument1 + "1_" + argument0
    if file_exists(global.database_savedata_root + argument0)
        file_copy((global.database_savedata_root + argument0), (global.database_savedata_root + _new_filename))
}

