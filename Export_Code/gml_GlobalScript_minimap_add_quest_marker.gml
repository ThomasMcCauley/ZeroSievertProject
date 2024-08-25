function minimap_add_quest_marker(argument0, argument1, argument2, argument3, argument4) //gml_Script_minimap_add_quest_marker
{
    ds_list_add(global.list_obj_marker_x, argument0)
    ds_list_add(global.list_obj_marker_y, argument1)
    ds_list_add(global.list_obj_marker_quest_pos, argument2)
    ds_list_add(global.list_obj_marker_quest_id, argument3)
    ds_list_add(global.list_obj_marker_sub, argument4)
}

