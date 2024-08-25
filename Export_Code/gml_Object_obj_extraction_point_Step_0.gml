if ((!uscito) && player_exists_local())
{
    if instance_exists(obj_particles_controller)
    {
        var a = (36 << 0)
        part_particles_create(obj_particles_controller.particles_system[a], (x + 8), (y + 8), obj_particles_controller.particles_type[a], 1)
    }
    if (player_distance_local((x + 8), (y + 8)) < minimum_dis_exit && (!player_local_state_is(gml_Script_scr_player_state_inventory)))
    {
        timer_exit++
        if (timer_exit >= timer_exit_max)
        {
            uscito = true
            player_set_local_state(gml_Script_scr_player_state_start)
            if (!instance_exists(obj_exit_screen))
            {
                var eend = instance_create_depth(x, y, -9999, obj_exit_screen)
                eend.survived = true
                eend.factor_survived = 1
            }
            with (obj_camera)
            {
                follow = (1 << 0)
                camera_set_view_size(view_camera[0], 480, 270)
            }
            with (player_get_local().torch_holder)
                instance_destroy()
            obj_controller.alarm[4] = 99999
            global.az_done[(3 << 0)] = true
            instance_destroy()
        }
    }
    else
        timer_exit = 0
}
depth = -9999
