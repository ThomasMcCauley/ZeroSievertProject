function minimap_get_quest_marker_y(argument0) //gml_Script_minimap_get_quest_marker_y
{
    return ((ds_list_find_value(global.list_obj_marker_y, argument0)) * 4 / 16);
}

