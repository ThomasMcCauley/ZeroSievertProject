player_follow_local()
depth = 160
switch state
{
    case (19 << 0):
        if (keyboard_check_released(vk_anykey) || mouse_check_button_released(mb_any) || obj_gamepad.input_released[(29 << 0)])
        {
            state = (20 << 0)
            settings_apply("master volume")
            obj_meteo_controller.alarm[0] = obj_meteo_controller.change_meteo_time
            obj_meteo_controller.alarm[2] = global.emission_min_timer
        }
        break
    case (20 << 0):
        break
}

if global.general_debug
{
    if (debug == true)
    {
        if keyboard_check_pressed(vk_up)
            alarm[2] = 1
    }
    if (keyboard_check_pressed(vk_f6) && keyboard_check(vk_f5))
    {
        if (!instance_exists(obj_camera_test))
            instance_create_depth(x, y, (-y), obj_camera_test)
        else
        {
            with (obj_camera_test)
                instance_destroy()
        }
    }
}
