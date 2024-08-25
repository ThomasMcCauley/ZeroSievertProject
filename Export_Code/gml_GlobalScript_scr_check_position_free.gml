function scr_check_position_free(argument0, argument1) //gml_Script_scr_check_position_free
{
    var _x = argument0 div 16
    var _y = argument1 div 16
    var _ret = false
    if is_in_raid()
    {
        if (ds_grid_get(obj_controller.grid_motion, _x, _y) == 0)
            _ret = true
        else
            _ret = false
    }
    else
        _ret = true
    return _ret;
}

