var _temp_local_var_2;
function scr_building_list() //gml_Script_scr_building_list
{
    if (area == (3 << 0))
    {
        var _x_array = [126, 126, 192, 60, 60]
        var _y_array = [78, 144, 144, 78, 144]
        var _array_limit = array_length(_x_array)
    }
    else if (area == (7 << 0))
    {
        _x_array = arr_zaton_building_x
        _y_array = arr_zaton_building_y
        _array_limit = array_length(_x_array)
    }
    else
    {
        _x_array = undefined
        _y_array = undefined
        _array_limit = infinity
    }
    var _array_index = 0
    for (var quale_building = 0; quale_building < area_different_building[area]; quale_building++)
    {
        var get_list = area_building_list[area][quale_building]
        var building_amount = area_building_amount[area][quale_building]
        var sprite_w = area_building_w[area][quale_building]
        var sprite_h = area_building_h[area][quale_building]
        var _temp_local_var_2 = 50000
        if (50000 <= 0)
        {
        }
        else
        {
            while (true)
            {
                var _unique_place = false
                if is_array(_x_array)
                    _unique_place = true
                if (area == (3 << 0))
                {
                    if (get_list != list_building_industrial_area_oil && get_list != list_building_industrial_area_general && get_list != list_building_industrial_container)
                        _unique_place = false
                }
                if (_unique_place == true)
                {
                    var xx = _x_array[_array_index]
                    var yy = _y_array[_array_index]
                }
                else
                {
                    xx = irandom(grid_tile_w - 1 - sprite_w)
                    yy = irandom(grid_tile_h - 1 - sprite_h)
                }
                var _off = 1
                var _min = ds_grid_get_min(grid_tile, (xx - _off), (yy - _off), (xx + sprite_w - 1 + _off), (yy + sprite_h - 1 + _off))
                var _max = ds_grid_get_max(grid_tile, (xx - _off), (yy - _off), (xx + sprite_w - 1 + _off), (yy + sprite_h - 1 + _off))
                if (_min != -1 || _max != -1)
                {
                    var _temp_local_var_2 = (50000 - 1)
                    if (50000 - 1)
                        continue
                    break
                }
                else
                {
                    _min = ds_grid_get_min(grid_building, xx, yy, (xx + sprite_w - 1), (yy + sprite_h - 1))
                    _max = ds_grid_get_max(grid_building, xx, yy, (xx + sprite_w - 1), (yy + sprite_h - 1))
                    if (_min != (0 << 0) || _max != (0 << 0))
                    {
                        var _temp_local_var_2 = (50000 - 1)
                        if (50000 - 1)
                            continue
                    }
                    else if ds_grid_value_exists(grid_water, xx, yy, (xx + sprite_w - 1), (yy + sprite_h - 1), -1)
                    {
                        var _temp_local_var_2 = (50000 - 1)
                        if (50000 - 1)
                            continue
                    }
                    else
                    {
                        var offset_b = (area == (3 << 0) ? 0 : 8)
                        var _offset_solid = 2
                        if (offset_b != 0)
                            ds_grid_set_region(grid_building, max(0, (xx - offset_b)), max(0, (yy - offset_b)), (xx + sprite_w - 1 + offset_b), (yy + sprite_h - 1 + offset_b), (2 << 0))
                        if (offset_b != 0)
                            ds_grid_set_region(grid_building, max(0, (xx - _offset_solid)), max(0, (yy - _offset_solid)), (xx + sprite_w - 1 + _offset_solid), (yy + sprite_h - 1 + _offset_solid), (1 << 0))
                        ds_grid_set_region(grid_building, max(0, (xx - 1)), max(0, (yy - 1)), (xx + sprite_w), (yy + sprite_h), (1 << 0))
                        var choose_building = ds_list_find_value(get_list, irandom(ds_list_size(get_list) - 1))
                        building_deserialize(choose_building, xx, yy)
                        var x1 = (xx + (sprite_w div 2)) * 16
                        var y1 = (yy + (sprite_h div 2)) * 16
                        array_push(marker_array, 
                        {
                            x: x1,
                            y: y1,
                            my_id: area_building_marker[area][quale_building]
                        }
)
                        _array_index++
                        building_amount--
                        if (building_amount <= 0)
                        {
                        }
                        else
                        {
                            var _temp_local_var_2 = (50000 - 1)
                            if (50000 - 1)
                                continue
                        }
                    }
                }
            }
        }
    }
}

