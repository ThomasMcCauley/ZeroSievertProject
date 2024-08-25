var _count_of_input_systems = array_length(array_of_input_systems)
for (var i = 0; i < _count_of_input_systems; i++)
{
    var _this_system = array_of_input_systems[i]
    _this_system._this_system.update()
    scr_gamepad_calculate_dir_and_angle(_this_system.value)
    scr_gamepad_apply_deadzone(_this_system.value)
}
var _last_value = array_create((30 << 0), 0)
array_copy(_last_value, 0, input_value, 0, (30 << 0))
input_decimal = array_create((30 << 0), 0)
input_value = array_create((30 << 0), 0)
input_pressed = array_create((30 << 0), 0)
input_released = array_create((30 << 0), 0)
for (i = 0; i < _count_of_input_systems; i++)
{
    var _values = array_of_input_systems[i].value
    for (var j = 0; j < (30 << 0); j++)
    {
        input_decimal[j] = max(input_decimal[j], _values[j])
        input_value[j] = max(input_value[j], input_decimal[j] > axis_pressed_value)
        input_pressed[j] = max(input_pressed[j], (_last_value[j] <= 0 && input_value[j] >= 1))
        input_released[j] = max(input_released[j], (_last_value[j] >= 1 && input_value[j] <= 0))
        input_duration[j] = max(input_duration[j], (input_duration[j] + input_value[j]))
        if input_pressed[j]
            last_input_keyboard = false
    }
}
input_decimal[(29 << 0)] = 0
input_value[(29 << 0)] = 0
input_pressed[(29 << 0)] = 0
input_released[(29 << 0)] = 0
input_duration[(29 << 0)] = 0
for (j = 0; j < (30 << 0); j++)
{
    if (j != (20 << 0) && j != (27 << 0))
    {
        if (input_decimal[j] > input_decimal[(29 << 0)])
            input_decimal[(29 << 0)] = input_decimal[j]
        if (input_value[j] > input_value[(29 << 0)])
            input_value[(29 << 0)] = input_value[j]
        if (input_pressed[j] > input_pressed[(29 << 0)])
            input_pressed[(29 << 0)] = input_pressed[j]
        if (input_released[j] > input_released[(29 << 0)])
            input_released[(29 << 0)] = input_released[j]
        if (input_duration[j] > input_duration[(29 << 0)])
            input_duration[(29 << 0)] = input_duration[j]
    }
}
for (i = 0; i < (38 << 0); i++)
{
    action[i].decimal = input_decimal[lookup_action_to_input[i]]
    action[i].value = input_value[lookup_action_to_input[i]]
    action[i].pressed = input_pressed[lookup_action_to_input[i]]
    action[i].released = input_released[lookup_action_to_input[i]]
    action[i].duration = input_duration[lookup_action_to_input[i]]
}
if instance_exists(obj_radial_menu)
{
    self.reset_action((0 << 0))
    self.reset_action((1 << 0))
    self.reset_action((3 << 0))
    self.reset_action((2 << 0))
    self.reset_action((10 << 0))
    self.reset_action((11 << 0))
}
if (input_decimal[(26 << 0)] > 0)
{
    if instance_exists(obj_player)
    {
        var _use_smoothing = 0
        if obj_gamepad.action[(28 << 0)].value
        {
            var _sensitivity = global.gamepad_data.gamepad.aiming_sensitivity
            var _last_mouse_x = obj_cursor.x
            var _last_mouse_y = obj_cursor.y
            var _new_x = obj_cursor.x + (lengthdir_x(_sensitivity, obj_gamepad.input_decimal[(27 << 0)])) * (obj_gamepad.input_decimal[(26 << 0)])
            var _new_y = obj_cursor.y + (lengthdir_y(_sensitivity, obj_gamepad.input_decimal[(27 << 0)])) * (obj_gamepad.input_decimal[(26 << 0)])
            goto_x = _new_x
            goto_y = _new_y
        }
        else
        {
            var _dist_min = global.gamepad_data.gamepad.radial_distance_min
            var _dist_max = global.gamepad_data.gamepad.radial_distance_max
            var _dist = lerp(_dist_min, _dist_max, obj_gamepad.input_decimal[(26 << 0)])
            if (obj_gamepad.input_decimal[(26 << 0)] > deadzone_inner)
            {
                _dist_min = global.gamepad_data.gamepad.radial_distance_min
                _dist_max = global.gamepad_data.gamepad.radial_distance_max
                _dist = lerp(_dist_min, _dist_max, obj_gamepad.input_decimal[(26 << 0)])
                var _player = player_get_local()
                var _use_dist = min(aim_assist_override_distance, _dist)
                goto_x = _player.x + (lengthdir_x(_use_dist, ((obj_gamepad.input_decimal[(27 << 0)]) + aim_assist_override_angle)))
                goto_y = _player.y + (lengthdir_y(_use_dist, ((obj_gamepad.input_decimal[(27 << 0)]) + aim_assist_override_angle)))
                _use_smoothing = smoothing
                aim_assist_override_distance = 9999
                aim_assist_override_angle = 0
            }
        }
        var _new_point_x = lerp(goto_x, goto_last_x, _use_smoothing)
        var _new_point_y = lerp(goto_y, goto_last_y, _use_smoothing)
        move_cursor_room(_new_point_x, _new_point_y)
        goto_last_x = _new_point_x
        goto_last_y = _new_point_y
    }
}
if (last_input_keyboard == false)
{
    if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any))
        last_input_keyboard = true
    mouse_last_x = device_mouse_raw_x(0)
    mouse_last_y = device_mouse_raw_y(0)
}
if (obj_gamepad.action[(31 << 0)].pressed && is_in_raid() && player_get_local() != -4 && player_get_state() != gml_Script_scr_player_state_weapon_look && (!gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.HasInputReceiver()))
    scr_create_radial_menu([new RadialOption(gml_Script_scr_gamepad_scripts_quickslot1, undefined, inventory_find_loot("quick slot 1")), new RadialOption(gml_Script_scr_gamepad_scripts_quickslot2, undefined, inventory_find_loot("quick slot 2")), new RadialOption(gml_Script_scr_gamepad_scripts_quickslot3, undefined, inventory_find_loot("quick slot 3")), new RadialOption(gml_Script_scr_gamepad_scripts_quickslot4, undefined, inventory_find_loot("quick slot 4")), new RadialOption(gml_Script_scr_gamepad_scripts_quickslot5, undefined, inventory_find_loot("quick slot 5")), new RadialOption(gml_Script_scr_gamepad_scripts_quickslot6, undefined, inventory_find_loot("quick slot 6"))])
if (obj_gamepad.action[(32 << 0)].pressed && player_get_local() != -4 && player_get_state() != gml_Script_scr_player_state_weapon_look && (!gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.HasInputReceiver()))
{
    var _laser_sprite = undefined
    var _this_laser_container = player_get_local_var("laser_container_array", [])
    var _container_count = array_length(_this_laser_container)
    i = 0
    while (i < _container_count)
    {
        var _icon = _this_laser_container[i].data.att_1.icon
        if ((!is_undefined(_icon)) && _icon >= 0)
        {
            _laser_sprite = _this_laser_container[i].data.att_1.icon
            break
        }
        else
        {
            _icon = _this_laser_container[i].data.att_2.icon
            if ((!is_undefined(_icon)) && _icon >= 0)
            {
                _laser_sprite = _this_laser_container[i].data.att_2.icon
                break
            }
            else
            {
                _icon = _this_laser_container[i].data.att_3.icon
                if ((!is_undefined(_icon)) && _icon >= 0)
                {
                    _laser_sprite = _this_laser_container[i].data.att_3.icon
                    break
                }
                else
                {
                    _icon = _this_laser_container[i].data.att_4.icon
                    if ((!is_undefined(_icon)) && _icon >= 0)
                    {
                        _laser_sprite = _this_laser_container[i].data.att_4.icon
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
            }
        }
    }
    var _torch_sprite = undefined
    var _this_torch_container = player_get_local_var("torch_container_array", [])
    _container_count = array_length(_this_torch_container)
    i = 0
    while (i < _container_count)
    {
        _icon = _this_torch_container[i].data.att_1.icon
        if ((!is_undefined(_icon)) && _icon >= 0)
        {
            _torch_sprite = _this_torch_container[i].data.att_1.icon
            break
        }
        else
        {
            _icon = _this_torch_container[i].data.att_2.icon
            if ((!is_undefined(_icon)) && _icon >= 0)
            {
                _torch_sprite = _this_torch_container[i].data.att_2.icon
                break
            }
            else
            {
                _icon = _this_torch_container[i].data.att_3.icon
                if ((!is_undefined(_icon)) && _icon >= 0)
                {
                    _torch_sprite = _this_torch_container[i].data.att_3.icon
                    break
                }
                else
                {
                    _icon = _this_torch_container[i].data.att_4.icon
                    if ((!is_undefined(_icon)) && _icon >= 0)
                    {
                        _torch_sprite = _this_torch_container[i].data.att_4.icon
                        break
                    }
                    else
                    {
                        i++
                        continue
                    }
                }
            }
        }
    }
    scr_create_radial_menu([new RadialOption(gml_Script_player_action_toggle_laser, _laser_sprite), new RadialOption(gml_Script_player_action_toggle_torch, _torch_sprite), new RadialOption(gml_Script_player_action_toggle_headset, undefined, inventory_find_loot("headset slot")), new RadialOption(gml_Script_player_action_weapon_closeup, 653), new RadialOption(gml_Script_player_action_throw_bolt_spawer, 2090)])
}
