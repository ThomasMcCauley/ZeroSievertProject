function minimap_remove_custom_marker(argument0) //gml_Script_minimap_remove_custom_marker
{
    var _index = ds_list_find_index(global.list_minimap_marker_id, argument0)
    if (_index < 0)
        return;
    ds_list_delete(global.list_minimap_marker_x, _index)
    ds_list_delete(global.list_minimap_marker_y, _index)
    ds_list_delete(global.list_minimap_marker_id, _index)
    var _minimap = gml_Script_uiFindRelaxed(uiLayerGetRoot("pda layer"), "minimap scroll box")
    if (_minimap != undefined)
    {
        var _array = gml_Script_uiFindAllType(_minimap, "class_ui_minimap_custom_marker")
        var _i = 0
        repeat array_length(_array)
        {
            var _marker = _array[_i]
            if (_marker.markerID == argument0)
            {
                uiDestroy(_marker)
                break
            }
            else
                _i++
        }
    }
}

