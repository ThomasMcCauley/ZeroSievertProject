function item_tracked_get_track_quest_id(argument0, argument1) //gml_Script_item_tracked_get_track_quest_id
{
    var _array = item_tracked_get_array(argument0)
    show_debug_message("here quest" + _array[argument1].questid)
    return _array[argument1].questid;
}

