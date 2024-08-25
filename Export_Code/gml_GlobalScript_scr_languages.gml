global.language_current = "english"
global.language_data_current = {}
global.language_tracking = {}
global.language_font_offset = 
{
    x: 0,
    y: 0
}

global.language_font_offset_array = [
{
    x: 0,
    y: 0
}
]
global.language_font_scale = [8, 12, 16, 24, 32, 64]
global.language_fonts = array_create(array_length(global.language_font_scale), undefined)
global.language_fonts_references = 
{
    font_credits_32px: 1,
    font_credits_64px: 3,
    font_credits_big: 12,
    font_credits_small: 13,
    font_main_menu: 9,
    font_minuscolo_16px: 7,
    font_munro_12px: 5,
    font_munro_24: 11,
    font_munro_32px: 14,
    font_munro_64px: 15,
    font_munro_8px: 4,
    font_name_speaker: 8,
    font_quest: 6,
    font_quest_32px: 0
}

function language_set_new_language(argument0, argument1) //gml_Script_language_set_new_language
{
    if (argument0 == undefined)
        argument0 = "ZS_vanilla"
    var _language_previous = global.language_current
    global.language_current = argument1
    settings_set("language", argument1)
    settings_set_write_to_disk(true)
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
    else
    {
        show_error(("Missing translation: " + _file), true)
        global.language_current = _language_previous
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
            global.language_fonts[i] = font_add((argument0 + "/" + (variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font"))), _font_sizes[i], false, false, 32, 9467)
        }
        global.language_font_offset_array = variable_struct_get(variable_struct_get(variable_struct_get(global.language_data, "languages"), global.language_current), "font_offset")
    }
    else
        show_error(("Missing font: " + _file), true)
}

function draw_set_font_language(argument0) //gml_Script_draw_set_font_language
{
    draw_set_font(argument0)
    for (i = 0; i < array_length(global.language_font_offset_array); i++)
    {
        if (argument0 == global.language_fonts[i])
        {
            global.language_font_offset = global.language_font_offset_array[i]
            return;
        }
    }
}

function language_resolve_font(argument0) //gml_Script_language_resolve_font
{
    var _font_value = argument0
    if is_string(_font_value)
    {
        _font_value = variable_struct_get(global.language_fonts_references, _font_value)
        if is_undefined(_font_value)
            show_error(("Missing font! " + argument0), true)
    }
    switch _font_value
    {
        case 6:
        case 4:
        case 13:
            return global.language_fonts[(0 << 0)];
        case 5:
        case 9:
            global.language_fonts[(0 << 0)] = global.language_fonts[(2 << 0)]
            return global.language_fonts[(0 << 0)];
        case 7:
        case 8:
        case 12:
            global.language_fonts[(0 << 0)] = global.language_fonts[(1 << 0)]
            return global.language_fonts[(0 << 0)];
        case 11:
        case 10:
            global.language_fonts[(0 << 0)] = global.language_fonts[(3 << 0)]
            return global.language_fonts[(0 << 0)];
        case 1:
        case 14:
        case 0:
            global.language_fonts[(0 << 0)] = global.language_fonts[(4 << 0)]
            return global.language_fonts[(0 << 0)];
        case 3:
        case 15:
            global.language_fonts[(0 << 0)] = global.language_fonts[(5 << 0)]
            return global.language_fonts[(0 << 0)];
    }

}

function language_get_string(argument0) //gml_Script_language_get_string
{
    if (argument0 == undefined)
        argument0 = ""
    if (string_replace_all(argument0, " ", "") == "")
        return argument0;
    if is_undefined(variable_struct_get(global.language_data_current, argument0))
    {
        if (true && (!(variable_struct_exists(global.language_tracking, argument0))))
        {
            variable_struct_set(global.language_tracking, argument0, true)
            return argument0;
        }
        return argument0;
    }
    return variable_struct_get(global.language_data_current, argument0);
}

function language_get_font(argument0) //gml_Script_language_get_font
{
    if (argument0 == undefined)
        argument0 = 1
    return global.language_fonts[argument0];
}

function language_set_font(argument0) //gml_Script_language_set_font
{
    if (argument0 == undefined)
        argument0 = 1
    return draw_set_font_language(global.language_fonts[argument0]);
}

function language_string_width(argument0, argument1) //gml_Script_language_string_width
{
    if (argument0 == undefined)
        argument0 = ""
    if (argument1 == undefined)
        argument1 = 1
    var _font = draw_get_font()
    draw_set_font_language(language_get_font(argument1))
    var _width = string_width(argument0)
    draw_set_font_language(_font)
    return _width;
}

function language_string_height(argument0, argument1) //gml_Script_language_string_height
{
    if (argument0 == undefined)
        argument0 = ""
    if (argument1 == undefined)
        argument1 = 1
    _font = draw_get_font()
    draw_set_font_language(language_get_font(argument1))
    _width = string_height(argument0)
    draw_set_font_language(_font)
    return _width;
}

