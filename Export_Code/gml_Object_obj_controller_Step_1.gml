if ((!instance_exists(obj_editor)) && player_exists_local())
{
    with (player_get_local())
    {
        global.status_state_now[(0 << 0)] = scr_get_status_state((0 << 0), fatigue)
        global.status_state_now[(1 << 0)] = scr_get_status_state((1 << 0), energy)
        global.status_state_now[(2 << 0)] = scr_get_status_state((1 << 0), thirst)
        global.status_state_now[(3 << 0)] = scr_get_status_state((3 << 0), radiation_accumulata)
        ds_list_clear(global.list_status_id)
        for (var i = 0; i < array_length(global.status_id); i++)
            ds_list_add(global.list_status_id, i)
        lista_skill_factor()
        var oo = (0 << 0)
        switch global.status_state_now[oo]
        {
            case (0 << 0):
                break
            case (1 << 0):
                break
            case (2 << 0):
                global.sk_k[(6 << 0)] += global.status_f1[oo][(2 << 0)]
                break
            case (3 << 0):
                global.sk_k[(6 << 0)] += global.status_f1[oo][(3 << 0)]
                break
            case (4 << 0):
                global.sk_k[(6 << 0)] += global.status_f1[oo][(4 << 0)]
                break
            default:

        }

        oo = (1 << 0)
        switch global.status_state_now[oo]
        {
            case (0 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(0 << 0)]
                break
            case (1 << 0):
                break
            case (2 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(2 << 0)]
                break
            case (3 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(3 << 0)]
                break
            case (4 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(4 << 0)]
                break
        }

        oo = (2 << 0)
        switch global.status_state_now[oo]
        {
            case (0 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(0 << 0)]
                break
            case (1 << 0):
                break
            case (2 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(2 << 0)]
                break
            case (3 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(3 << 0)]
                break
            case (4 << 0):
                global.sk_k[(1 << 0)] += global.status_f1[oo][(4 << 0)]
                break
        }

        oo = (3 << 0)
        var chance_bleed = 0.027777777777777776
        var chance_vomito = 0.009259259259259259
        var chance_dead = 0.002777777777777778
        switch global.status_state_now[oo]
        {
            case (0 << 0):
                break
            case (1 << 0):
                break
            case (2 << 0):
                if scr_chance(chance_bleed)
                {
                    bleed += 1
                    scr_draw_npc_text(id, (36 << 0))
                }
                break
            case (3 << 0):
                if scr_chance(chance_bleed * 1.5)
                {
                    bleed += 1
                    scr_draw_npc_text(id, (36 << 0))
                }
                if scr_chance(chance_vomito)
                {
                    energy -= 25
                    thirst -= 35
                    scr_draw_npc_text(id, (35 << 0))
                }
                break
            case (4 << 0):
                if scr_chance(chance_bleed * 2)
                    bleed += 1
                if scr_chance(chance_vomito * 1.5)
                {
                    energy -= 25
                    thirst -= 35
                    scr_draw_npc_text(id, (35 << 0))
                }
                if scr_chance(chance_dead)
                {
                    if is_in_raid()
                        player_damage_local(infinity)
                }
                break
            default:

        }

        if player_local_state_is(gml_Script_scr_player_state_move)
        {
            check_max_weight_timer++
            if (check_max_weight_timer >= 30)
            {
                check_max_weight_timer = 0
                inventory_check_weight()
            }
        }
        else
            check_max_weight_timer = 28
    }
}
