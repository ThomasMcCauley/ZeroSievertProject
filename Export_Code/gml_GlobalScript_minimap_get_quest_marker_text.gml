function minimap_get_quest_marker_text(argument0) //gml_Script_minimap_get_quest_marker_text
{
    return variable_struct_get(global.quest_database, ds_list_find_value(global.list_obj_marker_quest_id, argument0)).name;
}

