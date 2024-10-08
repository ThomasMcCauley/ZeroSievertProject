function faction_join(argument0) //gml_Script_faction_join
{
    switch argument0
    {
        case "Green Army":
            if (faction_get_rep("Player", "Green Army") >= 450)
            {
                if (global.faction_joined == "")
                {
                    global.faction_joined = "Green Army"
                    quest_assign_new("leader_faction1", "find_convoy_ga")
                    with (obj_leader_faction1)
                        alarm[10] = 1
                    player_set_local_state(gml_Script_scr_player_state_move)
                    scr_draw_text_with_box("You've enlisted with the Green Army")
                }
                else
                {
                    if (global.faction_joined == "Green Army")
                        scr_draw_text_with_box("You have already enlisted with the Green Army")
                    if (global.faction_joined == "Crimson Corporation")
                        scr_draw_text_with_box("You have already joined the Crimson Corporation")
                }
            }
            else
                scr_draw_text_with_box((language_get_string("Minimum required reputation")) + ": " + string(450))
            break
        case "Crimson Corporation":
            if (faction_get_rep("Player", "Crimson Corporation") >= 450)
            {
                if (global.faction_joined == "")
                {
                    global.faction_joined = "Crimson Corporation"
                    quest_assign_new("leader_crimson_base", "cctv_camera")
                    with (obj_leader_faction2)
                        alarm[10] = 1
                    player_set_local_state(gml_Script_scr_player_state_move)
                    scr_draw_text_with_box("You've joined the Crimson Corporation")
                }
                else
                {
                    if (global.faction_joined == "Green Army")
                        scr_draw_text_with_box("You have already enlisted with the Green Army")
                    if (global.faction_joined == "Crimson Corporation")
                        scr_draw_text_with_box("You have already joined the Crimson Corporation")
                }
            }
            else
                scr_draw_text_with_box((language_get_string("Minimum required reputation")) + ": " + string(450))
            break
    }

    return true;
}

