function npc_get_prob_grenade_cover(argument0) //gml_Script_npc_get_prob_grenade_cover
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var prob_grenade_cover = variable_struct_get(_struct, "prob_grenade_cover")
    if (prob_grenade_cover == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_cover data")
    prob_grenade_cover = npc_get_general(argument0, prob_grenade_cover, "prob_grenade_cover")
    return prob_grenade_cover;
}

