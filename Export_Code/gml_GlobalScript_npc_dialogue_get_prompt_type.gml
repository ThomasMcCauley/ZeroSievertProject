function npc_dialogue_get_prompt_type(argument0, argument1) //gml_Script_npc_dialogue_get_prompt_type
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    var _speaker_index = speaker_get_index(argument0.npc_speaker_id)
    var _type_array = argument0.dia_type[_speaker_index]
    if (argument1 == undefined || argument1 < 0 || argument1 >= array_length(_type_array))
        return "";
    return _type_array[argument1];
}

