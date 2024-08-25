function npc_get_alert_visual_distance(argument0) //gml_Script_npc_get_alert_visual_distance
{
    var _struct = variable_struct_get(global.npc_data, argument0)
    if (!is_struct(_struct))
        trace_error("NPC \"", argument0, "\" not recognised")
    var _distance = variable_struct_get(_struct, "alert_visual_distance")
    if (_distance == undefined)
        trace_error("NPC \"", argument0, "\" has no .alert_visual_distance data")
    _distance = npc_get_general(argument0, _distance, "alert_visual_distance")
    return _distance;
}

