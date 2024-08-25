function npc_dialogue_quest_populate_task_rewards(argument0) //gml_Script_npc_dialogue_quest_populate_task_rewards
{
    gml_Script_uiFind(uiCurrentRoot(), "reward inventory").gml_Script_uiFind(uiCurrentRoot(), "reward inventory").PopulateTaskRewards(argument0)
}

