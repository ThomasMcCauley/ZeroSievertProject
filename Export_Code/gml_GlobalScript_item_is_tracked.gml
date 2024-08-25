function item_is_tracked(argument0) //gml_Script_item_is_tracked
{
    return variable_struct_exists(global.item_tracking_dict, argument0);
}

