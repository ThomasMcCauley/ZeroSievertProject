function building_index_load(argument0) //gml_Script_building_index_load
{
    var _directory = filename_dir(argument0)
    var _old_name_array = variable_struct_get_names(global.building_buffer_dict)
    var _index_buffer = buffer_load(argument0)
    if (_index_buffer < 0)
    {
        __building_error("Failed to load \"", argument0, "\"")
        return;
    }
    var _string = buffer_read(_index_buffer, buffer_string)
    buffer_delete(_index_buffer)
    var _json_root = json_parse(_string)
    if (!is_struct(_json_root))
    {
        __building_error("Contents of \"", argument0, "\" are corrupted")
        return;
    }
    global.building_filename_dict = variable_struct_get(_json_root, "building_index")
    if (!is_struct(global.building_filename_dict))
    {
        __building_error("Member variable \"building_index\" is corrupted")
        return;
    }
    var _new_name_array = variable_struct_get_names(global.building_filename_dict)
    var _i = 0
    repeat array_length(_new_name_array)
    {
        var _building_name = _new_name_array[_i]
        var _building_filename = _directory + "/" + (variable_struct_get(global.building_filename_dict, _building_name))
        var _old_buffer = variable_struct_get(global.building_buffer_dict, _building_name)
        if (_old_buffer != undefined)
        {
            __building_trace("Removing old buffer for building \"", _building_name, "\"")
            buffer_delete(_old_buffer)
        }
        var _new_buffer = buffer_load(_building_filename)
        if (_new_buffer < 0)
            __building_error("Failed to load \"", _building_filename, "\"")
        __building_trace("Loaded buffer for building \"", _building_name, "\"")
        variable_struct_set(global.building_buffer_dict, _building_name, _new_buffer)
        _i++
    }
    _i = 0
    repeat array_length(_old_name_array)
    {
        _building_name = _old_name_array[_i]
        if (!(variable_struct_exists(global.building_filename_dict, _building_name)))
        {
            __building_trace("Warning! Building \"", _building_name, "\" no longer present in building array")
            _old_buffer = variable_struct_get(global.building_buffer_dict, _building_name)
            if (_old_buffer != undefined)
            {
                __building_trace("Removing old buffer for building \"", _building_name, "\"")
                buffer_delete(_old_buffer)
            }
        }
        _i++
    }
}

