function scr_npc_arms_animation(argument0) //gml_Script_scr_npc_arms_animation
{
    var arms = argument0
    var _patrol = false
    draw_weapon = false
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
                            if scr_chance(20)
                                _patrol = true
                            break
                        case 970:
                            if scr_chance(60)
                                _patrol = true
                            break
                        case 971:
                            if scr_chance(75)
                                _patrol = true
                            break
                        case 972:
                            if scr_chance(0.1)
                                _patrol = true
                            break
                        case 973:
                            break
                        default:
                            break
                    }

                }
            }
        }
    }
    if (_patrol == true)
    {
        draw_weapon = true
        state_finito = true
    }
}

