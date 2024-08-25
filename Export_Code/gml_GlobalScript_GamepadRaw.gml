var _temp_local_var_2;
function GamepadRaw() constructor //gml_Script_GamepadRaw
{
    var _temp_local_var_2 = Gamepad()
    if @@CopyStatic@@(gml_Script_Gamepad)
    {
    }
    else
    {
        function anon_GamepadRaw_gml_GlobalScript_GamepadRaw_1727_GamepadRaw_gml_GlobalScript_GamepadRaw() //gml_Script_anon_GamepadRaw_gml_GlobalScript_GamepadRaw_1727_GamepadRaw_gml_GlobalScript_GamepadRaw
        {
            obj_gamepad.number_of_gamepads_connected = 0
            value = array_create((30 << 0), 0)
            var _count_connected = array_length(obj_gamepad.connected_devices)
            for (var i = 0; i < _count_connected; i++)
            {
                var _gamepad_id = obj_gamepad.connected_devices[i]
                if ((!settings_get("enable_dinput_devices")) && _gamepad_id >= 4)
                {
                }
                else if gamepad_is_connected(_gamepad_id)
                {
                    obj_gamepad.number_of_gamepads_connected++
                    if (!settings_get("enable_gamepad_devices"))
                    {
                    }
                    else
                    {
                        for (var j = 0; j < lookup_count; j++)
                        {
                            var _this_lookup = lookup[j]
                            value[_this_lookup.out] = max(value[_this_lookup.out], gamepad_button_check(_gamepad_id, _this_lookup.in))
                        }
                        value[(14 << 0)] = max(value[(14 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislv)))
                        value[(16 << 0)] = max(value[(16 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislh)))
                        value[(15 << 0)] = max(value[(15 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislv), true))
                        value[(17 << 0)] = max(value[(17 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislh), true))
                        value[(21 << 0)] = max(value[(21 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrv)))
                        value[(23 << 0)] = max(value[(23 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrh)))
                        value[(22 << 0)] = max(value[(22 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrv), true))
                        value[(24 << 0)] = max(value[(24 << 0)], self.axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrh), true))
                    }
                }
            }
        }

        function anon_GamepadRaw_gml_GlobalScript_GamepadRaw_3869_GamepadRaw_gml_GlobalScript_GamepadRaw(argument0, argument1) //gml_Script_anon_GamepadRaw_gml_GlobalScript_GamepadRaw_3869_GamepadRaw_gml_GlobalScript_GamepadRaw
        {
            if (argument1 == undefined)
                argument1 = -1
            return clamp((argument1 * argument0), 0, 1);
        }

    }
    var _i = 0
    lookup[_i++] = 
    {
        in: gp_face1,
        out: (0 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_face2,
        out: (1 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_face3,
        out: (2 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_face4,
        out: (3 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_shoulderl,
        out: (4 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_shoulderlb,
        out: (5 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_shoulderr,
        out: (6 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_shoulderrb,
        out: (7 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_padu,
        out: (8 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_padd,
        out: (9 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_padl,
        out: (10 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_padr,
        out: (11 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_select,
        out: (12 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_start,
        out: (13 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_stickl,
        out: (18 << 0)
    }

    lookup[_i++] = 
    {
        in: gp_stickr,
        out: (25 << 0)
    }

    lookup_count = array_length(lookup)
}

