function ui_handle_input(argument0) //gml_Script_ui_handle_input
{
    with (gml_Script___uiGlobal().__defaultOnion)
    {
        var _oldMode = self.InputGetMode()
        if ((!(!obj_gamepad.last_input_keyboard)) || (global.is_steamdeck && mouse_check_button(mb_left)))
            self.InputSetMode("pointer")
        else
            self.InputSetMode("directional")
        if (_oldMode == self.InputGetMode())
        {
            if (self.InputGetMode() == "pointer")
            {
                self.InputPointer((argument0 * device_mouse_x_to_gui(0)), (argument0 * device_mouse_y_to_gui(0)))
                self.InputButtonTarget("action", mouse_check_button(mb_left))
                self.InputButtonTarget("alt", mouse_check_button(mb_right))
                self.InputButtonCast("pause", keyboard_check(vk_escape))
                self.InputButtonCast("back", keyboard_check_pressed(global.kb_now[(37 << 0)]))
                self.InputButtonCast("use device", keyboard_check_pressed(global.kb_now[(10 << 0)]))
                self.InputButtonCast("inventory", keyboard_check_pressed(global.kb_now[(5 << 0)]))
                self.InputButtonCast("map shortcut", keyboard_check_pressed(global.kb_now[(11 << 0)]))
                self.InputButtonCast("credits scroll up", (mouse_wheel_up() || keyboard_check(vk_up)))
                self.InputButtonCast("credits scroll down", (mouse_wheel_down() || keyboard_check(vk_down)))
                self.InputButtonCast("teleport hotkey 1", keyboard_check(ord("1")))
                self.InputButtonCast("teleport hotkey 2", keyboard_check(ord("2")))
                self.InputButtonCast("teleport hotkey 3", keyboard_check(ord("3")))
                self.InputButtonCast("teleport hotkey 4", keyboard_check(ord("4")))
                self.InputButtonCast("teleport hotkey 5", keyboard_check(ord("5")))
                self.InputButtonCast("teleport hotkey 6", keyboard_check(ord("6")))
                self.InputButtonCast("teleport hotkey 7", keyboard_check(ord("7")))
                self.InputButtonCast("teleport hotkey 8", keyboard_check(ord("8")))
                self.InputButtonCast("teleport hotkey 9", keyboard_check(ord("9")))
                self.InputButtonCast("teleport hotkey 0", keyboard_check(ord("0")))
            }
            else
            {
                var _dX = 0
                var _dY = 0
                var _skipGroup = false
                if (obj_gamepad.input_value[(8 << 0)] || obj_gamepad.input_value[(9 << 0)] || obj_gamepad.input_value[(10 << 0)] || obj_gamepad.input_value[(11 << 0)])
                {
                    _dX = (obj_gamepad.input_value[(11 << 0)]) - (obj_gamepad.input_value[(10 << 0)])
                    _dY = (obj_gamepad.input_value[(9 << 0)]) - (obj_gamepad.input_value[(8 << 0)])
                }
                else
                {
                    var _leftX = (obj_gamepad.input_decimal[(17 << 0)]) - (obj_gamepad.input_decimal[(16 << 0)])
                    var _leftY = (obj_gamepad.input_decimal[(15 << 0)]) - (obj_gamepad.input_decimal[(14 << 0)])
                    var _rightX = (obj_gamepad.input_decimal[(24 << 0)]) - (obj_gamepad.input_decimal[(23 << 0)])
                    var _rightY = (obj_gamepad.input_decimal[(22 << 0)]) - (obj_gamepad.input_decimal[(21 << 0)])
                    if (point_distance(0, 0, _leftX, _leftY) >= point_distance(0, 0, _rightX, _rightY))
                    {
                        _dX = _leftX
                        _dY = _leftY
                    }
                    else
                    {
                        _dX = _rightX
                        _dY = _rightY
                        _skipGroup = true
                    }
                }
                var _retrigger = ((obj_gamepad.input_duration[(17 << 0)] > 15 && ((obj_gamepad.input_duration[(17 << 0)]) % 5) == 0) || (obj_gamepad.input_duration[(16 << 0)] > 15 && ((obj_gamepad.input_duration[(16 << 0)]) % 5) == 0) || (obj_gamepad.input_duration[(14 << 0)] > 15 && ((obj_gamepad.input_duration[(14 << 0)]) % 5) == 0) || (obj_gamepad.input_duration[(15 << 0)] > 15 && ((obj_gamepad.input_duration[(15 << 0)]) % 5) == 0))
                self.InputDirection(_dX, _dY, _retrigger, obj_gamepad.deadzone_inner, _skipGroup)
                self.InputButtonTarget("action", obj_gamepad.input_value[(0 << 0)])
                self.InputButtonTarget("alt", obj_gamepad.input_value[(1 << 0)])
                self.InputButtonTarget("gamepad tooltip", obj_gamepad.input_value[(3 << 0)])
                self.InputButtonTarget("quick move", obj_gamepad.input_value[(2 << 0)])
                self.InputButtonCast("credits scroll up", (obj_gamepad.input_value[(8 << 0)] || obj_gamepad.input_value[(14 << 0)]))
                self.InputButtonCast("credits scroll down", (obj_gamepad.input_value[(9 << 0)] || obj_gamepad.input_value[(15 << 0)]))
                self.InputButtonCast("pause", obj_gamepad.input_value[(13 << 0)])
                self.InputButtonCast("inventory", obj_gamepad.input_value[(12 << 0)])
                self.InputButtonCast("back", obj_gamepad.action[(37 << 0)].released)
            }
        }
    }
}

