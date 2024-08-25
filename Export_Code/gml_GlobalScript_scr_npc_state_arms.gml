function scr_npc_state_arms(argument0) //gml_Script_scr_npc_state_arms
{
    var arms = argument0
    var patrol = false
    draw_weapon = false
    if scr_chance(0.2)
    {
        if (target_for_image_scale > x)
            target_for_image_scale = x - 2
        else
            target_for_image_scale = x + 2
    }
    var my_id_ = id
    if instance_exists(arms)
    {
        with (arms)
        {
            if (linked_id == my_id_)
            {
                if (image_index > (sprite_get_number(sprite_index) - 2))
                {
                    switch arms
                    {
                        case 969:
                            if scr_chance(5)
                                patrol = true
                            break
                        case 970:
                            if is_in_hub()
                            {
                                if (distance_to_object(obj_bancone_hub) < 16)
                                {
                                    if scr_chance(0.7)
                                    {
                                        patrol = true
                                        my_id_.path_timer = 300
                                        my_id_.state = "human_go_to_original_position"
                                        my_id_.draw_weapon = true
                                    }
                                }
                                else if scr_chance(2)
                                    patrol = true
                            }
                            else if scr_chance(2)
                                patrol = true
                            break
                        case 971:
                            if is_in_hub()
                            {
                                if (distance_to_object(obj_bancone_hub) < 16)
                                {
                                    if scr_chance(0.7)
                                    {
                                        patrol = true
                                        my_id_.path_timer = 300
                                        my_id_.state = "human_go_to_original_position"
                                        my_id_.draw_weapon = true
                                    }
                                }
                                else if scr_chance(2)
                                    patrol = true
                            }
                            else if scr_chance(2)
                                patrol = true
                            break
                        case 972:
                            if scr_chance(0.1)
                                patrol = true
                            break
                        case 973:
                            break
                    }

                }
            }
        }
    }
    if (patrol == true)
    {
        my_id_.draw_weapon = true
        if is_in_hub()
            my_id_.state = "human_hub_general"
        else
            my_id_.state = "human_patrol"
    }
    target = scr_find_target_for_human()
    if (target != -4)
    {
        switch target_relation
        {
            case (2 << 0):
                hspd = 0
                vspd = 0
                state = "human_shoot"
                draw_weapon = true
                break
            case (0 << 0):
                if (arms != 972 && arms != 973)
                {
                    hspd = 0
                    vspd = 0
                    state = "human_aim_neutral_target"
                    draw_weapon = true
                }
                break
            case (1 << 0):
                break
        }

    }
}

