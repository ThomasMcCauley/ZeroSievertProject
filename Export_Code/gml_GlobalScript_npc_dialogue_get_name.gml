function npc_dialogue_get_name(argument0) //gml_Script_npc_dialogue_get_name
{
    if (argument0 == undefined || (!instance_exists(argument0)))
        return "";
    return language_get_string(argument0.npc_name);
}

