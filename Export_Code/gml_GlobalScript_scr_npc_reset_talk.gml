function scr_npc_reset_talk(argument0, argument1) //gml_Script_scr_npc_reset_talk
{
    if (argument0 == undefined)
        argument0 = false
    if (argument1 == undefined)
        argument1 = 120
    can_talk = false
    can_talk_reset = argument0
    can_talk_reset_timer_max = argument1
    can_talk_reset_timer = 0
}

