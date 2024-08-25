function npc_dialogue_get_question_count(argument0) //gml_Script_npc_dialogue_get_question_count
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return 0;
    var _speaker_index = speaker_get_index(argument0.npc_speaker_id)
    return array_length(argument0.question[_speaker_index]);
}

