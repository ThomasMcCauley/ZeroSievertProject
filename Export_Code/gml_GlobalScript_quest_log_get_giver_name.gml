function quest_log_get_giver_name(argument0) //gml_Script_quest_log_get_giver_name
{
    argument0 = __quest_log_get_true_index(argument0)
    if (argument0 == undefined)
        return undefined;
    var _quest_state = global.quest_state[argument0]
    if (_quest_state == undefined)
        return "???";
    return npc_get_name(_quest_state.giver);
}

