function scr_gamepad_apply_deadzone(argument0) //gml_Script_scr_gamepad_apply_deadzone
{
    for (var i = 0; i < (30 << 0); i++)
    {
        if list_of_axis[i]
        {
            argument0[i] = map(abs(argument0[i]), deadzone_inner, deadzone_outer, 0, 1)
            argument0[i] = clamp(argument0[i], 0, 1)
        }
    }
}

