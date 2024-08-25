function item_tracked_get_track_craft_item(argument0, argument1) //gml_Script_item_tracked_get_track_craft_item
{
    var _array = item_tracked_get_array(argument0)
    var _return = _array[argument1].item_get
    if (_return == undefined)
        return "Cannot find item";
    return _return;
}

