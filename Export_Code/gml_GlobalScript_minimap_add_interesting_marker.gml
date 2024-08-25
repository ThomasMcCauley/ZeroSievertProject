function minimap_add_interesting_marker(argument0, argument1, argument2) //gml_Script_minimap_add_interesting_marker
{
    ds_list_add(global.list_intresting_x, argument0)
    ds_list_add(global.list_intresting_y, argument1)
    ds_list_add(global.list_intresting_id, argument2)
}

