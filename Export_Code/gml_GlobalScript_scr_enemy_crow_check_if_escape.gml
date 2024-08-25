function scr_enemy_crow_check_if_escape() //gml_Script_scr_enemy_crow_check_if_escape
{
    target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id))
    if (target != -4)
    {
        hspd = 0
        vspd = 0
        var range = 500
        var dir = irandom_range(45, 135)
        move_point_x = x + (lengthdir_x(range, dir))
        move_point_y = y + (lengthdir_y(range, dir))
        state = "crow_escape"
        var ss = choose(320, 321, 322, 323, 324)
        audio_play_sound_on(emitter_talk, ss, false, 10)
    }
}

