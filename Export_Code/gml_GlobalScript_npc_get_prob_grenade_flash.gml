function npc_get_prob_grenade_flash(argument0) //gml_Script_npc_get_prob_grenade_flash
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var prob_grenade_flash = variable_struct_get(_struct, "prob_grenade_flash")
    if (prob_grenade_flash == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_grenade_flash data")
    prob_grenade_flash = npc_get_general(argument0, prob_grenade_flash, "prob_grenade_flash")
    return prob_grenade_flash;
}

