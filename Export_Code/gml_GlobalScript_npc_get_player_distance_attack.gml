function npc_get_player_distance_attack(argument0) //gml_Script_npc_get_player_distance_attack
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _value = variable_struct_get(_struct, "player_distance_attack")
    if (_value == undefined)
        trace_error("NPC \"", argument0, "\" has no .player_distance_attack data")
    _value = npc_get_general(argument0, _value, "player_distance_attack")
    return _value;
}

