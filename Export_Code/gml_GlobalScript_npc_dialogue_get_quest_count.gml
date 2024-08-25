function npc_dialogue_get_quest_count(argument0) //gml_Script_npc_dialogue_get_quest_count
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return 0;
    if (!argument0.is_a_quest_giver[speaker_get_index(argument0.npc_speaker_id)])
        return 0;
    return array_length(argument0.quest_array);
}

