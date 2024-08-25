var _amount;
if is_in_raid()
{
    if (global.airdrop_created == false)
    {
        if (global.santa2023_given_milk || global.general_debug)
        {
            var _placed = false
            repeat (50000)
            {
                if (_placed == false)
                {
                    var xx = irandom(room_width div 16)
                    var yy = irandom(obj_map_generator.map_height div 16)
                    if (ds_grid_get(obj_map_generator.grid_tile, xx, yy) == -1 && ds_grid_get(obj_map_generator.grid_building, xx, yy) != (1 << 0))
                    {
                        _placed = true
                        global.airdrop_created = true
                        instance_create_depth((xx * 16), (yy * 16), 0, obj_chest_air_drop_natale)
                        var _off = irandom(10)
                        var _dir = irandom(360)
                        ds_list_add(global.list_intresting_id, (6 << 0))
                        ds_list_add(global.list_intresting_x, (xx + (lengthdir_x(_off, _dir))))
                        ds_list_add(global.list_intresting_y, (yy + (lengthdir_y(_off, _dir))))
                        var a = (0 << 0)
                        _amount[a] = 5 + (choose(0, 0, 0, 5, 10))
                        _object[a] = obj_enemy_human_bandit_novice
                        _chance[a] = 2
                        a = (1 << 0)
                        _amount[a] = 3 + (choose(0, 0, 0, 2, 4, 10))
                        _object[a] = obj_loner_enemy
                        _chance[a] = 2
                        a = (2 << 0)
                        _amount[a] = 8 + irandom(5) + (choose(0, 0, 0, 0, 25))
                        _object[a] = obj_enemy_ghoul
                        _chance[a] = 2
                        a = (3 << 0)
                        _amount[a] = 1 + (choose(0, 0, 0, 2, 5))
                        _object[a] = obj_enemy_big
                        _chance[a] = 1
                        a = (4 << 0)
                        _amount[a] = 1 + (choose(0, 0, 5))
                        _object[a] = obj_boss_killa
                        _chance[a] = 1
                        a = (5 << 0)
                        _amount[a] = 1 + (choose(0, 0, 5))
                        _object[a] = obj_boss_arman
                        _chance[a] = 1
                        a = (7 << 0)
                        _amount[a] = 1 + (choose(0, 0, 5))
                        _object[a] = obj_enemy_human_bandit_boss_outpost
                        _chance[a] = 1
                        a = (6 << 0)
                        _amount[a] = 1 + (choose(0, 0, 5))
                        _object[a] = obj_enemy_human_bandit_boss
                        _chance[a] = 1
                        var _list = ds_list_create()
                        for (var i = 0; i < array_length(_amount); i++)
                        {
                            repeat _chance[i]
                                ds_list_add(_list, i)
                        }
                        ds_list_shuffle(_list)
                        var _choosen = ds_list_find_value(_list, 0)
                        var _amount_max = _amount[_choosen]
                        var _amount_now = 0
                        repeat (1000)
                        {
                            if (_amount_now < _amount_max)
                            {
                                _off = 10
                                var _offx = irandom_range((-_off), _off)
                                var _offy = irandom_range((-_off), _off)
                                var _x = xx * 16 + _offx * 16
                                var _y = yy * 16 + _offy * 16
                                var _free = scr_check_position_free(_x, _y)
                                if (_free == true)
                                {
                                    var _npc_to_create = _object[_choosen]
                                    instance_create_depth(_x, _y, 0, _npc_to_create)
                                    _amount_now++
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (global.airdrop_created == false)
    {
        if (scr_chance(20) || global.general_debug)
        {
            _placed = false
            repeat (50000)
            {
                if (_placed == false)
                {
                    xx = irandom(room_width div 16)
                    yy = irandom(obj_map_generator.map_height div 16)
                    if (ds_grid_get(obj_map_generator.grid_tile, xx, yy) == -1 && ds_grid_get(obj_map_generator.grid_building, xx, yy) != (1 << 0))
                    {
                        _placed = true
                        global.airdrop_created = true
                        audio_play_sound(snd_airplane, 10, false)
                        instance_create_depth((xx * 16), (yy * 16), 0, obj_chest_air_drop)
                        _off = irandom(10)
                        _dir = irandom(360)
                        ds_list_add(global.list_intresting_id, (3 << 0))
                        ds_list_add(global.list_intresting_x, (xx + (lengthdir_x(_off, _dir))))
                        ds_list_add(global.list_intresting_y, (yy + (lengthdir_y(_off, _dir))))
                        _amount_max = 5 + irandom(4)
                        _amount_now = 0
                        repeat (1000)
                        {
                            if (_amount_now < _amount_max)
                            {
                                _off = 10
                                _offx = irandom_range((-_off), _off)
                                _offy = irandom_range((-_off), _off)
                                _x = xx * 16 + _offx * 16
                                _y = yy * 16 + _offy * 16
                                _free = scr_check_position_free(_x, _y)
                                if (_free == true)
                                {
                                    _npc_to_create = obj_enemy_human_bandit_regular
                                    if scr_chance(50)
                                        _npc_to_create = obj_loner_enemy
                                    if scr_chance(20)
                                        _npc_to_create = 786
                                    instance_create_depth(_x, _y, 0, _npc_to_create)
                                    _amount_now++
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
