alarm[7] = 1800
if is_in_raid()
{
    if instance_exists(obj_map_generator)
    {
        if (obj_map_generator.area == (6 << 0))
        {
            if player_get_local()
            {
                var _px = player_get_local().x
                var _py = player_get_local().y
                var _player_is_near = false
                var _pos_disp = array_length_1d(global.mall_spawn_id)
                for (var i = 0; i < _pos_disp; i++)
                {
                    _dis[i] = point_distance(_px, _py, global.mall_spawn_x[i], global.mall_spawn_y[i])
                    if (_dis[i] < 240)
                        _player_is_near = true
                }
                if (_player_is_near == true)
                {
                    var _list_spawn = ds_list_create()
                    for (i = 0; i < array_length_1d(global.spmall_obj); i++)
                    {
                        if (global.spmall_only_begin[i] == false)
                        {
                            repeat global.spmall_chance[i]
                                ds_list_add(_list_spawn, i)
                        }
                    }
                    if scr_chance(70)
                    {
                        var _list_pos = ds_list_create()
                        for (i = 0; i < _pos_disp; i++)
                        {
                            if (_dis[i] > 450 && _dis[i] < 700)
                                ds_list_add(_list_pos, i)
                        }
                        if (ds_list_size(_list_pos) > 0)
                        {
                            var _amount = 1
                            if scr_chance(10)
                                _amount = 3
                            repeat _amount
                            {
                                ds_list_shuffle(_list_pos)
                                var _pos_id = ds_list_find_value(_list_pos, 0)
                                var _spawn_mall_x = global.mall_spawn_x[_pos_id]
                                var _spawn_mall_y = global.mall_spawn_y[_pos_id]
                                ds_list_shuffle(_list_spawn)
                                var _index = ds_list_find_value(_list_spawn, 0)
                                repeat global.spmall_amount[_index]
                                    instance_create_depth(_spawn_mall_x, _spawn_mall_y, 0, global.spmall_obj[_index])
                            }
                        }
                    }
                }
            }
        }
    }
}
