function draw_gamepad_action_button(argument0, argument1, argument2, argument3, argument4) //gml_Script_draw_gamepad_action_button
{
    var _lookup_index = obj_gamepad.lookup_action_to_input[argument0]
    if (argument4 <= 0)
        var _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard
    else if ((current_time / 1000 * argument4) % 1)
        _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard
    else
        _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].pressed
    switch argument0
    {
        case (17 << 0):
            _use_sprite = s_gamepad_radial_1
            break
        case (18 << 0):
            _use_sprite = s_gamepad_radial_2
            break
        case (19 << 0):
            _use_sprite = s_gamepad_radial_3
            break
        case (20 << 0):
            _use_sprite = s_gamepad_radial_4
            break
        case (21 << 0):
            _use_sprite = s_gamepad_radial_5
            break
        case (22 << 0):
            _use_sprite = s_gamepad_radial_6
            break
        case (15 << 0):
            _use_sprite = s_gamepad_button_face_north_standard
            break
        case (16 << 0):
            _use_sprite = s_gamepad_button_face_north_standard
            break
    }

    var _sprite_width = 15
    var _sprite_width_half = _sprite_width / 2
    draw_sprite_ext(_use_sprite, obj_gamepad.gamepad_manufacturer, argument1, argument2, argument3, argument3, 0, c_white, draw_get_alpha())
}

