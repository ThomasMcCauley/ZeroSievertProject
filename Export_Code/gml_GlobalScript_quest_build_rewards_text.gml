function quest_build_rewards_text(argument0, argument1) //gml_Script_quest_build_rewards_text
{
    var _quest_name = npc_dialogue_get_quest_id(argument0, argument1)
    var _text = language_get_string("Exp") + ": " + (string(variable_struct_get(global.quest_database, _quest_name).experience))
    _text = _text + " / " + language_get_string("Rep") + ": " + (string(variable_struct_get(global.quest_database, _quest_name).reputation)) + "\n"
    _text = _text + language_get_string("Reward") + ": " + (string(variable_struct_get(global.quest_database, _quest_name).money)) + " " + language_get_string("Roubles")
    return _text;
}

