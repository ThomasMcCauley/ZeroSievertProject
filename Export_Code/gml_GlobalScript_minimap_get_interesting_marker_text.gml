function minimap_get_interesting_marker_text(argument0) //gml_Script_minimap_get_interesting_marker_text
{
    return array_get(obj_controller.marker_text, ds_list_find_value(global.list_intresting_id, argument0));
}

