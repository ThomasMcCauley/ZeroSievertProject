function npc_get_prob_grenade_rgd(argument0) //gml_Script_npc_get_prob_grenade_rgd
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var prob_grenade_rgd = variable_struct_get(_struct, "prob_grenade_rgd")
    if (prob_grenade_rgd == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_rgd data")
    prob_grenade_rgd = npc_get_general(argument0, prob_grenade_rgd, "prob_grenade_rgd")
    return prob_grenade_rgd;
}

