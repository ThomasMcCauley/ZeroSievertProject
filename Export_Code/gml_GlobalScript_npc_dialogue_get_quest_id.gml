function npc_dialogue_get_quest_id(argument0, argument1) //gml_Script_npc_dialogue_get_quest_id
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return undefined;
    if (argument1 < 0 || argument1 >= array_length(argument0.quest_array))
        return undefined;
    var _quest = argument0.quest_array[argument1]
    return (_quest == "" ? undefined : _quest);
}

