function bullet_can_collide_with_player(argument0, argument1) //gml_Script_bullet_can_collide_with_player
{
    if (!instance_exists(argument1))
        return false;
    if (player_get_hp(argument1.mp_index) > 0)
    {
        if (!(player_state_is(argument1.mp_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
        {
            if (argument0.shooter_faction != argument1.faction)
                return true;
        }
    }
    return false;
}

