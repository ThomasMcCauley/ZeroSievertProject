function minimap_get_extraction_marker_y(argument0) //gml_Script_minimap_get_extraction_marker_y
{
    return ((ds_list_find_value(global.list_extraction_y, argument0)) * 4 / 16);
}

