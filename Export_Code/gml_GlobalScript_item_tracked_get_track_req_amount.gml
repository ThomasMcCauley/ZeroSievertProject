function item_tracked_get_track_req_amount(argument0, argument1) //gml_Script_item_tracked_get_track_req_amount
{
    var _array = item_tracked_get_array(argument0)
    return _array[argument1].item_req_n;
}

