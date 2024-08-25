connected_devices = []
for (var i = 0; i <= 11; i++)
{
    if gamepad_is_connected(i)
        array_push(connected_devices, i)
}
steam_input_init(true)
var _i = 0
array_of_input_systems[_i++] = new GamepadRaw()
input_decimal = array_create((30 << 0))
input_value = array_create((30 << 0))
input_pressed = array_create((30 << 0))
input_released = array_create((30 << 0))
input_duration = array_create((30 << 0))
list_of_axis = array_create((30 << 0), false)
list_of_axis[(14 << 0)] = true
list_of_axis[(15 << 0)] = true
list_of_axis[(16 << 0)] = true
list_of_axis[(17 << 0)] = true
list_of_axis[(19 << 0)] = true
list_of_axis[(21 << 0)] = true
list_of_axis[(22 << 0)] = true
list_of_axis[(23 << 0)] = true
list_of_axis[(24 << 0)] = true
list_of_axis[(26 << 0)] = true
deadzone_inner = global.gamepad_data.gamepad.gamepad_joystick_inner_deadzone
deadzone_outer = global.gamepad_data.gamepad.gamepad_joystick_outer_deadzone
axis_pressed_value = 0.8
hold_frames = global.gamepad_data.gamepad.frames_for_hold_trigger
global.is_steamdeck = false
steam_gamepad_ids = steam_input_get_connected_controllers()
gamepad_manufacturer = scr_gamepad_get_glyph_index()
last_input_keyboard = true
number_of_gamepads_connected = 0
function ActionData_gml_Object_obj_gamepad_Create_0() constructor //gml_Script_ActionData_gml_Object_obj_gamepad_Create_0
{
    decimal = false
    value = false
    pressed = false
    released = false
    duration = false
}

action = array_create((38 << 0))
for (i = 0; i < (38 << 0); i++)
    action[i] = new ActionData()
array_create((38 << 0), (28 << 0))
lookup_action_to_input[(0 << 0)] = (14 << 0)
lookup_action_to_input[(1 << 0)] = (15 << 0)
lookup_action_to_input[(2 << 0)] = (17 << 0)
lookup_action_to_input[(3 << 0)] = (16 << 0)
lookup_action_to_input[(4 << 0)] = (18 << 0)
lookup_action_to_input[(5 << 0)] = (12 << 0)
lookup_action_to_input[(27 << 0)] = (7 << 0)
lookup_action_to_input[(6 << 0)] = (0 << 0)
lookup_action_to_input[(7 << 0)] = (2 << 0)
lookup_action_to_input[(8 << 0)] = (28 << 0)
lookup_action_to_input[(9 << 0)] = (28 << 0)
lookup_action_to_input[(10 << 0)] = (10 << 0)
lookup_action_to_input[(11 << 0)] = (11 << 0)
lookup_action_to_input[(12 << 0)] = (28 << 0)
lookup_action_to_input[(13 << 0)] = (25 << 0)
lookup_action_to_input[(14 << 0)] = (1 << 0)
lookup_action_to_input[(15 << 0)] = (28 << 0)
lookup_action_to_input[(16 << 0)] = (28 << 0)
lookup_action_to_input[(17 << 0)] = (28 << 0)
lookup_action_to_input[(18 << 0)] = (28 << 0)
lookup_action_to_input[(19 << 0)] = (28 << 0)
lookup_action_to_input[(20 << 0)] = (28 << 0)
lookup_action_to_input[(21 << 0)] = (28 << 0)
lookup_action_to_input[(22 << 0)] = (28 << 0)
lookup_action_to_input[(23 << 0)] = (28 << 0)
lookup_action_to_input[(24 << 0)] = (28 << 0)
lookup_action_to_input[(25 << 0)] = (2 << 0)
lookup_action_to_input[(26 << 0)] = (2 << 0)
lookup_action_to_input[(28 << 0)] = (5 << 0)
lookup_action_to_input[(29 << 0)] = (2 << 0)
lookup_action_to_input[(30 << 0)] = (2 << 0)
lookup_action_to_input[(32 << 0)] = (4 << 0)
lookup_action_to_input[(31 << 0)] = (6 << 0)
lookup_action_to_input[(33 << 0)] = (8 << 0)
lookup_action_to_input[(34 << 0)] = (9 << 0)
lookup_action_to_input[(35 << 0)] = (10 << 0)
lookup_action_to_input[(36 << 0)] = (11 << 0)
lookup_action_to_input[(37 << 0)] = (1 << 0)
function reset_action_gml_Object_obj_gamepad_Create_0(argument0) //gml_Script_reset_action_gml_Object_obj_gamepad_Create_0
{
    action[argument0].decimal = false
    action[argument0].value = false
    action[argument0].pressed = false
    action[argument0].released = false
    action[argument0].duration = false
}

smoothing = global.gamepad_data.gamepad.radial_smoothing
goto_x = window_get_width() / 2
goto_y = window_get_height() / 2
goto_last_x = window_get_width() / 2
goto_last_y = window_get_height() / 2
mouse_last_x = device_mouse_raw_x(0)
mouse_last_y = device_mouse_raw_x(0)
aim_assist_override_angle = 0
aim_assist_override_distance = 0
gamepad_glyphs = array_create((30 << 0))
function gamepad_glyph_set_gml_Object_obj_gamepad_Create_0(argument0, argument1, argument2, argument3) constructor //gml_Script_gamepad_glyph_set_gml_Object_obj_gamepad_Create_0
{
    standard = argument0
    outline = argument1
    pressed = argument2
    pressed_outline = argument3
}

gamepad_glyphs[(0 << 0)] = new gamepad_glyph_set(2129, 568, 774, 730)
gamepad_glyphs[(1 << 0)] = new gamepad_glyph_set(2130, 2240, 2117, 2188)
gamepad_glyphs[(2 << 0)] = new gamepad_glyph_set(2236, 2139, 2165, 1571)
gamepad_glyphs[(3 << 0)] = new gamepad_glyph_set(2191, 2215, 2200, 2239)
gamepad_glyphs[(4 << 0)] = new gamepad_glyph_set(2131, 17, 2180, 2209)
gamepad_glyphs[(5 << 0)] = new gamepad_glyph_set(747, 1551, 1221, 847)
gamepad_glyphs[(6 << 0)] = new gamepad_glyph_set(2227, 1771, 2174, 1269)
gamepad_glyphs[(7 << 0)] = new gamepad_glyph_set(4, 775, 73, 449)
gamepad_glyphs[(8 << 0)] = new gamepad_glyph_set(2147, 2206, 1783, 2110)
gamepad_glyphs[(9 << 0)] = new gamepad_glyph_set(2169, 1089, 2115, 687)
gamepad_glyphs[(10 << 0)] = new gamepad_glyph_set(1609, 136, 442, 514)
gamepad_glyphs[(11 << 0)] = new gamepad_glyph_set(1487, 1473, 2214, 2146)
gamepad_glyphs[(12 << 0)] = new gamepad_glyph_set(1942, 1262, 2124, 257)
gamepad_glyphs[(13 << 0)] = new gamepad_glyph_set(245, 2111, 2152, 497)
gamepad_glyphs[(28 << 0)] = new gamepad_glyph_set(245, 2111, 2152, 497)
alarm[0] = 211
