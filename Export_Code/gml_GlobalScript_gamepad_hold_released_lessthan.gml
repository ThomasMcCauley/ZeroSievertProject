function gamepad_hold_released_lessthan(argument0, argument1) //gml_Script_gamepad_hold_released_lessthan
{
    if (argument1 == undefined)
        argument1 = obj_gamepad.hold_frames
    return (obj_gamepad.input_released[argument0] && obj_gamepad.input_duration[argument0] < argument1);
}

