function scr_quest_create_approach(argument0, argument1, argument2, argument3, argument4) //gml_Script_scr_quest_create_approach
{
    var _quest_id = argument0
    var i = argument1
    global.quest_type[_quest_id][i] = "approach"
    global.quest_amount_now[_quest_id][i] = 0
    global.quest_amount_max[_quest_id][i] = 1
    global.quest_approach_obj[_quest_id][i] = argument2
    global.quest_approach_dis[_quest_id][i] = argument3
    global.quest_approach_map[_quest_id][i] = argument4
}

