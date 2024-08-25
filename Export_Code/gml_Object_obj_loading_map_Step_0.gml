if (obj_map_generator.state == (20 << 0))
{
    alpha_screen -= a_amount
    if (alpha_screen <= 0)
        instance_destroy()
}
player_follow_local()
