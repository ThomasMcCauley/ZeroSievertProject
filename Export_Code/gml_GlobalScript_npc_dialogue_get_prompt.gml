function npc_dialogue_get_prompt(argument0, argument1) //gml_Script_npc_dialogue_get_prompt
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    var _speaker_index = speaker_get_index(argument0.npc_speaker_id)
    var _text_array = argument0.text[_speaker_index]
    if (argument1 == undefined || argument1 < 0 || argument1 >= array_length(_text_array))
        return "";
    return language_get_string(_text_array[argument1]);
}

