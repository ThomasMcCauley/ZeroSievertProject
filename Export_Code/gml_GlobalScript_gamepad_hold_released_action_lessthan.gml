function gamepad_hold_released_action_lessthan(argument0, argument1) //gml_Script_gamepad_hold_released_action_lessthan
{
    if (argument1 == undefined)
        argument1 = obj_gamepad.hold_frames
    return (obj_gamepad.action[argument0].released && obj_gamepad.action[argument0].duration < argument1);
}

