function scr_player_quest_trigger_cristallo_viola() //gml_Script_scr_player_quest_trigger_cristallo_viola
{
    if instance_exists(obj_cristallo_viola)
    {
        if (!(global.quest_unique_done[(94 << 0)]))
        {
            var _x = obj_cristallo_viola.x
            var _y = obj_cristallo_viola.y
            if (point_distance(x, y, _x, _y) < global.cristallo_viola_start_dis)
            {
                action = true
                audio_play_sound(snd_cristallo_viola, 10, false)
                scr_draw_npc_text(id, (86 << 0))
                player_set_local_state(gml_Script_scr_player_state_cristallo_viola)
                obj_camera.follow = (4 << 0)
                hspd = 0
                vsdp = 0
                arms_holder = undefined
            }
        }
    }
}

