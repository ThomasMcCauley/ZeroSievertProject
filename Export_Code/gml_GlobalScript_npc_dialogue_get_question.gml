function npc_dialogue_get_question(argument0, argument1) //gml_Script_npc_dialogue_get_question
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    var _speaker_index = speaker_get_index(argument0.npc_speaker_id)
    var _question_array = argument0.question[_speaker_index]
    if (argument1 == undefined || argument1 < 0 || argument1 >= array_length(_question_array))
        return "";
    return language_get_string(_question_array[argument1]);
}

