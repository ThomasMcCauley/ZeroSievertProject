function npc_get_prob_grenade_f1(argument0) //gml_Script_npc_get_prob_grenade_f1
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var prob_grenade_f1 = variable_struct_get(_struct, "prob_grenade_f1")
    if (prob_grenade_f1 == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_f1 data")
    prob_grenade_f1 = npc_get_general(argument0, prob_grenade_f1, "prob_grenade_f1")
    return prob_grenade_f1;
}

