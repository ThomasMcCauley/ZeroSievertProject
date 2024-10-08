var _array;
function scr_enemy_change_cover_2() //gml_Script_scr_enemy_change_cover_2
{
    var list_x = ds_list_create()
    var list_y = ds_list_create()
    var ww_max = 10
    var ww = 2
    _array[0] = 0
    _array[1] = 0
    var w1 = 16
    var x_p = x div w1
    var y_p = y div w1
    var x_s = x_p - ww / 2
    var y_s = y_p - ww / 2
    var pos_found = 0
    var pos_found_max = 20
    repeat (ww_max div 2)
    {
        if (pos_found < pos_found_max)
        {
            ww += 2
            x_s = x_p - ww / 2
            y_s = y_p - ww / 2
            for (var xx = 0; xx < ww; xx++)
            {
                for (var yy = 0; yy < ww; yy++)
                {
                    if (ds_grid_get(obj_controller.grid_motion, (x_s + xx), (y_s + yy)) == 0)
                    {
                        var check_x = (x_s + xx) * w1
                        var check_y = (y_s + yy) * w1
                        var near_solid = instance_nearest(check_x, check_y, obj_solid)
                        var can_be_added = false
                        with (near_solid)
                        {
                            if (distance_to_point(check_x, check_y) < 24 && distance_to_point(check_x, check_y) > 7)
                                can_be_added = true
                        }
                        if (can_be_added == true)
                        {
                            if (point_distance(check_x, check_y, x, y) > 128)
                            {
                                if (!(instance_line_of_sight(check_x, check_y, target)))
                                {
                                    ds_list_add(list_y, check_y)
                                    ds_list_add(list_x, check_x)
                                    pos_found++
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (pos_found > 0)
    {
        var list_size = ds_list_size(list_x)
        var choose_pos = irandom(list_size - 1)
        _array[0] = ds_list_find_value(list_x, choose_pos)
        _array[1] = ds_list_find_value(list_y, choose_pos)
    }
    ds_list_destroy(list_x)
    ds_list_destroy(list_y)
    return _array;
}

