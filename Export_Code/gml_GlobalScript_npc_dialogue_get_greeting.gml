function npc_dialogue_get_greeting(argument0) //gml_Script_npc_dialogue_get_greeting
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    return language_get_string(argument0.text_hello[speaker_get_index(argument0.npc_speaker_id)]);
}

