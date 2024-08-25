function player_action_weapon_closeup() //gml_Script_player_action_weapon_closeup
{
    with (player_get_local())
    {
        if (player_get_local_state() != gml_Script_scr_player_state_weapon_look)
        {
            if ((!(player_get_local_var("aiming", false))) && arms_holder == undefined)
            {
                obj_camera.follow = (5 << 0)
                obj_camera.wl_state = (0 << 0)
                weapon_holder.pl_weap_state = (0 << 0)
                weapon_holder.wl_angle_max = irandom_range(-30, 80)
                weapon_holder.wl_off_x_max = irandom_range(-3, 4)
                weapon_holder.wl_off_y_max = irandom_range(-3, 4)
                player_set_local_state(gml_Script_scr_player_state_weapon_look)
                return true;
            }
        }
        return false;
    }
}

