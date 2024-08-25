function item_tracked_get_array_length(argument0) //gml_Script_item_tracked_get_array_length
{
    if (!item_is_tracked(argument0))
        return 0;
    return array_length(variable_struct_get(global.item_tracking_dict, argument0));
}

