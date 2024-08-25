function player_action_interactable_scroll() //gml_Script_player_action_interactable_scroll
{
    if (ds_list_size(global.list_interact) > 0)
    {
        if (mouse_wheel_up() || obj_gamepad.action[(33 << 0)].pressed)
            global.p_int_instance_id++
        if (mouse_wheel_down() || obj_gamepad.action[(34 << 0)].pressed)
            global.p_int_instance_id--
        global.p_int_instance_id = clamp(global.p_int_instance_id, 0, (ds_list_size(global.list_interact) - 1))
    }
}

