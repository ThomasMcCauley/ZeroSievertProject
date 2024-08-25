function npc_dialogue_map_get_name(argument0) //gml_Script_npc_dialogue_map_get_name
{
    if (!instance_exists(obj_controller))
        return "???";
    return obj_controller.map_nome[argument0];
}

