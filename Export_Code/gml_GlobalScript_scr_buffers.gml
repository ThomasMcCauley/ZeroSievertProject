var _error;
function buffer_save_callback(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_buffer_save_callback
{
    if (argument3 == undefined)
        argument3 = true
    if (argument5 == undefined)
        argument5 = []
    var _arguments = argument5
    array_push(_arguments, ["buffer", argument0], ["directory", argument2], ["file", argument1], ["compression", argument3], ["callstack", debug_get_callstack()])
    callback(function() //gml_Script_anon_buffer_save_callback_gml_GlobalScript_scr_buffers_402_buffer_save_callback_gml_GlobalScript_scr_buffers
    {
        operation_started = false
        async_pointer = undefined
        success = false
    }
, function() //gml_Script_anon_buffer_save_callback_gml_GlobalScript_scr_buffers_522_buffer_save_callback_gml_GlobalScript_scr_buffers
    {
        if (!operation_started)
        {
            operation_started = true
            buffer_async_group_begin(directory)
            if (os_type == os_xboxone || os_type == os_ps4 || os_type == os_psvita)
            {
                buffer_async_group_option("subtitle", "")
                buffer_async_group_option("showdialog", false)
                buffer_async_group_option("savepadindex", 0)
                buffer_async_group_option("saveslotsize", buffer_get_size(buffer))
            }
            buffer_save_async((compression ? buffer_compress(buffer, 0, buffer_get_size(buffer)) : buffer), file, 0, buffer_get_size(buffer))
            async_pointer = buffer_async_group_end()
        }
        return false;
    }
, argument4, false, _arguments)
}

function buffer_load_callback(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_buffer_load_callback
{
    if (argument3 == undefined)
        argument3 = true
    if (argument4 == undefined)
        argument4 = undefined
    if (argument5 == undefined)
        argument5 = []
    _arguments = argument5
    array_push(_arguments, ["buffer", argument0], ["directory", argument2], ["file", argument1], ["compression", argument3], ["callstack", debug_get_callstack()])
    callback(function() //gml_Script_anon_buffer_load_callback_gml_GlobalScript_scr_buffers_1838_buffer_load_callback_gml_GlobalScript_scr_buffers
    {
        operation_started = false
        async_pointer = undefined
        success = false
    }
, function() //gml_Script_anon_buffer_load_callback_gml_GlobalScript_scr_buffers_1958_buffer_load_callback_gml_GlobalScript_scr_buffers
    {
        if (!operation_started)
        {
            operation_started = true
            buffer_async_group_begin(directory)
            if (os_type == os_xboxone || os_type == os_ps4 || os_type == os_psvita)
            {
                buffer_async_group_option("showdialog", false)
                buffer_async_group_option("savepadindex", 0)
            }
            buffer_load_async(buffer, file, 0, -1)
            async_pointer = buffer_async_group_end()
        }
        return false;
    }
, method(
    {
        _complete_func: argument4
    }
, function(argument0) //gml_Script_anon_buffer_load_callback_gml_GlobalScript_scr_buffers_2569_buffer_load_callback_gml_GlobalScript_scr_buffers
    {
        if argument0.compression
            var _buffer = buffer_decompress(argument0.buffer)
        else
            _buffer = argument0.buffer
        if (!is_undefined(_complete_func))
        {
            argument0.buffer = _buffer
            self.method(
            {
                parent: argument0,
                _func: _complete_func
            }
, function() //gml_Script_anon_anon_buffer_load_callback_gml_GlobalScript_scr_buffers_2569_buffer_load_callback_gml_GlobalScript_scr_buffers_2877_anon_buffer_load_callback_gml_GlobalScript_scr_buffers_2569_buffer_load_callback_gml_GlobalScript_scr_buffers
            {
                var _func_to_use = _func
                self.log(parent.callstack)
                with (parent)
                    self._func_to_use()
            }
)()
        }
        else
        {
            buffer_delete(argument0.buffer)
            argument0.buffer = _buffer
        }
    }
), false, _arguments)
}

function buffer_callback_async() //gml_Script_buffer_callback_async
{
    if ds_map_exists(async_load, "type")
        return;
    var _pointer_id = ds_map_find_value(async_load, "id")
    var _pointer_index = undefined
    var i = 0
    while (i < array_length(global.Callback_Data))
    {
        if (global.Callback_Data[i].async_pointer == _pointer_id)
        {
            _pointer_index = i
            break
        }
        else
        {
            i++
            continue
        }
    }
    if (_pointer_index == undefined)
        return;
    if ds_map_find_value(async_load, "status")
    {
        with (global.Callback_Data[_pointer_index])
        {
            success = true
            self.self.complete(self)
        }
    }
    else
    {
        with (global.Callback_Data[_pointer_index])
        {
            success = false
            self.self.complete(self)
        }
    }
    array_delete(global.Callback_Data, _pointer_index, 1)
    return true;
}

function buffer_from_struct(argument0) //gml_Script_buffer_from_struct
{
    _buffer = buffer_create(1, buffer_grow, 1)
    buffer_write(_buffer, buffer_text, json_stringify(argument0))
    return _buffer;
}

function buffer_quf_buffer_free() //gml_Script_buffer_quf_buffer_free
{
    buffer_delete(buffer)
}

function buffer_quf_buffer_create() //gml_Script_buffer_quf_buffer_create
{
    return buffer_create(1, buffer_grow, 1);
}

function buffer_quf_buffer_to_struct() //gml_Script_buffer_quf_buffer_to_struct
{
    if success
    {
        buffer_seek(buffer, buffer_seek_start, 0)
        var _text = buffer_read(buffer, buffer_text)
        @@try_hook@@(3308, 3384)
        variable_global_set(struct, json_parse(_text))
        @@try_unhook@@()
    }
    buffer_delete(buffer)
}

