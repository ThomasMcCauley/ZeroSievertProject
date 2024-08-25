function player_unstick() //gml_Script_player_unstick
{
    if place_meeting(x, y, obj_solid)
    {
        var _amount = 5
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("W")))
            y -= _amount
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("S")))
            y += _amount
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("D")))
            x += _amount
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")))
            x -= _amount
        if (!obj_gamepad.last_input_keyboard)
        {
            if obj_gamepad.input_pressed[(19 << 0)]
            {
                x += ((obj_gamepad.input_value[(17 << 0)]) * _amount)
                x -= ((obj_gamepad.input_value[(16 << 0)]) * _amount)
                y += ((obj_gamepad.input_value[(15 << 0)]) * _amount)
                y -= ((obj_gamepad.input_value[(14 << 0)]) * _amount)
            }
        }
    }
    return true;
}

