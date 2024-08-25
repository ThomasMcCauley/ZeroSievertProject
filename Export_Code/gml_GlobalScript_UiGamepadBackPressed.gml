function UiGamepadBackPressed() //gml_Script_UiGamepadBackPressed
{
    return (obj_gamepad.action[(37 << 0)].pressed || obj_gamepad.input_pressed[(12 << 0)] || keyboard_check_pressed(vk_escape));
}

