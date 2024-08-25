function player_step_personal_stats() //gml_Script_player_step_personal_stats
{
    if is_nan(stamina)
        stamina = 0
    if (!instance_exists(obj_exit_screen))
    {
        if (global.sk_lvl[(21 << 0)] >= 0 && energy >= 50 && thirst >= 50)
        {
            global.sk_k[(38 << 0)] = 10 + 2 * (global.sk_lvl[(21 << 0)])
            global.sk_k[(39 << 0)] = 15 + 2 * (global.sk_lvl[(21 << 0)])
        }
        stamina_max_total = 100 + (global.sk_k[(0 << 0)]) + (global.sk_k[(39 << 0)]) + (global.injector_factor[(4 << 0)])
        stamina += (0.18 * (global.sk_k[(6 << 0)]) + (global.injector_factor[(5 << 0)]))
        if (!(player_state_is(mp_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
            fatigue -= 0.0005138888888888889
        fatigue = clamp(fatigue, fatigue_max, fatigue_start)
        stamina_max = clamp((stamina_max_total + (min(0, fatigue))), 0, stamina_max_total)
        stamina = clamp(stamina, 0, stamina_max)
        wound = clamp(wound, 0, 40)
        bleed -= global.injector_factor[(2 << 0)]
        if (global.injector_factor[(3 << 0)] > 0)
            bleed = 0
        if (bleed <= 0.1)
            bleed = 0
        bleed = clamp(bleed, 0, 3)
        hp_regen = global.injector_factor[(1 << 0)]
        hp_max_total = ceil(gml_Script_difficulty_get("pro_player_health") + (global.sk_k[(43 << 0)]) + (global.sk_k[(38 << 0)]) + (global.injector_factor[(0 << 0)]))
        var _bleed_amount = ((arms_holder != undefined && item_get_category(arms_holder.item_id) == "medication") ? 0 : bleed)
        hp -= (ceil(_bleed_amount) * 0.02)
        hp += (hp_regen + (global.sk_k[(46 << 0)]))
        hp_max = hp_max_total - wound
        hp_max = clamp(hp_max, 0, (hp_max_total - wound))
        hp = clamp(hp, (is_in_hub() ? 10 : 0), hp_max)
        var difesa_rad = item_armor_get_radiation(armor_now)
        if (room == room1)
        {
            var rx = clamp((x div 8), 1, (obj_map_generator.grid_rw - 2))
            var ry = clamp(((y + 8) div 8), 1, (obj_map_generator.grid_rh - 2))
            radiation_nella_pos_attuale = (ds_grid_get(obj_map_generator.grid_radiation, rx, ry)) - difesa_rad
        }
        else
            radiation_nella_pos_attuale = 0
        var _radiation_delta = radiation_nella_pos_attuale / 216000
        _radiation_delta = clamp(_radiation_delta, 0, 1000)
        radiation += _radiation_delta
        radiation_accumulata += _radiation_delta
        radiation_accumulata -= global.injector_factor[(7 << 0)]
        radiation_accumulata = clamp(radiation_accumulata, 0, global.status_value_max[(3 << 0)])
        if is_in_raid()
        {
            rx = clamp((x div 8), 1, (obj_map_generator.grid_rw - 2))
            ry = clamp(((y + 8) div 8), 1, (obj_map_generator.grid_rh - 2))
            player_play_radiation_sound((ds_grid_get(obj_map_generator.grid_radiation, rx, ry)) - ((global.injector_factor[(8 << 0)]) + difesa_rad))
        }
        if ((!is_in_hub()) && (!(player_state_is(mp_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera))))
        {
            energy -= (0.0005 * (global.sk_k[(52 << 0)]) * gml_Script_difficulty_get("pro_hunger_thirst_rate") - (global.injector_factor[(10 << 0)]))
            thirst -= (0.0006666666666666666 * (global.sk_k[(53 << 0)]) * gml_Script_difficulty_get("pro_hunger_thirst_rate") - (global.injector_factor[(12 << 0)]))
        }
        for (var i = 0; i < array_length_1d(global.sk_id); i++)
        {
            var get_id = global.sk_id[i]
            if (global.sk_lvl[get_id] != -1)
                global.sk_lvl[get_id] = clamp(global.sk_lvl[get_id], 0, (global.sk_lvl_max[get_id] + 0.001))
        }
        if (hp < 20 && (!(player_state_is(mp_index, gml_Script_scr_player_state_dead))))
        {
            if (!audio_is_playing(snd_heart))
                audio_play_sound(snd_heart, 2, false)
        }
    }
    energy = clamp(energy, 0, 100)
    thirst = clamp(thirst, 0, 100)
}

