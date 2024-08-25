function npc_get_prob_grenade_throw(argument0) //gml_Script_npc_get_prob_grenade_throw
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var prob_grenade_throw = variable_struct_get(_struct, "prob_grenade_throw")
    if (prob_grenade_throw == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_throw data")
    prob_grenade_throw = npc_get_general(argument0, prob_grenade_throw, "prob_grenade_throw")
    return prob_grenade_throw;
}

