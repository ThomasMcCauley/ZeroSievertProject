function player_step_grim_reaper() //gml_Script_player_step_grim_reaper
{
    if (hp <= 0 && (!(player_state_is(mp_index, gml_Script_scr_player_state_dead))))
    {
        hp = -100
        with (obj_mouse)
        {
            item_id_dragged = -4
            dragging = false
            image_index = 4
        }
        aiming = false
        obj_mouse.visible = true
        player_set_state(gml_Script_scr_player_state_dead, mp_index)
        weapon_pointing_direction = 0
        if (!instance_exists(obj_exit_screen))
        {
            if gml_Script_difficulty_get("hardcore_perma_death")
                db_file_delete("shared")
            with (instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -9999, obj_exit_screen))
            {
                survived = false
                factor_survived = 0.5
            }
        }
    }
}

