function quest_log_get_objective(argument0) //gml_Script_quest_log_get_objective
{
    var _quest_id = quest_log_get_id(argument0)
    if (_quest_id == undefined)
        return "???";
    return __npc_dialogue_get_quest_objective(_quest_id, global.quest_state[argument0], true);
}

