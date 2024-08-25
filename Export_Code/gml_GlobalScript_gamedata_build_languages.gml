function gamedata_build_languages(argument0) //gml_Script_gamedata_build_languages
{
    if (argument0 == undefined)
        argument0 = "ZS_vanilla"
    global.language_current = string_lower(settings_get("language"))
    if (!(variable_struct_exists(variable_struct_get(global.language_data, "languages"), global.language_current)))
        global.language_current = "english"
    var _file = argument0 + "/" + (variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "csv"))
    if file_exists(_file)
    {
        var _grid = load_csv(argument0 + "/" + (variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "csv")))
        global.language_data_current = {}
        var _rows = ds_grid_height(_grid)
        for (var _y = 0; _y < _rows; _y++)
            variable_struct_set(global.language_data_current, string_replace_all(ds_grid_get(_grid, 0, _y), "\\n", "\n"), string_replace_all(ds_grid_get(_grid, 3, _y), "\\n", "\n"))
        ds_grid_destroy(_grid)
    }
    font_add_enable_aa(false)
    _file = argument0 + "/" + (variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font"))
    var _font_sizes = variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font_sizes")
    if file_exists(_file)
    {
        for (var i = 0; i < array_length(global.language_font_scale); i++)
        {
            if ((!is_undefined(global.language_fonts[i])) && font_exists(global.language_fonts[i]))
                font_delete(global.language_fonts[i])
            global.language_fonts[i] = font_add((argument0 + "/" + (variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font"))), _font_sizes[i], false, false, 32, 255)
        }
        global.language_font_offset_array = variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font_offset")
    }
    else
        show_error(("Missing font: " + _file), true)
}

