var _error;
function db_load(argument0) //gml_Script_db_load
{
    var _database = variable_struct_get(global.database_struct, argument0)
    if (!is_struct(_database))
    {
        __db_error("Database \"", argument0, "\" has not been created with db_create()")
        return;
    }
    if (!_database.allow_load)
    {
        __db_trace("Warning! Trying to load unloadable database \"", argument0, "\"")
        return;
    }
    var _filename = _database.filename
    if (_filename == undefined)
    {
        __db_error("Database \"", argument0, "\" has not has its filename set")
        return;
    }
    var _buffer = -1
    var _json_root = {}
    var _data = {}
    @@try_hook@@(796, 1004)
    __db_trace("Loading \"", argument0, "\" from \"", _filename, "\"")
    if (!(file_exists(global.database_savedata_root + _filename)))
        __db_error("\"" + _filename + "\" doesn't exist")
    _buffer = buffer_load(global.database_savedata_root + _filename)
    _json_root = json_parse(buffer_read(_buffer, buffer_text))
    _data = _json_root.data
    __db_trace("Succeeded in loading \"", argument0, "\" from \"", _filename, "\"")
    @@try_unhook@@()
    if (_buffer >= 0)
        buffer_delete(_buffer)
    _database.metadata = _json_root
    _database.data = _data
    _database.loaded = true
    if _database.is_group
    {
        var _i = 0
        repeat array_length(_database.group_names)
        {
            var _name = _database.group_names[_i]
            if (!(variable_struct_exists(_data, _name)))
            {
                variable_struct_set(_data, _name, {})
            }
            _i++
        }
    }
}

