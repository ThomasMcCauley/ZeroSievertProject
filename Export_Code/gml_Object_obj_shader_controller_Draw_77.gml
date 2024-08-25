var _player = player_get_local()
var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
var draw_normal = true
if (instance_exists(_player) && (!(player_local_state_is(gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera, gml_Script_scr_player_state_dead))))
{
    if is_in_raid()
    {
        var rx = x div 8
        var ry = (y + 8) div 8
        rx = clamp(rx, 1, (obj_map_generator.grid_rw - 1))
        ry = clamp(ry, 1, (obj_map_generator.grid_rh - 1))
        var c = ds_grid_get(obj_map_generator.grid_radiation, rx, ry)
        var difesa_rad = item_armor_get_radiation(_player.armor_now)
        var radiation_ = c - (global.injector_factor[(8 << 0)]) - difesa_rad
        radiation_ = clamp(radiation_, 0, 1000)
        radiation_amount += (radiation_ - 200)
        radiation_amount = clamp(radiation_amount, 0, radiation_)
        var amount = radiation_amount / 600
        amount = clamp(amount, 0, 1)
        if (global.meteo_rain != (10 << 0) && global.meteo_rain != (11 << 0) && global.meteo_rain != (12 << 0))
        {
            if (amount > 0 && (!global.night_vision) && (!(player_local_state_is(gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera))))
            {
                draw_normal = false
                application_surface_draw_enable(false)
                shader_set(shd_radiation)
                shader_set_uniform_f(shader_radiation_time, ((0.00001 * current_time) % 1))
                shader_set_uniform_f(shader_radiation_intensity, amount)
                var a = application_get_position()
                var xscale = (a[2] - a[0]) / surface_get_width(application_surface)
                var yscale = (a[3] - a[1]) / surface_get_height(application_surface)
                draw_surface_ext(application_surface, a[0], a[1], xscale, yscale, 0, c_white, 1)
                shader_reset()
            }
        }
    }
    if (global.night_vision && player_exists_local())
    {
        var _headset_id = _player.headset_now
        if item_exists(_headset_id)
        {
            if (item_headset_get_type(_headset_id) == "night_vision")
            {
                draw_normal = false
                application_surface_draw_enable(false)
                gpu_set_blendenable(false)
                shader_set(shd_night_vision)
                var uni_brightness_amount = shader_get_uniform(shd_night_vision, "brightness_amount")
                shader_set_uniform_f(uni_brightness_amount, item_headset_get_brightness(_headset_id))
                var uni_contrast_amount = shader_get_uniform(shd_night_vision, "contrast_amount")
                shader_set_uniform_f(uni_contrast_amount, item_headset_get_contrast(_headset_id))
                var uni_gamma_amount = shader_get_uniform(shd_night_vision, "gamma_amount")
                shader_set_uniform_f(uni_gamma_amount, item_headset_get_gamma(_headset_id))
                var uni_red_amount = shader_get_uniform(shd_night_vision, "red_amount")
                shader_set_uniform_f(uni_red_amount, item_headset_get_red(_headset_id))
                var uni_green_amount = shader_get_uniform(shd_night_vision, "green_amount")
                shader_set_uniform_f(uni_green_amount, item_headset_get_green(_headset_id))
                var uni_blue_amount = shader_get_uniform(shd_night_vision, "blue_amount")
                shader_set_uniform_f(uni_blue_amount, item_headset_get_blue(_headset_id))
                var uni_grain_time = shader_get_uniform(shd_night_vision, "grain_time")
                shader_set_uniform_f(uni_grain_time, ((0.00001 * current_time) % 1))
                var uni_grain_amount = shader_get_uniform(shd_night_vision, "grain_amount")
                shader_set_uniform_f(uni_grain_amount, item_headset_get_grain(_headset_id))
                a = application_get_position()
                xscale = (a[2] - a[0]) / surface_get_width(application_surface)
                yscale = (a[3] - a[1]) / surface_get_height(application_surface)
                draw_surface_ext(application_surface, a[0], a[1], xscale, yscale, 0, c_white, 1)
                shader_reset()
                gpu_set_blendenable(true)
            }
        }
    }
    if (global.is_emission_now == true)
    {
        if (global.emission_has_shader[global.state_emission_now] == true)
        {
            draw_normal = false
            application_surface_draw_enable(false)
            shader_set(shd_night_vision)
            uni_brightness_amount = shader_get_uniform(shd_night_vision, "brightness_amount")
            shader_set_uniform_f(uni_brightness_amount, global.emission_shader_brightness_now)
            uni_contrast_amount = shader_get_uniform(shd_night_vision, "contrast_amount")
            shader_set_uniform_f(uni_contrast_amount, global.emission_shader_contrast_now)
            uni_gamma_amount = shader_get_uniform(shd_night_vision, "gamma_amount")
            shader_set_uniform_f(uni_gamma_amount, 1)
            uni_red_amount = shader_get_uniform(shd_night_vision, "red_amount")
            shader_set_uniform_f(uni_red_amount, global.emission_shader_red_now)
            uni_green_amount = shader_get_uniform(shd_night_vision, "green_amount")
            shader_set_uniform_f(uni_green_amount, global.emission_shader_green_now)
            uni_blue_amount = shader_get_uniform(shd_night_vision, "blue_amount")
            shader_set_uniform_f(uni_blue_amount, global.emission_shader_blue_now)
            uni_grain_time = shader_get_uniform(shd_night_vision, "grain_time")
            shader_set_uniform_f(uni_grain_time, ((0.00001 * current_time) % 1))
            uni_grain_amount = shader_get_uniform(shd_night_vision, "grain_amount")
            shader_set_uniform_f(uni_grain_amount, 0)
            a = application_get_position()
            xscale = (a[2] - a[0]) / surface_get_width(application_surface)
            yscale = (a[3] - a[1]) / surface_get_height(application_surface)
            draw_surface_ext(application_surface, a[0], a[1], xscale, yscale, 0, c_white, 1)
            shader_reset()
        }
    }
    if (draw_normal == true)
        application_surface_draw_enable(true)
}
if (draw_normal == true)
{
    global.night_vision = false
    application_surface_draw_enable(true)
}
