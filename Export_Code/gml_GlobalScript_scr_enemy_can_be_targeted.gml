function scr_enemy_can_be_targeted(argument0) //gml_Script_scr_enemy_can_be_targeted
{
    with (argument0)
    {
        if (target_relation != (1 << 0) && is_in_raid() && visible && image_alpha > 0.1)
            return true;
    }
    return false;
}

