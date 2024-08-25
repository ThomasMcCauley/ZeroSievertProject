function item_is_tracked_quest(argument0) //gml_Script_item_is_tracked_quest
{
    return variable_struct_exists(global.item_tracking_dict, argument0);
}

