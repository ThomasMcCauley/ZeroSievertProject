function npc_dialogue_get_quest_name(argument0, argument1) //gml_Script_npc_dialogue_get_quest_name
{
    var _id = npc_dialogue_get_quest_id(argument0, argument1)
    if (_id == undefined)
        return "???";
    return language_get_string(variable_struct_get(global.quest_database, _id).name);
}

