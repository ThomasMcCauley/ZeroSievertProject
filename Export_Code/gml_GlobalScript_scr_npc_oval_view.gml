function scr_npc_oval_view(argument0, argument1) //gml_Script_scr_npc_oval_view
{
    var _min = variable_struct_get(global.npc_preset, "general").alert_visual_distance_h
    var _distance_max = argument0
    if (argument1 >= 0 && argument1 < 90)
        argument0 = lerp(_min, _distance_max, (1 - argument1 / 90))
    if (argument1 >= 90 && argument1 < 180)
        argument0 = lerp(_min, _distance_max, ((argument1 - 90) / 90))
    if (argument1 >= 180 && argument1 < 270)
        argument0 = lerp(_min, _distance_max, (1 - (argument1 - 180) / 90))
    if (argument1 >= 270 && argument1 < 360)
        argument0 = lerp(_min, _distance_max, ((argument1 - 270) / 90))
    return argument0;
}

