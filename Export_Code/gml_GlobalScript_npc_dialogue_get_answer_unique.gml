function npc_dialogue_get_answer_unique(argument0, argument1) //gml_Script_npc_dialogue_get_answer_unique
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    var _speaker_index = speaker_get_index(argument0.npc_speaker_id)
    var _answer_array_type = argument0.dia_type[_speaker_index]
    var _answer_array = argument0.dia_type_answer[_speaker_index]
    for (var i = 0; i < array_length(_answer_array_type); i++)
    {
        if (argument1 == _answer_array_type[i])
            return _answer_array[i];
    }
    return "...";
}

