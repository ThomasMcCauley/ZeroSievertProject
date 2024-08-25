function draw_text_outlined_with_control(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_draw_text_outlined_with_control
{
    if (argument4 == undefined)
        argument4 = c_white
    if (argument5 == undefined)
        argument5 = 1
    var _use_x = argument0
    var _use_y = argument1
    argument2 = string(argument2)
    if (!obj_gamepad.last_input_keyboard)
    {
        var _lookup_index = obj_gamepad.lookup_action_to_input[argument3]
        if (argument5 <= 0)
            var _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard
        else if ((current_time / 1000 * argument5) % 1)
            _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard
        else
            _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].pressed
        var _sprite_width = 15
        var _sprite_width_half = _sprite_width / 2
        _use_x += (_sprite_width_half - 2)
        var _string_area = text_find_draw_area(_use_x, _use_y, argument2)
        draw_sprite(_use_sprite, obj_gamepad.gamepad_manufacturer, (_string_area[0] - _sprite_width_half), ((_string_area[3] - _string_area[1]) / 2 + _string_area[1] - 1))
        var _width_total = _string_area[2] - _string_area[0] + sprite_get_width(_use_sprite) + 6
        var _height_total = _string_area[3] - _string_area[1]
    }
    else
    {
        argument3 = string(argument3)
        argument2 = "[" + scr_key_map(global.kb_now[argument3]) + "] " + argument2
        _width_total = string_width(argument2)
        _height_total = string_height(argument2)
    }
    scr_draw_text_outlined(_use_x, _use_y, argument2, argument4, c_black, 1, 1)
    return [_use_x, _use_y, _width_total, _height_total];
}

