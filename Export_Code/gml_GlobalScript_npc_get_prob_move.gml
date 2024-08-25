function npc_get_prob_move(argument0) //gml_Script_npc_get_prob_move
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "prob_move")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .prob_move data")
    _value = npc_get_general(argument0, _value, "prob_move")
    return _value;
}

