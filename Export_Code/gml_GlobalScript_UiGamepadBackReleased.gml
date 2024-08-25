function UiGamepadBackReleased() //gml_Script_UiGamepadBackReleased
{
    return (obj_gamepad.action[(37 << 0)].released || obj_gamepad.input_released[(12 << 0)] || keyboard_check_released(vk_escape));
}

