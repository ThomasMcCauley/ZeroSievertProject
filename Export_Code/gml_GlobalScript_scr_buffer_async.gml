function buffer_async_init() //gml_Script_buffer_async_init
{
    global.Buffer_Async_List = ds_list_create()
    global.Buffer_Async_Pointers = ds_list_create()
    global.Buffer_Async_Queued = false
}

function buffer_async_load(argument0, argument1, argument2, argument3) //gml_Script_buffer_async_load
{
    if (ds_list_size(global.Buffer_Async_Pointers) > 0)
    {
        var _struct = {}
        ds_list_add(global.Buffer_Async_Pointers, -1)
        ds_list_add(global.Buffer_Async_List, _struct)
        variable_struct_set(_struct, (0 << 0), argument0)
        variable_struct_set(_struct, (1 << 0), argument1)
        variable_struct_set(_struct, (4 << 0), 0)
        variable_struct_set(_struct, (5 << 0), false)
        variable_struct_set(_struct, (6 << 0), argument2)
        variable_struct_set(_struct, (7 << 0), argument3)
        variable_struct_set(_struct, (3 << 0), -1)
        show_debug_message("Adding \"" + (variable_struct_get(_struct, (1 << 0))) + "\" to queue")
    }
    else
    {
        show_debug_message("Attempting to load \"" + argument1 + "\"")
        _struct = {}
        var _pointer = buffer_load_async(argument0, argument1, 0, -1)
        ds_list_add(global.Buffer_Async_Pointers, _pointer)
        ds_list_add(global.Buffer_Async_List, _struct)
        variable_struct_set(_struct, (0 << 0), argument0)
        variable_struct_set(_struct, (1 << 0), argument1)
        variable_struct_set(_struct, (4 << 0), 0)
        variable_struct_set(_struct, (5 << 0), false)
        variable_struct_set(_struct, (6 << 0), argument2)
        variable_struct_set(_struct, (7 << 0), argument3)
        variable_struct_set(_struct, (3 << 0), -1)
    }
}

function buffer_async_process() //gml_Script_buffer_async_process
{
    if (!(ds_map_exists(async_load, "type")))
    {
        var _attempt_limit = 3
        _pointer = ds_map_find_value(async_load, "id")
        var _list_index = ds_list_find_index(global.Buffer_Async_Pointers, _pointer)
        var _skip_queue = false
        if (_list_index != -1)
        {
            _struct = ds_list_find_value(global.Buffer_Async_List, _list_index)
            if variable_struct_get(_struct, (5 << 0))
            {
                if ds_map_find_value(async_load, "status")
                {
                    ds_list_delete(global.Buffer_Async_Pointers, _list_index)
                    ds_list_delete(global.Buffer_Async_List, _list_index)
                    buffer_delete(variable_struct_get(_struct, (0 << 0)))
                    variable_global_set(variable_struct_get(_struct, (6 << 0)), 1)
                    file_copy(((variable_struct_get(_struct, (2 << 0))) + "/" + (variable_struct_get(_struct, (1 << 0)))), ((variable_struct_get(_struct, (2 << 0))) + "/" + (string_delete(variable_struct_get(_struct, (1 << 0)), ((string_length(variable_struct_get(_struct, (1 << 0)))) - 4), 5))))
                    return true;
                }
                else if (variable_struct_get(_struct, (4 << 0)) < _attempt_limit)
                    variable_struct_set_pre(_struct, (4 << 0), ((variable_struct_get(_struct, (4 << 0))) + 1))
                else
                {
                    show_error(("Failed to save file, \"" + (variable_struct_get(_struct, (1 << 0))) + "\". Check anti-virus software and harddrive integrity."), true)
                    variable_global_set(variable_struct_get(_struct, (6 << 0)), -1)
                    _skip_queue = true
                    alarm[0] = 1
                }
            }
            else if ds_map_find_value(async_load, "status")
            {
                if variable_struct_get(_struct, (7 << 0))
                    show_debug_message("File, \"" + (variable_struct_get(_struct, (1 << 0))) + "\" exist.")
                ds_list_delete(global.Buffer_Async_Pointers, _list_index)
                ds_list_delete(global.Buffer_Async_List, _list_index)
                variable_global_set(variable_struct_get(_struct, (6 << 0)), 1)
                if (string_copy(variable_struct_get(_struct, (1 << 0)), ((string_length(variable_struct_get(_struct, (1 << 0)))) - 4), 5) == "_temp")
                {
                    show_debug_message("Copying temp file to actual file location")
                    if variable_struct_get(_struct, (1 << 0))
                        file_delete(variable_struct_get(_struct, (1 << 0)))
                    file_copy(variable_struct_get(_struct, (1 << 0)), string_delete(variable_struct_get(_struct, (1 << 0)), ((string_length(variable_struct_get(_struct, (1 << 0)))) - 4), 5))
                }
            }
            else if (variable_struct_get(_struct, (4 << 0)) < _attempt_limit)
            {
                if variable_struct_get(_struct, (7 << 0))
                {
                    show_debug_message("File, \"" + (variable_struct_get(_struct, (1 << 0))) + "\" does not exist.")
                    if (string_copy(variable_struct_get(_struct, (1 << 0)), ((string_length(variable_struct_get(_struct, (1 << 0)))) - 4), 5) != "_temp")
                    {
                        show_debug_message("Didn't find the file, checking temp file " + ((variable_struct_get(_struct, (1 << 0))) + "_temp"))
                        variable_struct_set(_struct, (1 << 0), ((variable_struct_get(_struct, (1 << 0))) + "_temp"))
                    }
                    else
                    {
                        ds_list_delete(global.Buffer_Async_Pointers, _list_index)
                        ds_list_delete(global.Buffer_Async_List, _list_index)
                        variable_global_set(variable_struct_get(_struct, (6 << 0)), -1)
                    }
                }
                else
                {
                    variable_struct_set_pre(_struct, (4 << 0), ((variable_struct_get(_struct, (4 << 0))) + 1))
                    if (string_copy(variable_struct_get(_struct, (1 << 0)), ((string_length(variable_struct_get(_struct, (1 << 0)))) - 4), 5) != "_temp")
                        variable_struct_set(_struct, (1 << 0), ((variable_struct_get(_struct, (1 << 0))) + "_temp"))
                }
            }
            else if variable_struct_get(_struct, (7 << 0))
            {
                show_debug_message("File, \"" + (variable_struct_get(_struct, (1 << 0))) + "\" does not exist.")
                ds_list_delete(global.Buffer_Async_Pointers, _list_index)
                ds_list_delete(global.Buffer_Async_List, _list_index)
                variable_global_set(variable_struct_get(_struct, (6 << 0)), -1)
            }
            else
            {
                show_error(("Failed to load file, \"" + (variable_struct_get(_struct, (1 << 0))) + "\". Check anti-virus software and harddrive integrity."), true)
                _skip_queue = true
                alarm[0] = 1
            }
        }
        if ((!_skip_queue) && ds_list_size(global.Buffer_Async_Pointers) > 0)
        {
            global.Buffer_Async_Queued = true
            buffer_async_queue()
        }
        return false;
    }
}

function buffer_async_queue() //gml_Script_buffer_async_queue
{
    if global.Buffer_Async_Queued
    {
        if (ds_list_size(global.Buffer_Async_Pointers) > 0)
        {
            _struct = ds_list_find_value(global.Buffer_Async_List, 0)
            if variable_struct_get(_struct, (5 << 0))
            {
                buffer_async_group_begin(variable_struct_get(_struct, (2 << 0)))
                buffer_save_async(variable_struct_get(_struct, (0 << 0)), variable_struct_get(_struct, (1 << 0)), 0, variable_struct_get(_struct, (3 << 0)))
                ds_list_set(global.Buffer_Async_Pointers, 0, buffer_async_group_end())
            }
            else
                ds_list_set(global.Buffer_Async_Pointers, 0, buffer_load_async(variable_struct_get(_struct, (0 << 0)), variable_struct_get(_struct, (1 << 0)), 0, variable_struct_get(_struct, (3 << 0))))
        }
        global.Buffer_Async_Queued = false
    }
}

function buffer_async_save(argument0, argument1, argument2, argument3) //gml_Script_buffer_async_save
{
    var _buffer_size = buffer_get_size(argument0)
    var _buffer_position = buffer_tell(argument0)
    _struct = {}
    var _buffer_copy = buffer_create(_buffer_size, buffer_grow, 1)
    buffer_copy(argument0, 0, _buffer_size, _buffer_copy, 0)
    buffer_seek(argument0, buffer_seek_start, 0)
    if (ds_list_size(global.Buffer_Async_Pointers) > 0)
    {
        ds_list_add(global.Buffer_Async_Pointers, -1)
        ds_list_add(global.Buffer_Async_List, _struct)
        variable_struct_set(_struct, (0 << 0), _buffer_copy)
        variable_struct_set(_struct, (1 << 0), (argument1 + "_temp"))
        variable_struct_set(_struct, (2 << 0), argument2)
        variable_struct_set(_struct, (3 << 0), _buffer_size)
        variable_struct_set(_struct, (4 << 0), 0)
        variable_struct_set(_struct, (5 << 0), true)
        variable_struct_set(_struct, (6 << 0), argument3)
        show_debug_message("Adding \"" + (variable_struct_get(_struct, (1 << 0))) + "\" to queue")
    }
    else
    {
        show_debug_message("Attempting to save \"" + argument1 + "\"")
        buffer_async_group_begin(argument2)
        buffer_save_async(argument0, (argument1 + "_temp"), 0, _buffer_size)
        _pointer = buffer_async_group_end()
        ds_list_add(global.Buffer_Async_Pointers, _pointer)
        ds_list_add(global.Buffer_Async_List, _struct)
        variable_struct_set(_struct, (0 << 0), _buffer_copy)
        variable_struct_set(_struct, (1 << 0), (argument1 + "_temp"))
        variable_struct_set(_struct, (2 << 0), argument2)
        variable_struct_set(_struct, (3 << 0), _buffer_size)
        variable_struct_set(_struct, (4 << 0), 0)
        variable_struct_set(_struct, (5 << 0), true)
        variable_struct_set(_struct, (6 << 0), argument3)
    }
    buffer_seek(argument0, _buffer_position, 0)
}

