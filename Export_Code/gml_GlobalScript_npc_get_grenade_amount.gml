function npc_get_grenade_amount(argument0) //gml_Script_npc_get_grenade_amount
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var grenade_amount = variable_struct_get(_struct, "grenade_amount")
    if (grenade_amount == undefined)
        trace_error("NPC \"", argument0, "\" has no .grenade_amount data")
    grenade_amount = npc_get_general(argument0, grenade_amount, "grenade_amount")
    if is_array(grenade_amount)
        return grenade_amount[irandom(array_length(grenade_amount) - 1)];
    return grenade_amount;
}

