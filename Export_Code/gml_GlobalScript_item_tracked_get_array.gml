function item_tracked_get_array(argument0) //gml_Script_item_tracked_get_array
{
    if (!item_is_tracked(argument0))
        return [];
    return variable_struct_get(global.item_tracking_dict, argument0);
}

