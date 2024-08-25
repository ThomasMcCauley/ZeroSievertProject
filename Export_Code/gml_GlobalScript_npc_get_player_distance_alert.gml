function npc_get_alert_distance(argument0) //gml_Script_npc_get_alert_distance
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _distance = variable_struct_get(_struct, "player_distance_alert")
    if (_distance == undefined)
        trace_error("NPC \"", argument0, "\" has no .player_distance_alert data")
    _distance = npc_get_general(argument0, _distance, "player_distance_alert")
    return _distance;
}

