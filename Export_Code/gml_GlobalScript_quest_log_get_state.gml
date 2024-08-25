function quest_log_get_state(argument0) //gml_Script_quest_log_get_state
{
    argument0 = __quest_log_get_true_index(argument0)
    if (argument0 == undefined)
        return undefined;
    return global.quest_state[argument0].state;
}

