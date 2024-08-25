function ds_list_print(argument0) //gml_Script_ds_list_print
{
    var _str = ""
    var _list = argument0
    var _size = ds_list_size(_list)
    for (var _i = 0; _i < _size; _i++)
        _str = _str + "[" + (string(ds_list_find_value(_list, _i))) + "] "
    return _str;
}

function ds_grid_print(argument0) //gml_Script_ds_grid_print
{
    _str = ""
    var _width = ds_grid_width(argument0)
    var _height = ds_grid_height(argument0)
    for (var _y = 0; _y < _height; _y++)
    {
        for (var _x = 0; _x < _width; _x++)
            _str = _str + "[" + (string(ds_grid_get(argument0, _x, _y))) + "] "
        _str = _str + "\n"
    }
    return _str;
}

function debug_output() //gml_Script_debug_output
{
}

