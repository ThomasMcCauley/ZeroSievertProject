function npc_get_general(argument0, argument1, argument2) //gml_Script_npc_get_general
{
    if (argument1 == "{use_preset}")
    {
        if (npc_get_preset(argument0) == "no_preset")
            trace_error("NPC \"", argument0, "\" has {use_preset} on ", argument2, "but has no_preset as preset")
        argument1 = preset_get_value(npc_get_preset(argument0), argument2)
    }
    else
        argument1 = preset_general_get_value(argument2, argument1)
    return argument1;
}

