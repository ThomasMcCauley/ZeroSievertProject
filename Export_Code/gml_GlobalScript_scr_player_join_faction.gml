function scr_player_join_faction() //gml_Script_scr_player_join_faction
{
    var camx = camera_get_view_x(view_camera[0])
    var camy = camera_get_view_y(view_camera[0])
    if keyboard_check_pressed(vk_escape)
    {
        player_set_local_state(gml_Script_scr_player_state_talk)
        scr_barra_testo_reset_offset()
        audio_play_sound(snd_ui_click_text_npc, 9, false)
        obj_controller.can_pause = false
    }
    if mouse_check_button_pressed(mb_left)
    {
        if scr_mouse_inside((camx + 24), (camy + 72), 96, 12)
        {
            player_set_local_state(gml_Script_scr_player_state_talk)
            audio_play_sound(snd_ui_click_text_npc, 9, false)
        }
        if (scr_mouse_inside((camx + 24), (camy + 72 + 12), 96, 12) && instance_exists(global.speaker_nearest))
        {
            var _faction_id = npc_get_faction(global.speaker_nearest.npc_id)
            if (faction_joined == -1)
            {
                var _joined = false
                if (ds_grid_get(global.grid_faction, (0 << 0), _faction_id) >= global.faction_joined_min)
                {
                    _joined = true
                    if (_faction_id == (2 << 0))
                    {
                        ds_grid_set(global.grid_faction, (0 << 0), (2 << 0), global.faction_limit_max)
                        ds_grid_set(global.grid_faction, (0 << 0), (3 << 0), 0)
                        ds_grid_set(global.grid_faction, (2 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (2 << 0)))
                        ds_grid_set(global.grid_faction, (3 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (3 << 0)))
                        ds_grid_set(global.grid_faction, (0 << 0), (1 << 0), clamp(ds_grid_get(global.grid_faction, (0 << 0), (1 << 0)), 0, global.faction_max))
                        ds_grid_set(global.grid_faction, (1 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (1 << 0)))
                    }
                    if (_faction_id == (3 << 0))
                    {
                        ds_grid_set(global.grid_faction, (0 << 0), (3 << 0), global.faction_limit_max)
                        ds_grid_set(global.grid_faction, (0 << 0), (2 << 0), 0)
                        ds_grid_set(global.grid_faction, (2 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (2 << 0)))
                        ds_grid_set(global.grid_faction, (3 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (3 << 0)))
                        ds_grid_set(global.grid_faction, (0 << 0), (1 << 0), clamp(ds_grid_get(global.grid_faction, (0 << 0), (1 << 0)), 0, global.faction_max))
                        ds_grid_set(global.grid_faction, (1 << 0), (0 << 0), ds_grid_get(global.grid_faction, (0 << 0), (1 << 0)))
                    }
                }
                if (_joined == false)
                    scr_draw_text_with_box("You need 100 reputation with this faction")
                if (_joined == true)
                {
                    faction_joined = _faction_id
                    player_set_local_state(gml_Script_scr_player_state_move)
                    var _text = language_get_string("You have joined a faction")
                    _text = string_replace(_text, "[FACTION_NAME]", global.faction_name[faction_joined])
                    scr_draw_text_with_box(_text, false)
                }
            }
            else if (faction_joined == _faction_id)
                scr_draw_text_with_box("You have already joined this faction")
            else
                scr_draw_text_with_box("You can not join another faction")
        }
    }
}

