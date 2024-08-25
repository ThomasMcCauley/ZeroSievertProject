var _temp_local_var_1, _temp_local_var_2, _temp_local_var_10, _temp_local_var_20, _temp_local_var_21, _temp_local_var_109, _temp_local_var_200, _temp_local_var_215;
if (state == (18 << 0))
{
    var _timer = round(tempo_generazione[(18 << 0)])
    var _time = string(round(tempo_gen_assoluto[state]))
    var _text = "MAPGEN:assolute:" + _time
    ga_addDesignEvent(_text, 1)
}
scr_get_time_gen()
var _pre = "MAPGEN::state_" + string(state) + ":"
_time = round(tempo_generazione[state])
var _full_text = _pre + string(_time)
ga_addDesignEvent(_full_text, 1)
switch state
{
    case (1 << 0):
        ds_grid_clear(grid_map, -7)
        generator_startx = grid_map_w div 2
        generator_starty = grid_map_h div 2
        controllerx = generator_startx
        controllery = generator_starty
        debug_controller_x = controllerx
        debug_controller_y = controllery
        if (area == (1 << 0))
        {
            building_deserialize(r_b_forest_layout, 0, 0)
            ds_grid_set_disk(grid_map, (grid_map_w div 2), (grid_map_h div 2), 30, -1)
            ds_grid_set_region(grid_building, 130, 113, 187, 171, (1 << 0))
            raggio = 4
            var direzioni = 8
            var quale_direzione = 360 div direzioni
            for (var i = 0; i < direzioni; i += 1)
            {
                controllerx = generator_startx
                controllery = generator_starty
                var j = 0
                var amount = 750
                var dir = irandom(360)
                repeat amount
                {
                    j++
                    ds_grid_set_disk(grid_map, controllerx, controllery, raggio, -1)
                    dir = irandom(360)
                    if scr_chance(6)
                        dir = i * quale_direzione
                    var dirx = lengthdir_x(raggio, dir)
                    var diry = lengthdir_y(raggio, dir)
                    controllerx += dirx
                    controllery += diry
                    var offset_dai_margini = 12
                    if (controllerx < (raggio + offset_dai_margini) || controllerx > (grid_map_w - raggio - offset_dai_margini))
                        controllerx += (-dirx)
                    if (controllery < (raggio + offset_dai_margini) || controllery > (grid_map_h - raggio - offset_dai_margini))
                        controllery += (-diry)
                }
            }
        }
        if (area == (2 << 0))
        {
            building_deserialize(r_b_makeshift_outpost, (makeshift_camp_outpost_x div 16), (makeshift_camp_outpost_y div 16))
            var _x1 = makeshift_camp_outpost_x div 32
            var _y1 = makeshift_camp_outpost_y div 32
            var _x2 = _x1 + (makeshift_camp_outpost_w div 32)
            var _y2 = _y1 + (makeshift_camp_outpost_h div 32)
            ds_grid_set_region(grid_map, _x1, _y1, _x2, _y2, -1)
            var _off = 5
            _x1 = makeshift_camp_outpost_x div 16
            _y1 = makeshift_camp_outpost_y div 16
            _x2 = _x1 + (makeshift_camp_outpost_w div 16)
            _y2 = _y1 + (makeshift_camp_outpost_h div 16)
            ds_grid_set_region(grid_building, (_x1 - _off), (_y1 - _off), (_x2 + _off), (_y2 + _off), (1 << 0))
            raggio = 5
            direzioni = 8
            quale_direzione = 360 div direzioni
            for (i = 0; i < direzioni; i += 1)
            {
                controllerx = generator_startx
                controllery = generator_starty
                j = 0
                amount = 220
                dir = irandom(360)
                repeat amount
                {
                    j++
                    ds_grid_set_disk(grid_map, controllerx, controllery, raggio, -1)
                    dir = irandom(360)
                    if scr_chance(4)
                        dir = i * quale_direzione
                    dirx = lengthdir_x(raggio, dir)
                    diry = lengthdir_y(raggio, dir)
                    controllerx += dirx
                    controllery += diry
                    offset_dai_margini = 12
                    if (controllerx < (raggio + offset_dai_margini) || controllerx > (grid_map_w - raggio - offset_dai_margini))
                        controllerx += (-dirx)
                    if (controllery < (raggio + offset_dai_margini) || controllery > (grid_map_h - raggio - offset_dai_margini))
                        controllery += (-diry)
                }
            }
        }
        if (area == (3 << 0))
        {
            ds_grid_set_region(grid_map, 21, 15, 129, 129, -1)
            building_deserialize(r_b_industrial_area_road, 0, 0)
            raggio = 5
            direzioni = 8
            quale_direzione = 360 div direzioni
            for (i = 0; i < direzioni; i += 1)
            {
                controllerx = generator_startx
                controllery = generator_starty
                j = 0
                amount = 75
                dir = irandom(360)
                repeat amount
                {
                    j++
                    ds_grid_set_disk(grid_map, controllerx, controllery, raggio, -1)
                    dir = irandom(360)
                    if scr_chance(7)
                        dir = i * quale_direzione
                    dirx = lengthdir_x(raggio, dir)
                    diry = lengthdir_y(raggio, dir)
                    controllerx += dirx
                    controllery += diry
                    offset_dai_margini = 12
                    if (controllerx < (raggio + offset_dai_margini) || controllerx > (grid_map_w - raggio - offset_dai_margini))
                        controllerx += (-dirx)
                    if (controllery < (raggio + offset_dai_margini) || controllery > (grid_map_h - raggio - offset_dai_margini))
                        controllery += (-diry)
                }
            }
            ds_grid_set_region(grid_building, 216, 117, 261, 142, (1 << 0))
        }
        if (area == (4 << 0))
            ds_grid_clear(grid_map, -1)
        if (area == (6 << 0))
        {
            building_deserialize(r_b_mall_layout, 0, 0)
            ds_grid_set_region(grid_map, 21, 12, 135, 126, -1)
            ds_grid_set_region(grid_building, 81, 59, 230, 133, (1 << 0))
            raggio = 5
            direzioni = 8
            quale_direzione = 360 div direzioni
            for (i = 0; i < direzioni; i += 1)
            {
                controllerx = generator_startx
                controllery = generator_starty
                j = 0
                amount = 650
                dir = irandom(360)
                repeat amount
                {
                    j++
                    ds_grid_set_disk(grid_map, controllerx, controllery, raggio, -1)
                    dir = irandom(360)
                    if scr_chance(6)
                        dir = i * quale_direzione
                    dirx = lengthdir_x(raggio, dir)
                    diry = lengthdir_y(raggio, dir)
                    controllerx += dirx
                    controllery += diry
                    offset_dai_margini = 12
                    if (controllerx < (raggio + offset_dai_margini) || controllerx > (grid_map_w - raggio - offset_dai_margini))
                        controllerx += (-dirx)
                    if (controllery < (raggio + offset_dai_margini) || controllery > (grid_map_h - raggio - offset_dai_margini))
                        controllery += (-diry)
                }
            }
        }
        if (area == (8 << 0))
        {
            raggio = 6
            direzioni = 8
            quale_direzione = 360 div direzioni
            ds_grid_set_region(grid_map, 0, 0, grid_map_w, grid_map_h, -1)
            building_deserialize(r_city_layout_2, 0, 0)
        }
        if (area == (9 << 0))
        {
            ds_grid_set_region(grid_map, 15, 18, 129, 129, -1)
            ds_grid_set_region(grid_map, 111, 42, 153, 69, -1)
            raggio = 8
            direzioni = 8
            quale_direzione = 360 div direzioni
            for (i = 0; i < direzioni; i += 1)
            {
                controllerx = generator_startx
                controllery = generator_starty
                j = 0
                amount = 100
                dir = irandom(360)
                repeat amount
                {
                    j++
                    ds_grid_set_disk(grid_map, controllerx, controllery, raggio, -1)
                    dir = irandom(360)
                    if scr_chance(7)
                        dir = i * quale_direzione
                    dirx = lengthdir_x(raggio, dir)
                    diry = lengthdir_y(raggio, dir)
                    controllerx += dirx
                    controllery += diry
                    offset_dai_margini = 6
                    if (controllerx < (raggio + offset_dai_margini) || controllerx > (grid_map_w - raggio - offset_dai_margini))
                        controllerx += (-dirx)
                    if (controllery < (raggio + offset_dai_margini) || controllery > (grid_map_h - raggio - offset_dai_margini))
                        controllery += (-diry)
                }
            }
            for (var yy = 0; yy < grid_tile_h; yy++)
            {
                for (var xx = 0; xx < grid_tile_w; xx++)
                {
                    if (ds_grid_get(grid_floor2, xx, yy) == 1)
                        ds_grid_set(grid_building, xx, yy, (2 << 0))
                }
            }
        }
        break
    case (2 << 0):
        train_start_x = 0
        train_start_y = 0
        train_stop_x = 0
        train_stop_y = 0
        if (area == (1 << 0))
        {
            var off = irandom_range(10, 13)
            train_start_x = grid_train_w
            train_start_y = (grid_train_h div 2) + (choose((-off), off))
            for (i = 0; i < grid_train_w; i++)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        if (area == (2 << 0))
        {
            train_start_x = grid_train_w
            train_start_y = 3 + (makeshift_camp_outpost_y div 96)
            for (i = 0; i < grid_train_w; i++)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        if (area == (3 << 0))
        {
            train_start_x = grid_train_w
            train_start_y = 42
            for (i = 0; i < grid_train_w; i++)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        if (area == (4 << 0))
        {
            train_start_x = grid_train_w
            train_start_y = (grid_train_h div 3) * 2
            for (i = grid_train_w + 1; i > -1; i--)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        if (area == (6 << 0))
        {
            train_start_x = grid_train_w
            train_start_y = 44
            for (i = 0; i < grid_train_w; i++)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        if (area == (9 << 0))
        {
            train_start_x = grid_train_w
            train_start_y = 42
            for (i = 0; i < grid_train_w; i++)
                ds_grid_set(grid_train, i, train_start_y, true)
        }
        var ro_offset = 10
        var ro = 0
        road_startx[ro] = (grid_strada_w div 2) + (irandom_range((-ro_offset), ro_offset))
        road_starty[ro] = 0
        road_direction[ro] = 270
        ro++
        road_startx[ro] = 0
        road_starty[ro] = (grid_strada_h div 2) + (irandom_range((-ro_offset), ro_offset))
        road_direction[ro] = 0
        ro++
        road_startx[ro] = (grid_strada_w div 2) + (irandom_range((-ro_offset), ro_offset))
        road_starty[ro] = grid_strada_h
        road_direction[ro] = 90
        ro++
        road_startx[ro] = grid_strada_w
        road_starty[ro] = (grid_strada_h div 2) + (irandom_range((-ro_offset), ro_offset))
        road_direction[ro] = 180
        if (area == (1 << 0))
        {
        }
        if (area == (2 << 0))
        {
            var road_start_pos = 0
            for (var ro_number = 0; ro_number < 1; ro_number++)
            {
                road_start_pos += ro_number
                if (road_start_pos > 3)
                    road_start_pos = 0
                var has_changed_direction = false
                stradax = road_startx[road_start_pos]
                straday = road_starty[road_start_pos]
                strada_amount = 250
                var jj = 0
                repeat strada_amount
                {
                    ds_grid_set(grid_strada, stradax, straday, true)
                    dir = road_direction[road_start_pos]
                    if (has_changed_direction == true)
                    {
                        jj++
                        if (jj > 3)
                        {
                            has_changed_direction = false
                            jj = 0
                        }
                    }
                    if (scr_chance(25) && has_changed_direction == false)
                    {
                        dir = road_direction[road_start_pos] + (choose(-90, 90))
                        has_changed_direction = true
                    }
                    dirx = lengthdir_x(1, dir)
                    diry = lengthdir_y(1, dir)
                    stradax += dirx
                    straday += diry
                }
            }
        }
        if (area == (7 << 0))
        {
            surface_road_zaton = surface_create(grid_strada_w, grid_strada_h)
            surface_set_target(surface_road_zaton)
            draw_sprite(s_zaton_road, 0, 0, 0)
            var sprite_w = sprite_get_width(s_zaton_road)
            var sprite_h = sprite_get_height(s_zaton_road)
            var zat_building = 0
            for (var sx = 0; sx < sprite_w; sx++)
            {
                for (var sy = 0; sy < sprite_h; sy++)
                {
                    var pixel_color = surface_getpixel(surface_road_zaton, sx, sy)
                    if (pixel_color == 0)
                        ds_grid_set(grid_strada, sx, sy, true)
                    if (pixel_color == make_color_rgb(0, 255, 0))
                    {
                        train_start_x = grid_train_w
                        train_start_y = sy
                        zaton_stop_train_x = sx
                        zaton_stop_train_y = sy
                        for (i = 0; i < grid_train_w; i++)
                            ds_grid_set(grid_train, i, sy, true)
                    }
                    if (pixel_color == make_color_rgb(255, 0, 0))
                    {
                        arr_zaton_building_x[zat_building] = sx * 6
                        arr_zaton_building_y[zat_building] = sy * 6
                        arr_zaton_building_fatto[zat_building] = false
                        zat_building++
                    }
                }
            }
            surface_reset_target()
        }
        for (yy = 0; yy < grid_strada_w; yy++)
        {
            for (xx = 0; xx < grid_strada_h; xx++)
            {
                if (ds_grid_get(grid_strada, xx, yy) == true)
                {
                    ds_grid_set_region(grid_map, (xx * 3), (yy * 3), (xx * 3 + 2), (yy * 3 + 2), -1)
                    ds_grid_set_region(grid_building, (xx * 6), (yy * 6), (xx * 6 + 5), (yy * 6 + 5), (2 << 0))
                }
            }
        }
        break
    case (3 << 0):
        if (area == (1 << 0) || area == (3 << 0) || area == (2 << 0) || area == (7 << 0) || area == (9 << 0))
        {
            for (yy = 1; yy < (grid_tile_w - 1); yy++)
            {
                for (xx = 1; xx < (grid_tile_h - 1); xx++)
                {
                    if scr_chance(2.5)
                    {
                        var grandezza = irandom(3) + 2
                        for (var fx = 0; fx < grandezza; fx++)
                        {
                            for (var fy = 0; fy < grandezza; fy++)
                            {
                                if scr_chance(60)
                                    ds_grid_set(grid_floor2, (xx + fx), (yy + fy), 0)
                            }
                        }
                    }
                }
            }
        }
        if (area == (4 << 0))
        {
            for (yy = 1; yy < (grid_tile_w - 1); yy++)
            {
                for (xx = 1; xx < (grid_tile_h - 1); xx++)
                {
                    if scr_chance(5)
                    {
                        var which_floor2 = choose(0, 6)
                        grandezza = irandom(3) + 2
                        for (fx = 0; fx < grandezza; fx++)
                        {
                            for (fy = 0; fy < grandezza; fy++)
                            {
                                if scr_chance(60)
                                    ds_grid_set(grid_floor2, (xx + fx), (yy + fy), which_floor2)
                            }
                        }
                    }
                }
            }
        }
        if (area == (6 << 0))
        {
            for (yy = 1; yy < (grid_tile_w - 1); yy++)
            {
                for (xx = 1; xx < (grid_tile_h - 1); xx++)
                {
                    if scr_chance(2.5)
                    {
                        grandezza = irandom(3) + 2
                        for (fx = 0; fx < grandezza; fx++)
                        {
                            for (fy = 0; fy < grandezza; fy++)
                            {
                                if scr_chance(60)
                                {
                                    if (ds_grid_get(grid_floor2, (xx + fx), (yy + fy)) != 1)
                                        ds_grid_set(grid_floor2, (xx + fx), (yy + fy), 0)
                                }
                            }
                        }
                    }
                }
            }
        }
        break
    case (4 << 0):
        var _tiling_road = true
        if (area == (3 << 0))
            _tiling_road = false
        if (area == (9 << 0))
            _tiling_road = false
        if (area == (6 << 0))
            _tiling_road = false
        if (area == (8 << 0))
            _tiling_road = false
        if (_tiling_road == true)
            scr_autotiling_road(layer_tileset_road)
        for (yy = 0; yy < grid_train_h; yy++)
        {
            for (xx = 0; xx < grid_train_w; xx++)
            {
                if (ds_grid_get(grid_train, xx, yy) != -7)
                {
                    ds_grid_set_region(grid_map, (xx * 3), (yy * 3), (xx * 3 + 2), (yy * 3 + 2), -1)
                    ds_grid_set_region(grid_building, (xx * 6), (yy * 6), (xx * 6 + 5), (yy * 6 + 5), (1 << 0))
                }
                if (ds_grid_get(grid_train, xx, yy) == true)
                {
                    ds_grid_set_region(grid_floor2, (xx * 6), (yy * 6 + 1), (xx * 6 + 5), (yy * 6 + 4), 6)
                    tilemap_set(layer_tileset_railroad, 1, xx, yy)
                }
            }
        }
        break
    case (5 << 0):
        if (area != (7 << 0) && area != (3 << 0) && area != (9 << 0))
        {
            train_stop_x = irandom_range(10, (grid_train_w - 10))
            train_stop_y = train_start_y
        }
        if (area == (2 << 0))
        {
            if (!quest_is_complete("kill_orel"))
                train_stop_x = grid_train_w - 10
            else
                train_stop_x = irandom_range(20, (grid_train_w - 10))
        }
        if (area == (3 << 0))
        {
            train_stop_x = (grid_train_w div 2) + (irandom_range(-10, 10))
            train_stop_y = train_start_y
        }
        if (area == (7 << 0))
        {
            train_stop_x = zaton_stop_train_x
            train_stop_y = zaton_stop_train_y
        }
        if (area == (9 << 0))
        {
            train_stop_x = (grid_train_w div 2) + (irandom_range(-10, 10))
            train_stop_y = train_start_y
        }
        ds_grid_set_disk(grid_building, (train_stop_x * 6), (train_stop_y * 6), 20, (2 << 0))
        instance_create_depth((train_stop_x * 96 + 48), (train_stop_y * 96 + 48), 0, obj_train_stop)
        break
    case (6 << 0):
        scr_from_grid_map_to_grid_tile()
        break
    case (7 << 0):
        if (area == (1 << 0))
        {
            for (yy = 1; yy < (grid_48_x - 1); yy++)
            {
                for (xx = 1; xx < (grid_48_y - 1); xx++)
                {
                    if scr_chance(0.35)
                    {
                        var water_x = xx
                        var water_y = yy
                        repeat (irandom(20) + 5)
                        {
                            dir = choose(0, 90, 180, 270)
                            dirx = lengthdir_x(1, dir)
                            diry = lengthdir_y(1, dir)
                            ds_grid_set_region(grid_water, (water_x * 3), (water_y * 3), (water_x * 3 + 2), (water_y * 3 + 2), -1)
                            water_x += dirx
                            water_y += diry
                        }
                    }
                }
            }
            ds_grid_set_disk(grid_water, (grid_tile_w div 2), (grid_tile_h div 2), 50, -7)
        }
        var _offx = 25
        var _offy1 = 45
        var _offy2 = 60
        if (area == (2 << 0))
        {
            for (yy = 1; yy < (grid_48_x - 1); yy++)
            {
                for (xx = 1; xx < (grid_48_y - 1); xx++)
                {
                    if (xx > _offx && (yy < _offy1 || yy > _offy2))
                    {
                        if scr_chance(0.05)
                        {
                            water_x = xx
                            water_y = yy
                            repeat (irandom(40) + 200)
                            {
                                dir = choose(0, 90, 180, 270)
                                dirx = lengthdir_x(1, dir)
                                diry = lengthdir_y(1, dir)
                                ds_grid_set_region(grid_water, (water_x * 3), (water_y * 3), (water_x * 3 + 2), (water_y * 3 + 2), -1)
                                water_x += dirx
                                water_y += diry
                                water_x = clamp(water_x, -1, (grid_48_x + 1))
                                water_y = clamp(water_y, -1, (grid_48_y + 1))
                            }
                        }
                    }
                }
            }
        }
        if (area == (4 << 0))
        {
            ds_grid_set_region(grid_water, 0, 0, grid_tile_w, grid_tile_h, -1)
            repeat (24)
            {
                var dir_f = 270
                fx = (grid_map_w div 2) + (irandom_range(-63, 63))
                fy = irandom(5) + 7
                jj = 0
                amount = 600
                repeat amount
                {
                    jj++
                    if (jj < amount)
                    {
                        var fiume_w = 1
                        dir = 270 + (choose(90, -90))
                        if scr_chance(22)
                            dir = dir_f
                        if (frac(jj / 80) == 0)
                            fiume_w = 6
                        dirx = lengthdir_x(1, dir)
                        diry = lengthdir_y(1, dir)
                        fx += dirx
                        fy += diry
                        offset_dai_margini = 9
                        if (fx < offset_dai_margini || fx > (grid_map_w - offset_dai_margini))
                            fx += (-dirx)
                        if (fy > (grid_map_h - offset_dai_margini))
                            jj = amount
                        ds_grid_set_disk(grid_map, fx, fy, fiume_w, -7)
                    }
                }
            }
            ds_grid_set_region(grid_map, 73, 0, 149, 54, -7)
            for (xx = 0; xx < grid_map_w; xx++)
            {
                for (yy = 0; yy < grid_map_h; yy++)
                {
                    if (ds_grid_get(grid_map, xx, yy) == -7)
                        ds_grid_set_region(grid_water, (xx * 2), (yy * 2), (xx * 2 + 1), (yy * 2 + 1), -7)
                }
            }
            var o = obj_controller
            var layout = 0
            if (!quest_is_complete("clear_swamp"))
                layout = 0
            if (quest_is_complete("clear_swamp") && (!quest_is_complete("the_crystal")))
                layout = 2
            var _found = false
            _found = scr_check_quest_from_file((47 << 0))
            if quest_is_active("clear_swamp")
            {
                if (time_get_hours() >= 21 || time_get_hours() <= 3)
                    layout = 1
            }
            if quest_is_complete("the_crystal")
                layout = 3
            switch layout
            {
                case 0:
                    building_deserialize(r_b_swamp_layout_before_quest, 0, 0)
                    break
                case 1:
                    building_deserialize(r_b_swamp_layout, 0, 0)
                    break
                case 2:
                    building_deserialize(r_b_swamp_layout_after_quest, 0, 0)
                    break
                case 3:
                    building_deserialize(r_b_swamp_layout_after_quest_viola, 0, 0)
                    break
            }

            ds_grid_set_region(grid_building, 197, 74, 231, 103, (1 << 0))
        }
        for (xx = 0; xx < grid_strada_w; xx++)
        {
            for (yy = 0; yy < grid_strada_h; yy++)
            {
                if (ds_grid_get(grid_strada, xx, yy) == true || ds_grid_get(grid_train, xx, yy) == true)
                    ds_grid_set_region(grid_water, (xx * 6), (yy * 6), (xx * 6 + 5), (yy * 6 + 5), -7)
            }
        }
        for (xx = 0; xx < grid_tile_w; xx++)
        {
            for (yy = 0; yy < grid_tile_h; yy++)
            {
                if (ds_grid_get(grid_water, xx, yy) == -1)
                {
                    var tile_sopra = ds_grid_get(grid_water, xx, (yy - 1)) == -1
                    var tile_sx = ds_grid_get(grid_water, (xx - 1), yy) == -1
                    var tile_dx = ds_grid_get(grid_water, (xx + 1), yy) == -1
                    var tile_sotto = ds_grid_get(grid_water, xx, (yy + 1)) == -1
                    var tile_sotto_sx = ds_grid_get(grid_water, (xx - 1), (yy + 1)) == -1
                    var tile_sotto_dx = ds_grid_get(grid_water, (xx + 1), (yy + 1)) == -1
                    var tile_sopra_sx = ds_grid_get(grid_water, (xx - 1), (yy - 1)) == -1
                    var tile_sopra_dx = ds_grid_get(grid_water, (xx + 1), (yy - 1)) == -1
                    var tile_index = 1 * tile_sopra + 2 * tile_sx + 4 * tile_dx + 8 * tile_sotto + 1
                    if ((!tile_sopra) && (!tile_sotto) && (!tile_dx) && (!tile_sx))
                        ds_grid_set(grid_water, xx, yy, -7)
                }
            }
        }
        for (yy = 1; yy < (grid_tile_w - 1); yy++)
        {
            for (xx = 1; xx < (grid_tile_h - 1); xx++)
            {
                if (ds_grid_get(grid_water, xx, yy) == -1)
                    ds_grid_set(grid_building, xx, yy, (1 << 0))
            }
        }
        break
    case (8 << 0):
        depth = 50
        for (xx = 0; xx < grid_tile_w; xx++)
        {
            for (yy = 0; yy < grid_tile_h; yy++)
                tilemap_set(layer_tileset_floor, area_tileset_floor_box[area], xx, yy)
        }
        for (xx = 0; xx < grid_tile_w; xx++)
        {
            for (yy = grid_tile_h; yy < g_indoor_h; yy++)
                tilemap_set(layer_tileset_floor_indoor, 32, xx, yy)
        }
        if (area_autotiling_mode[area] == (0 << 0))
        {
            layer_tileset_wall_above = layer_tilemap_create(layer_create(-8400), 0, 0, area_tileset_wall[area], grid_tile_w, grid_tile_h)
            layer_tileset_wall_below = layer_tilemap_create(layer_create(-8200), 0, 0, area_tileset_wall[area], grid_tile_w, grid_tile_h)
            var _layer_tileset_wall_above = layer_tileset_wall_above
            var _layer_tileset_wall_below = layer_tileset_wall_below
            var _wall_layer_array = array_create(grid_tile_h, undefined)
            var _wall_tilemap_array = array_create(grid_tile_h, undefined)
            var _y = 0
            repeat array_length(_wall_layer_array)
            {
                var _layer = layer_create((-((_y + 2))) * 16)
                var _tilemap = layer_tilemap_create(_layer, 0, (_y * 16), area_tileset_wall[area], grid_tile_w, 2)
                _wall_layer_array[_y] = _layer
                _wall_tilemap_array[_y] = _tilemap
                _y++
            }
            var _grid_tile = grid_tile
            var _x = 1
            repeat (grid_tile_w - 2)
            {
                _y = 1
                repeat (grid_tile_h - 2)
                {
                    if (ds_grid_get(_grid_tile, _x, _y) != -1)
                    {
                        tile_sopra = ds_grid_get(_grid_tile, _x, (_y - 1)) == -1
                        tile_sx = ds_grid_get(_grid_tile, (_x - 1), _y) == -1
                        tile_dx = ds_grid_get(_grid_tile, (_x + 1), _y) == -1
                        tile_sotto = ds_grid_get(_grid_tile, _x, (_y + 1)) == -1
                        tile_sotto_sx = ds_grid_get(_grid_tile, (_x - 1), (_y + 1)) == -1
                        tile_sotto_dx = ds_grid_get(_grid_tile, (_x + 1), (_y + 1)) == -1
                        tile_sopra_sx = ds_grid_get(_grid_tile, (_x - 1), (_y - 1)) == -1
                        tile_sopra_dx = ds_grid_get(_grid_tile, (_x + 1), (_y - 1)) == -1
                        if (tile_sopra && (!tile_sotto) && (!tile_dx) && (!tile_sx))
                        {
                            tilemap_set(_wall_tilemap_array[(_y - 1)], 2, _x, 0)
                            tilemap_set(_wall_tilemap_array[_y], 6, _x, 0)
                        }
                        if (tile_sopra && (!tile_sotto) && (!tile_dx) && tile_sx)
                        {
                            tilemap_set(_wall_tilemap_array[(_y - 1)], 1, _x, 0)
                            tilemap_set(_wall_tilemap_array[_y], 5, _x, 0)
                        }
                        if (tile_sopra && (!tile_sotto) && tile_dx && (!tile_sx))
                        {
                            tilemap_set(_wall_tilemap_array[(_y - 1)], 3, _x, 0)
                            tilemap_set(_wall_tilemap_array[_y], 7, _x, 0)
                        }
                        if ((!tile_sopra) && (!tile_sotto) && (!tile_sx) && tile_dx)
                        {
                            if (!tile_sotto_dx)
                                tilemap_set(_wall_tilemap_array[_y], 20, _x, 0)
                            else
                                tilemap_set(_wall_tilemap_array[_y], 7, _x, 0)
                            if (!tile_sopra_dx)
                            {
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 7, _x, 0)
                                tilemap_set(_wall_tilemap_array[(_y - 2)], 16, _x, 0)
                            }
                        }
                        if ((!tile_sopra) && (!tile_sotto) && (!tile_dx) && tile_sx)
                        {
                            if (!tile_sotto_sx)
                                tilemap_set(_wall_tilemap_array[_y], 21, _x, 0)
                            else
                                tilemap_set(_wall_tilemap_array[_y], 5, _x, 0)
                            if (!tile_sopra_sx)
                            {
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 5, _x, 0)
                                tilemap_set(_wall_tilemap_array[(_y - 2)], 17, _x, 0)
                            }
                        }
                        if ((!tile_sopra) && (!tile_sotto) && (!tile_dx) && (!tile_sx))
                            tilemap_set(_wall_tilemap_array[_y], 4, _x, 0)
                        if tile_sotto
                        {
                            if tile_sx
                            {
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 13, _x, 1)
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 9, _x, 0)
                            }
                            if tile_dx
                            {
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 15, _x, 1)
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 11, _x, 0)
                            }
                            if ((!tile_dx) && (!tile_sx))
                            {
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 14, _x, 1)
                                tilemap_set(_wall_tilemap_array[(_y - 1)], 10, _x, 0)
                            }
                        }
                    }
                    _y++
                }
                _x++
            }
        }
        break
    case (9 << 0):
        for (xx = 1; xx < (grid_tile_w - 1); xx++)
        {
            for (yy = 1; yy < (grid_tile_h - 1); yy++)
            {
                if (xx == offset_solid_dai_margini || xx == (grid_tile_w - offset_solid_dai_margini))
                    instance_create_depth((xx * 16), (yy * 16), 0, obj_solid)
                if (yy == offset_solid_dai_margini || yy == (grid_tile_h - offset_solid_dai_margini))
                    instance_create_depth((xx * 16), (yy * 16), 0, obj_solid)
                if (ds_grid_get(grid_tile, xx, yy) != -1)
                {
                    tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -7
                    tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -7
                    tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -7
                    tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -7
                    tile_index = 1 * tile_sopra + 2 * tile_sx + 4 * tile_dx + 8 * tile_sotto + 1
                    if (tile_index != 16)
                    {
                        if (area != (4 << 0))
                            instance_create_depth((xx * 16), (yy * 16), 0, obj_solid)
                    }
                }
            }
        }
        break
    case (10 << 0):
        if (area == (3 << 0))
            ds_grid_set_region(grid_building, 61, 42, 76, 52, (1 << 0))
        scr_building_list()
        if (area == (9 << 0))
            self.scr_cnpp_layout(0, 0)
        for (var bx = grid_tile_w - 1; bx > 0; bx--)
        {
            for (var by = grid_tile_h - 1; by > 0; by--)
            {
                sx = bx
                sy = by
                if (ds_grid_get(grid_fence, sx, sy) != -1)
                {
                    var ttile = ds_grid_get(grid_fence, sx, sy)
                    tile_sopra = false
                    if (ds_grid_get(grid_fence, sx, (sy - 1)) != -1)
                        tile_sopra = true
                    tile_sx = false
                    if (ds_grid_get(grid_fence, (sx - 1), sy) != -1)
                        tile_sx = true
                    tile_dx = false
                    if (ds_grid_get(grid_fence, (sx + 1), sy) != -1)
                        tile_dx = true
                    tile_sotto = false
                    if (ds_grid_get(grid_fence, sx, (sy + 1)) != -1)
                        tile_sotto = true
                    if (tile_sopra && (!tile_sotto) && (!tile_dx) && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 14)
                    else if ((!tile_sopra) && (!tile_sotto) && (!tile_sx) && tile_dx)
                        scr_set_wall_building(sx, sy, ttile, 17)
                    else if ((!tile_sopra) && (!tile_sotto) && (!tile_dx) && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 16)
                    else if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 13)
                    else if ((!tile_sopra) && tile_sotto && (!tile_dx) && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 11)
                    else if (tile_sopra && tile_sotto && (!tile_dx) && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 3)
                    else if ((!tile_sopra) && tile_sotto && tile_dx && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 1)
                    else if ((!tile_sopra) && tile_sotto && (!tile_dx) && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 2)
                    else if (tile_sopra && tile_sotto && tile_dx && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 4)
                    else if (tile_sopra && tile_sotto && (!tile_dx) && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 5)
                    else if (tile_sopra && (!tile_sotto) && tile_dx && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 10)
                    else if (tile_sopra && (!tile_sotto) && tile_dx && (!tile_sx))
                        scr_set_wall_building(sx, sy, ttile, 7)
                    else if (tile_sopra && (!tile_sotto) && (!tile_dx) && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 8)
                    else if ((!tile_sopra) && tile_sotto && tile_dx && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 15)
                    else if ((!tile_sopra) && (!tile_sotto) && tile_dx && tile_sx)
                        scr_set_wall_building(sx, sy, ttile, 9)
                }
            }
        }
        break
    case (11 << 0):
        amount = area_obj_total_amount[area]
        if (amount > 0)
        {
            var lista_place = ds_list_create()
            for (i = 0; i < array_length_2d(area_index, area); i++)
            {
                repeat area_obj_amount[area][i]
                    ds_list_add(lista_place, area_index[area][i])
            }
            var _random_size = ds_list_size(lista_place) - 1
            var _temp_local_var_109 = 75000
            if (75000 <= 0)
            {
            }
            else
            {
                while (true)
                {
                    var which_place = ds_list_find_value(lista_place, irandom(_random_size))
                    if (area_obj_amount_now[area][which_place] < area_obj_amount[area][which_place])
                    {
                        var place_id = area_obj[area][which_place]
                        var raggio_ = place_radius[place_id]
                        xx = irandom_range(raggio_, (grid_tile_w - 1 - raggio_))
                        yy = irandom_range(raggio_, (grid_tile_h - 1 - raggio_))
                        if ds_grid_value_exists(grid_tile, (xx - raggio_), (yy - raggio_), (xx + raggio_), (yy + raggio_), -7)
                        {
                            var _temp_local_var_109 = (75000 - 1)
                            if (75000 - 1)
                                continue
                        }
                        else
                        {
                            var _min = ds_grid_get_min(grid_building, (xx - raggio_), (yy - raggio_), (xx + raggio_), (yy + raggio_))
                            var _max = ds_grid_get_max(grid_building, (xx - raggio_), (yy - raggio_), (xx + raggio_), (yy + raggio_))
                            if (_min != (0 << 0) || _max != (0 << 0))
                            {
                                var _temp_local_var_109 = (75000 - 1)
                                if (75000 - 1)
                                    continue
                            }
                            else if ds_grid_value_exists(grid_water, (xx - raggio_), (yy - raggio_), (xx + raggio_), (yy + raggio_), -1)
                            {
                                var _temp_local_var_109 = (75000 - 1)
                                if (75000 - 1)
                                    continue
                            }
                            else
                            {
                                ds_grid_set_disk(grid_building, xx, yy, raggio_, (2 << 0))
                                instance_create_depth((xx * 16), (yy * 16), ((-yy) * 16), place_obj[place_id])
                                area_obj_amount_now[area][which_place] += 1
                                amount--
                                if (amount <= 0)
                                {
                                }
                                else
                                {
                                    var _temp_local_var_109 = (75000 - 1)
                                    if (75000 - 1)
                                        continue
                                }
                            }
                        }
                        break
                    }
                    else
                    {
                        var _temp_local_var_109 = (75000 - 1)
                        if (75000 - 1)
                            continue
                    }
                }
            }
            ds_list_destroy(lista_place)
        }
        break
    case (12 << 0):
        var ii = 0
        amount = 35 * (global.sk_k[(15 << 0)])
        repeat amount
        {
            xx = irandom(grid_tile_w)
            yy = irandom(grid_tile_h)
            if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_water, xx, yy) == -7 && ds_grid_get(grid_building, xx, yy) == (0 << 0))
            {
                tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -1
                tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -1
                tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -1
                tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -1
                if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                {
                    var tx = xx * 16 + 8 + (irandom_range(-8, 8))
                    var ty = yy * 16 + 8 + (irandom_range(-8, 8))
                    instance_create_depth(tx, ty, ((-y) + 20), obj_chest_map)
                    ii++
                }
            }
        }
        var lista_decor = ds_list_create()
        for (i = 0; i < area_different_decor[area]; i++)
        {
            repeat area_decor[area][i]
                ds_list_add(lista_decor, area_decor_obj[area][i])
        }
        var _area_is_mall = area == (6 << 0)
        var _grid_tile_w = grid_tile_w
        var _grid_tile_h = grid_tile_h
        _grid_tile = grid_tile
        var _grid_building = grid_building
        var _lista_decor = lista_decor
        _random_size = ds_list_size(lista_decor) - 1
        var _decor_obj = decor_obj
        repeat area_decor_number[area]
        {
            if (_area_is_mall && scr_chance(21))
            {
                xx = irandom_range(72, 230)
                yy = irandom_range(48, 215)
            }
            else
            {
                xx = irandom(_grid_tile_w)
                yy = irandom(_grid_tile_h)
            }
            if (ds_grid_get(_grid_building, xx, yy) != (1 << 0) && ds_grid_get(_grid_tile, xx, yy) == -1 && ds_grid_get(_grid_tile, xx, (yy - 1)) == -1 && ds_grid_get(_grid_tile, (xx - 1), yy) == -1 && ds_grid_get(_grid_tile, (xx + 1), yy) == -1 && ds_grid_get(_grid_tile, xx, (yy + 1)) == -1)
            {
                var which_decor = ds_list_find_value(_lista_decor, irandom(_random_size))
                var decor_ = instance_create_depth((xx * 16), (yy * 16), (-y), _decor_obj[which_decor])
                decor_.decor_id = which_decor
                decor_.need_to_check = true
            }
        }
        ds_list_destroy(lista_decor)
        break
    case (13 << 0):
        scr_autotiling_water()
        if (is_in_raid() && area != (8 << 0))
        {
            o = obj_map_generator
            var _b_decor_is_building = decor_is_building
            var _b_image_has_entrance = b_image_has_entrance
            var _grid_indoor = grid_indoor
            with (obj_decor_parent)
            {
                if (_b_decor_is_building[decor_id] && _b_image_has_entrance[decor_id][image_index])
                {
                    var indoor_w = o.b_width[decor_id]
                    var indoor_h = o.b_height[decor_id]
                    off = 17
                    if (object_index == obj_mall_11)
                    {
                        var _starting_x = 18
                        _y = 438
                    }
                    else
                    {
                        _starting_x = off
                        _y = o.grid_tile_h + off
                    }
                    var placed = false
                    repeat (1 + o.g_indoor_h - _y - indoor_h - off)
                    {
                        _x = _starting_x
                        var _temp_local_var_215 = (1 + o.g_indoor_w - _x - indoor_w - off)
                        if ((1 + o.g_indoor_w - _x - indoor_w - off) <= 0)
                        {
                        }
                        else
                        {
                            while (true)
                            {
                                if ds_grid_value_exists(_grid_indoor, _x, _y, (_x + indoor_w - 1), (_y + indoor_h - 1), true)
                                {
                                    _x++
                                    var _temp_local_var_215 = ((1 + o.g_indoor_w - _x - indoor_w - off) - 1)
                                    if ((1 + o.g_indoor_w - _x - indoor_w - off) - 1)
                                        continue
                                    break
                                }
                                else
                                {
                                    placed = true
                                    var get_list = o.b_list[decor_id]
                                    _random_size = ds_list_size(get_list) - 1
                                    var choose_indoor = ds_list_find_value(get_list, irandom(_random_size))
                                    var tele_x = x + o.b_x[decor_id][image_index] + 8
                                    var tele_y = y + o.b_y[decor_id][image_index] + 10
                                    building_deserialize(choose_indoor, _x, _y, tele_x, tele_y)
                                    ds_grid_set_region(_grid_indoor, (_x - off), (_y - off), (_x + off + indoor_w - 1), (_y + off + indoor_h - 1), true)
                                    ds_grid_set_region(o.grid_light_indoor, (_x - off), (_y - off), (_x + off + indoor_w - 1), (_y + off + indoor_h - 1), o.b_indoor_light[decor_id])
                                }
                            }
                        }
                        if placed
                            break
                        else
                            _y++
                    }
                    if (!placed)
                        trace("Warning! Failed to place building")
                }
            }
        }
        for (xx = 1; xx < (grid_tile_w - 1); xx++)
        {
            for (yy = 1; yy < (g_indoor_h - 1); yy++)
            {
                if (ds_grid_get(grid_water, xx, yy) == -1)
                {
                    var cell = tilemap_get(layer_tileset_water, xx, yy)
                    var ti = 0
                    if (cell < 30)
                        ti = 0
                    if ((cell >= 30) < 60)
                        ti = 1
                    if ((cell >= 60) < 90)
                        ti = 2
                    if ((cell >= 90) < 120)
                        ti = 3
                    tile_sopra = ds_grid_get(grid_water, xx, (yy - 1)) == -1
                    tile_sx = ds_grid_get(grid_water, (xx - 1), yy) == -1
                    tile_dx = ds_grid_get(grid_water, (xx + 1), yy) == -1
                    tile_sotto = ds_grid_get(grid_water, xx, (yy + 1)) == -1
                    tile_sotto_sx = ds_grid_get(grid_water, (xx - 1), (yy + 1)) == -1
                    tile_sotto_dx = ds_grid_get(grid_water, (xx + 1), (yy + 1)) == -1
                    tile_sopra_sx = ds_grid_get(grid_water, (xx - 1), (yy - 1)) == -1
                    tile_sopra_dx = ds_grid_get(grid_water, (xx + 1), (yy - 1)) == -1
                    var x1 = xx * 16
                    var y1 = yy * 16
                    if (tile_sopra && tile_sotto && tile_dx && tile_sx && tile_sopra_dx && tile_sopra_sx && tile_sotto_dx && tile_sotto_sx)
                    {
                    }
                    if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                    {
                        if (!tile_sopra_dx)
                            instance_create_depth(x1, y1, 0, obj_solid_can_see)
                        if (!tile_sopra_sx)
                            instance_create_depth(x1, y1, 0, obj_solid_can_see)
                        if (!tile_sotto_dx)
                            instance_create_depth(x1, y1, 0, obj_solid_can_see)
                        if (!tile_sotto_sx)
                            instance_create_depth(x1, y1, 0, obj_solid_can_see)
                    }
                    var o_dx = water_tile_off_dx[ti]
                    var o_sx = water_tile_off_sx[ti]
                    var o_su = water_tile_off_su[ti]
                    var o_giu = water_tile_off_giu[ti]
                    if ((!tile_sopra) && tile_sotto && tile_dx && (!tile_sx))
                        instance_create_depth((x1 + o_dx), (y1 + o_giu), 0, obj_solid_can_see)
                    if ((!tile_sopra) && tile_sotto && tile_dx && tile_sx)
                        instance_create_depth(x1, (y1 + o_giu), 0, obj_solid_can_see)
                    if ((!tile_sopra) && tile_sotto && (!tile_dx) && tile_sx)
                        instance_create_depth((x1 + o_sx), (y1 + o_giu), 0, obj_solid_can_see)
                    if (tile_sopra && tile_sotto && tile_dx && (!tile_sx))
                        instance_create_depth((x1 + o_dx), y1, 0, obj_solid_can_see)
                    if (tile_sopra && tile_sotto && (!tile_dx) && tile_sx)
                        instance_create_depth((x1 + o_sx), y1, 0, obj_solid_can_see)
                    if (tile_sopra && (!tile_sotto) && tile_dx && (!tile_sx))
                        instance_create_depth((x1 + o_dx), (y1 + o_su), 0, obj_solid_can_see)
                    if (tile_sopra && (!tile_sotto) && tile_dx && tile_sx)
                        instance_create_depth(x1, (y1 + o_su), 0, obj_solid_can_see)
                    if (tile_sopra && (!tile_sotto) && (!tile_dx) && tile_sx)
                        instance_create_depth((x1 + o_sx), (y1 + o_su), 0, obj_solid_can_see)
                }
            }
        }
        if (area == (7 << 0))
        {
            for (yy = 0; yy < grid_strada_w; yy++)
            {
                for (xx = 0; xx < grid_strada_h; xx++)
                {
                    if (ds_grid_get(grid_strada, xx, yy) == true)
                    {
                        tile_sopra = ds_grid_get(grid_strada, xx, (yy - 1)) == true
                        tile_sx = ds_grid_get(grid_strada, (xx - 1), yy) == true
                        tile_dx = ds_grid_get(grid_strada, (xx + 1), yy) == true
                        tile_sotto = ds_grid_get(grid_strada, xx, (yy + 1)) == true
                        var xn = xx * 96
                        var yn = yy * 96
                        if (tile_sopra && tile_sotto && (!tile_sx) && (!tile_dx))
                        {
                            if scr_chance(50)
                            {
                                scr_place_obj_map_generation((xn - 8), (yn + 48), s_lampione1, obj_lampione, true, (19 << 0))
                                scr_place_obj_map_generation((xn + 72), (yn + 48), s_lampione1, obj_lampione, true, (19 << 0))
                            }
                            if scr_chance(30)
                            {
                                scr_place_obj_map_generation(xn, (yn + 80), s_bidone_piccolo, obj_bidone_piccolo, true, (23 << 0))
                                scr_place_obj_map_generation((xn + 80), (yn + 80), s_bidone_piccolo, obj_bidone_piccolo, true, (23 << 0))
                            }
                        }
                        if (tile_dx && tile_sx && (!tile_sopra) && (!tile_sotto))
                        {
                            if scr_chance(50)
                            {
                                scr_place_obj_map_generation((xn + 48), (yn - 8), s_lampione1, obj_lampione, true, (19 << 0))
                                scr_place_obj_map_generation((xn + 48), (yn + 72), s_lampione1, obj_lampione, true, (19 << 0))
                            }
                            if scr_chance(30)
                            {
                                scr_place_obj_map_generation((xn + 64), (yn - 8), s_bidone_piccolo, obj_bidone_piccolo, true, (23 << 0))
                                scr_place_obj_map_generation((xn + 64), (yn + 72), s_bidone_piccolo, obj_bidone_piccolo, true, (23 << 0))
                            }
                        }
                        if (tile_sotto && tile_sopra && tile_dx && tile_sx)
                        {
                            scr_place_obj_map_generation(xn, (yn - 8), s_signal_stop, obj_signal_stop, true, (24 << 0))
                            scr_place_obj_map_generation((xn + 80), (yn - 8), s_signal_stop, obj_signal_stop, true, (24 << 0))
                            scr_place_obj_map_generation(xn, (yn + 72), s_signal_stop, obj_signal_stop, true, (24 << 0))
                            scr_place_obj_map_generation((xn + 80), (yn + 72), s_signal_stop, obj_signal_stop, true, (24 << 0))
                        }
                        if (tile_sotto && (!tile_sopra) && tile_dx && tile_sx)
                            scr_place_obj_map_generation((xn + 80), (yn + 72), s_signal_stop, obj_signal_stop, true, (24 << 0))
                        if (tile_sotto && tile_sopra && tile_dx && (!tile_sx))
                            scr_place_obj_map_generation((xn + 80), (yn - 8), s_signal_stop, obj_signal_stop, true, (24 << 0))
                        if (tile_sotto && tile_sopra && (!tile_dx) && tile_sx)
                            scr_place_obj_map_generation(xn, (yn + 72), s_signal_stop, obj_signal_stop, true, (24 << 0))
                        if ((!tile_sotto) && tile_sopra && tile_dx && tile_sx)
                            scr_place_obj_map_generation(xn, (yn - 8), s_signal_stop, obj_signal_stop, true, (24 << 0))
                    }
                }
            }
        }
        if (area == (1 << 0) || area == (2 << 0) || area == (3 << 0) || area == (4 << 0))
        {
            repeat (75)
            {
                xx = 1 + (irandom(grid_tile_w - 2))
                yy = 1 + (irandom(grid_tile_h - 2))
                if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_water, xx, yy) == -7)
                    instance_create_depth((xx * 16), (yy * 16), 0, obj_enemy_rabbit)
            }
        }
        var quest_amount = 30
        for (j = 0; j < quest_amount; j++)
        {
            var quest_id_ = global.quest_state[j].id
            if (quest_id_ != "")
            {
                if (quest_id_ == "weird_phenomena")
                {
                    if (global.quest_state[j].state == "active")
                    {
                        if instance_exists(obj_elicottero_distrutto)
                            scr_add_objective_map_to_list(obj_elicottero_distrutto.x, obj_elicottero_distrutto.y, j, quest_id_, 11)
                    }
                }
                for (var k = 0; k < array_length(variable_struct_get(global.quest_database, quest_id_).objective); k++)
                {
                    var _objective_struct = variable_struct_get(global.quest_database, quest_id_).objective[k]
                    if (_objective_struct.type == "retrieve")
                    {
                        if (_objective_struct.map == area)
                        {
                            if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                            {
                                var retrive_chest_created = false
                                repeat (5500)
                                {
                                    if (retrive_chest_created == false)
                                    {
                                        xx = irandom_range(7, (grid_tile_w - 7))
                                        yy = irandom_range(7, (grid_tile_h - 7))
                                        if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_building, xx, yy) != (1 << 0) && position_empty((xx * 16), (yy * 16)))
                                        {
                                            tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -1
                                            tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -1
                                            tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -1
                                            tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -1
                                            if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                                            {
                                                tx = xx * 16 + 8 + (irandom_range(-8, 8))
                                                ty = yy * 16 + 8 + (irandom_range(-8, 8))
                                                var chest_retrive_object = _objective_struct.chest_id
                                                instance_create_depth(tx, ty, ((-y) + 10), chest_retrive_object)
                                                scr_add_objective_map_to_list(tx, ty, j, quest_id_, _objective_struct.marker_radius)
                                                retrive_chest_created = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "retrieve_analyzer")
                    {
                        if (_objective_struct.map == area)
                        {
                            if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                            {
                                var _generator_id = _objective_struct.anomaly_generator_id
                                var _object_generator = place_obj[_generator_id]
                                var _w = place_radius[_generator_id]
                                if (!instance_exists(_object_generator))
                                {
                                    var object_placed = false
                                    repeat (50000)
                                    {
                                        if (object_placed == false)
                                        {
                                            xx = irandom(grid_tile_w)
                                            yy = irandom(grid_tile_h)
                                            if (!(ds_grid_value_exists(grid_building, (xx - _w), (yy - _w), (xx + _w), (yy + _w), (1 << 0))))
                                                break
                                            else if ds_grid_value_exists(grid_tile, (xx - _w), (yy - _w), (xx + _w), (yy + _w), -7)
                                                break
                                            else if ds_grid_value_exists(grid_water, (xx - _w), (yy - _w), (xx + _w), (yy + _w), -1)
                                                break
                                            else
                                            {
                                                instance_create_depth((xx * 16), (yy * 16), 0, _object_generator)
                                                object_placed = true
                                            }
                                        }
                                    }
                                }
                                if instance_exists(_object_generator)
                                {
                                    var dis = _w * 16 / 2
                                    dir = irandom(360)
                                    xx = _object_generator.x + (lengthdir_x(dis, dir))
                                    yy = _object_generator.y + (lengthdir_y(dis, dir))
                                    instance_create_depth(xx, yy, 0, _objective_struct.chest_obj)
                                    scr_add_objective_map_to_list(xx, yy, j, quest_id_, _objective_struct.marker_radius)
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "place_analyzer")
                    {
                        if (_objective_struct.map == area)
                        {
                            if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                            {
                                _generator_id = _objective_struct.anomaly_generator_id
                                _object_generator = place_obj[_generator_id]
                                _w = place_radius[_generator_id]
                                if (!instance_exists(_object_generator))
                                {
                                    object_placed = false
                                    repeat (50000)
                                    {
                                        if (object_placed == false)
                                        {
                                            xx = irandom(grid_tile_w)
                                            yy = irandom(grid_tile_h)
                                            if (!(ds_grid_value_exists(grid_building, (xx - _w), (yy - _w), (xx + _w), (yy + _w), (1 << 0))))
                                                break
                                            else
                                            {
                                                instance_create_depth((xx * 16), (yy * 16), 0, _object_generator)
                                                object_placed = true
                                            }
                                        }
                                    }
                                }
                                if instance_exists(_object_generator)
                                {
                                    instance_create_depth(_object_generator.x, _object_generator.y, 0, _objective_struct.object)
                                    scr_add_objective_map_to_list(_object_generator.x, _object_generator.y, j, quest_id_, _objective_struct.marker_radius)
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "retrieve_equipment")
                    {
                        var _chest_obj = _objective_struct.marker_object
                        if instance_exists(_chest_obj)
                            scr_add_objective_map_to_list(_chest_obj.x, _chest_obj.y, j, quest_id_, _objective_struct.marker_radius)
                    }
                    if (_objective_struct.type == "contract")
                    {
                        var _prosegui = true
                        var _skip = false
                        if (quest_id_ == "old_man")
                        {
                            if (global.az_done[(1 << 0)] == true)
                                _prosegui = false
                        }
                        if (quest_id_ == "eliminate_the_spy" && global.quest_state[j].amount_now[1] == 0)
                            _skip = true
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max || _skip == true)
                        {
                            if (_objective_struct.map == area && _prosegui == true)
                            {
                                var enemy_marked = false
                                var _create_new = false
                                if instance_exists(_objective_struct.object)
                                {
                                    with (_objective_struct.object)
                                    {
                                        if (y < obj_map_generator.map_height)
                                        {
                                            if (enemy_marked == false)
                                            {
                                                quest_contract_is_me = true
                                                quest_contract_grid_pos = j
                                                enemy_marked = true
                                                scr_add_objective_map_to_list(x, y, j, quest_id_, _objective_struct.marker_radius)
                                            }
                                        }
                                        if (!(variable_struct_exists(_objective_struct, "already_created")))
                                            _objective_struct.already_created = false
                                        else if (_objective_struct.already_created == true)
                                        {
                                            if (enemy_marked == false)
                                            {
                                                quest_contract_is_me = true
                                                quest_contract_grid_pos = j
                                                enemy_marked = true
                                            }
                                        }
                                    }
                                }
                                if (enemy_marked == false)
                                {
                                    repeat (75000)
                                    {
                                        if (enemy_marked == false)
                                        {
                                            xx = irandom(grid_tile_w)
                                            yy = irandom(grid_tile_h)
                                            if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_building, xx, yy) != (1 << 0))
                                            {
                                                tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -1
                                                tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -1
                                                tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -1
                                                tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -1
                                                if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                                                {
                                                    enemy_marked = true
                                                    var _obj_to_kill = instance_create_depth((xx * 16), (yy * 16), 0, _objective_struct.object)
                                                    _obj_to_kill.quest_contract_is_me = true
                                                    _obj_to_kill.quest_contract_grid_pos = j
                                                    scr_add_objective_map_to_list((xx * 16), (yy * 16), j, quest_id_, _objective_struct.marker_radius)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "approach")
                    {
                        if (!instance_exists(_objective_struct.object))
                        {
                            if (_objective_struct.map == area)
                            {
                                if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                                {
                                    var enemy_placed = false
                                    repeat (50000)
                                    {
                                        if (enemy_placed == false)
                                        {
                                            xx = irandom(grid_tile_w)
                                            yy = irandom(grid_tile_h)
                                            if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_building, xx, yy) != (1 << 0))
                                            {
                                                tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -1
                                                tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -1
                                                tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -1
                                                tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -1
                                                if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                                                {
                                                    enemy_placed = true
                                                    instance_create_depth((xx * 16), (yy * 16), 0, _objective_struct.object)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if instance_exists(_objective_struct.object)
                        {
                            if (_objective_struct.map == area)
                            {
                                if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                                {
                                    if (_objective_struct.marker_radius != 0)
                                    {
                                        var _obj = _objective_struct.objective[k].object
                                        scr_add_objective_map_to_list(_obj.x, _obj.y, j, quest_id_, _objective_struct.marker_radius)
                                    }
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "interact_obj")
                    {
                        if (!instance_exists(_objective_struct.object))
                        {
                            if (_objective_struct.map == area)
                            {
                                if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                                {
                                    object_placed = false
                                    repeat (50000)
                                    {
                                        if (object_placed == false)
                                        {
                                            xx = irandom(grid_tile_w)
                                            yy = irandom(grid_tile_h)
                                            if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(grid_building, xx, yy) != (1 << 0))
                                            {
                                                tile_sopra = ds_grid_get(grid_tile, xx, (yy - 1)) == -1
                                                tile_sx = ds_grid_get(grid_tile, (xx - 1), yy) == -1
                                                tile_dx = ds_grid_get(grid_tile, (xx + 1), yy) == -1
                                                tile_sotto = ds_grid_get(grid_tile, xx, (yy + 1)) == -1
                                                if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                                                {
                                                    object_placed = true
                                                    instance_create_depth((xx * 16), (yy * 16), 0, _objective_struct.object)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if instance_exists(_objective_struct.object)
                        {
                            if (_objective_struct.map == area)
                            {
                                if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                                {
                                    if (_objective_struct.marker_radius != 0)
                                    {
                                        _obj = _objective_struct.object
                                        scr_add_objective_map_to_list(_obj.x, _obj.y, j, quest_id_, _objective_struct.marker_radius)
                                    }
                                }
                            }
                        }
                    }
                    if (_objective_struct.type == "place_marker")
                    {
                        if (_objective_struct.object == area)
                        {
                            if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                            {
                                var object_marked = false
                                object_placed = false
                                if (!instance_exists(_objective_struct.object))
                                {
                                    for (xx = 5; xx < (grid_strada_w - 5); xx++)
                                    {
                                        for (yy = 5; yy < (grid_strada_h - 5); yy++)
                                        {
                                            if (object_placed == false)
                                            {
                                                if (ds_grid_get(grid_strada, xx, yy) == true)
                                                {
                                                    if scr_chance(25)
                                                    {
                                                        instance_create_depth((xx * 96), (yy * 96), 0, _objective_struct.object)
                                                        object_placed = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if instance_exists(_objective_struct.object)
                                {
                                    with (_objective_struct.object)
                                    {
                                        if (object_marked == false)
                                        {
                                            if (x > 400 && x < (room_width - 400) && y > 400 && y < (obj_map_generator.map_height - 400))
                                            {
                                                object_marked = true
                                                obj_controller.marked_object_id = id
                                                if (_objective_struct.marker_radius != 0)
                                                    scr_add_objective_map_to_list(x, y, j, quest_id_, _objective_struct.marker_radius)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (quest_id_ == "valuable_item")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_quest_tp)
                            {
                                with (obj_quest_tp)
                                {
                                    instance_create_depth(x, y, 0, obj_chest_quest_tp)
                                    instance_destroy()
                                }
                            }
                        }
                    }
                    if (quest_id_ == "document_village_2")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_quest_document_2)
                            {
                                with (obj_quest_document_2)
                                {
                                    instance_create_depth(x, y, 0, obj_chest_quest_document_2)
                                    instance_destroy()
                                }
                            }
                        }
                    }
                    if (quest_id_ == (37 << 0))
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_lair_ghoul)
                                scr_add_objective_map_to_list(obj_lair_ghoul.x, obj_lair_ghoul.y, j, quest_id_, _objective_struct.marker_radius)
                        }
                    }
                    if (quest_id_ == "documents_sawmill")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_quest_find_usb_sawmill)
                            {
                                with (obj_quest_find_usb_sawmill)
                                {
                                    instance_create_depth(x, y, 0, obj_chest_find_usb_sawmill)
                                    instance_destroy()
                                }
                            }
                        }
                    }
                    if (quest_id_ == "old_man")
                    {
                        if (global.quest_state[j].state == "active")
                        {
                            if instance_exists(obj_house_trader_forest)
                                scr_add_objective_map_to_list(obj_house_trader_forest.x, obj_house_trader_forest.y, j, quest_id_, 8)
                        }
                    }
                    if (quest_id_ == "clear_swamp")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_faro)
                                scr_add_objective_map_to_list(obj_faro.x, obj_faro.y, j, quest_id_, 5)
                        }
                    }
                    if (quest_id_ == (94 << 0))
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_cristallo_viola)
                                scr_add_objective_map_to_list(obj_cristallo_viola.x, obj_cristallo_viola.y, j, quest_id_, _objective_struct.marker_radius)
                        }
                    }
                    if (quest_id_ == "document_village_1")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_quest_document_village_chest_spawner)
                            {
                                with (obj_quest_document_village_chest_spawner)
                                {
                                    instance_create_depth(x, y, 0, obj_chest_retrieve_document_village)
                                    instance_destroy()
                                }
                            }
                        }
                    }
                    if (quest_id_ == "laboratory_key")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_quest_laboratory_1)
                            {
                                with (obj_quest_laboratory_1)
                                {
                                    instance_create_depth(x, y, 0, obj_chest_laboratory_1)
                                    instance_destroy()
                                }
                            }
                        }
                    }
                    if (quest_id_ == "mr_junk_ring")
                    {
                        if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                        {
                            if instance_exists(obj_chest_grigoriy_ring)
                                scr_add_objective_map_to_list(obj_chest_grigoriy_ring.x, obj_chest_grigoriy_ring.y, j, quest_id_, 10)
                        }
                    }
                }
            }
        }
        var _i = 0
        repeat array_length(marker_array)
        {
            var _marker = marker_array[_i]
            switch _marker.my_id
            {
                case (1 << 0):
                    if (0 || global.az_done[(0 << 0)])
                    {
                        ds_list_add(global.list_intresting_id, _marker.my_id)
                        ds_list_add(global.list_intresting_x, (_marker.x div 16))
                        ds_list_add(global.list_intresting_y, (_marker.y div 16))
                    }
                    break
                case (2 << 0):
                    if (0 || global.az_done[(10 << 0)])
                    {
                        ds_list_add(global.list_intresting_id, _marker.my_id)
                        ds_list_add(global.list_intresting_x, (_marker.x div 16))
                        ds_list_add(global.list_intresting_y, (_marker.y div 16))
                    }
                    break
            }

            _i++
        }
        _y = 0
        repeat grid_tile_h
        {
            _x = 0
            repeat grid_tile_w
            {
                if (ds_grid_get(grid_water, _x, _y) == -1)
                    ds_grid_set(grid_tile, _x, _y, -7)
                else if (ds_grid_get(grid_tile, _x, _y) == -1)
                    ds_grid_set(grid_water, _x, _y, -7)
                _x++
            }
            _y++
        }
        var _extraction_point_array = []
        global.extraction_point_array = _extraction_point_array
        function anon_gml_Object_obj_map_generator_Alarm_2_83554_gml_Object_obj_map_generator_Alarm_2(argument0, argument1) //gml_Script_anon_gml_Object_obj_map_generator_Alarm_2_83554_gml_Object_obj_map_generator_Alarm_2
        {
            return ds_grid_get(grid_tile, argument0, argument1) == -1;
        }

        _found = undefined
        _x = 0
        repeat grid_map_w
        {
            if self._func_is_walkable(_x, (6 * train_start_y))
            {
                _found = _x
                break
            }
            else
                _x++
        }
        if (_found == undefined)
        {
            trace("Map edge walk failed")
            room_restart()
            return;
        }
        var _walk_start_x = _x
        var _walk_start_y = 6 * train_start_y
        var _walk_x = _walk_start_x
        var _walk_y = _walk_start_y
        var _walk_dir = 270
        var _max_distance_to_edge = (area == (3 << 0) ? 60 : 40)
        while true
        {
            var _distance_to_edge = min(_walk_x, _walk_y, abs(grid_tile_w - _walk_x), abs(grid_tile_h - _walk_y))
            if (_distance_to_edge < _max_distance_to_edge)
            {
                if (point_distance(_walk_x, _walk_y, (6 * train_stop_x), (6 * train_stop_y)) > 80)
                {
                    if ((!(ds_grid_get(grid_train, (_walk_x div 6), (_walk_y div 6)))) && (!(ds_grid_get(grid_strada, (_walk_x div 6), (_walk_y div 6)))))
                    {
                        if (!((area == (4 << 0) && _walk_x > 180 && _walk_y < 80)))
                        {
                            if (ds_grid_get(grid_building, _walk_x, _walk_y) != (1 << 0))
                            {
                                _off = 5
                                var _can_add = true
                                if ds_grid_value_exists(grid_water, (_walk_x - _off), (_walk_y - _off), (_walk_x + _off), (_walk_y + _off), -1)
                                    _can_add = false
                                if (area == (4 << 0))
                                    _can_add = true
                                if (_can_add == true)
                                    array_push(_extraction_point_array, _walk_x, _walk_y)
                            }
                        }
                    }
                }
            }
            switch _walk_dir
            {
                case 0:
                    if self._func_is_walkable(_walk_x, (_walk_y + 1))
                    {
                        _walk_y++
                        _walk_dir = 270
                    }
                    else if self._func_is_walkable((_walk_x + 1), _walk_y)
                        _walk_x++
                    else if self._func_is_walkable(_walk_x, (_walk_y - 1))
                    {
                        _walk_y--
                        _walk_dir = 90
                    }
                    else
                        _walk_dir = 180
                    break
                case 90:
                    if self._func_is_walkable((_walk_x + 1), _walk_y)
                    {
                        _walk_x++
                        _walk_dir = 0
                    }
                    else if self._func_is_walkable(_walk_x, (_walk_y - 1))
                        _walk_y--
                    else if self._func_is_walkable((_walk_x - 1), _walk_y)
                    {
                        _walk_x--
                        _walk_dir = 180
                    }
                    else
                        _walk_dir = 270
                    break
                case 180:
                    if self._func_is_walkable(_walk_x, (_walk_y - 1))
                    {
                        _walk_y--
                        _walk_dir = 90
                    }
                    else if self._func_is_walkable((_walk_x - 1), _walk_y)
                        _walk_x--
                    else if self._func_is_walkable(_walk_x, (_walk_y + 1))
                    {
                        _walk_y++
                        _walk_dir = 270
                    }
                    else
                        _walk_dir = 0
                    break
                case 270:
                    if self._func_is_walkable((_walk_x - 1), _walk_y)
                    {
                        _walk_x--
                        _walk_dir = 180
                    }
                    else if self._func_is_walkable(_walk_x, (_walk_y + 1))
                        _walk_y++
                    else if self._func_is_walkable((_walk_x + 1), _walk_y)
                    {
                        _walk_x++
                        _walk_dir = 0
                    }
                    else
                        _walk_dir = 90
                    break
            }

            if (_walk_x == _walk_start_x && _walk_y == _walk_start_y)
                break
            else
                continue
        }
        if (array_length(_extraction_point_array) <= 0)
        {
            trace("Warning! No extraction point found. Restarting map generator (Seed = ", global.map_seed, ")")
            room_restart()
            return;
        }
        else
        {
            var index = 2 * (irandom((array_length(_extraction_point_array) div 2) - 1))
            x1 = 16 * _extraction_point_array[index]
            y1 = 16 * (_extraction_point_array[(index + 1)])
            minimap_add_extraction_marker(x1, y1)
            instance_create_depth(x1, y1, 0, obj_extraction_point)
            _found = false
            var _temp_local_var_200 = 1000
            if (1000 <= 0)
            {
            }
            else
            {
                while (true)
                {
                    index = 2 * (irandom((array_length(_extraction_point_array) div 2) - 1))
                    var x2 = 16 * _extraction_point_array[index]
                    var y2 = 16 * (_extraction_point_array[(index + 1)])
                    if (point_distance(x1, y1, x2, y2) > 1750)
                    {
                        minimap_add_extraction_marker(x2, y2)
                        instance_create_depth(x2, y2, 0, obj_extraction_point)
                        _found = true
                        if scr_chance(25)
                        {
                            var _spawn_found = false
                            repeat (40)
                            {
                                if (_spawn_found == false)
                                {
                                    var _spawn_dis = irandom_range(96, 160)
                                    var _spawn_dir = irandom(360)
                                    var _xx = x2 + (lengthdir_x(_spawn_dis, _spawn_dir))
                                    var _yy = y2 + (lengthdir_y(_spawn_dis, _spawn_dir))
                                    if scr_check_position_free(_xx, _yy)
                                    {
                                        _spawn_found = true
                                        var _enemy = 833
                                        instance_create_depth(_xx, _yy, 0, obj_loner_enemy)
                                    }
                                }
                            }
                        }
                        break
                    }
                    else
                    {
                        var _temp_local_var_200 = (1000 - 1)
                        if (1000 - 1)
                            continue
                    }
                }
            }
            if (!_found)
                trace("Warning! Only one extraction point was placed")
        }
        if (area == (4 << 0))
        {
            _w = grid_tile_w
            var _h = grid_tile_h
            var _amount = 0
            var _amount_max = _w * _h
            for (xx = 0; xx < grid_tile_w; xx++)
            {
                for (yy = 0; yy < grid_tile_h; yy++)
                {
                    if (ds_grid_get(grid_water, xx, yy) == -1)
                        _amount += 1
                }
            }
            if (_amount > (_amount_max * 0.6))
            {
                trace("Warning! Not enough land on map")
                room_restart()
                return;
            }
        }
        break
    case (14 << 0):
        instance_create_depth(0, 0, 0, obj_vertex_grass)
        break
    case (15 << 0):
        if (area == (6 << 0))
        {
            if instance_exists(obj_enemy_spawner_killa)
            {
                var _list_killa = ds_list_create()
                with (obj_enemy_spawner_killa)
                    ds_list_add(_list_killa, id)
                _random_size = ds_list_size(_list_killa) - 1
                var _choosen_id = ds_list_find_value(_list_killa, irandom(_random_size))
                instance_create_depth(_choosen_id.x, _choosen_id.y, 0, obj_boss_killa)
                with (obj_enemy_spawner_killa)
                    instance_destroy()
            }
        }
        if (area == (6 << 0))
        {
            k = 0
            if instance_exists(obj_enemy_spawner_mall)
            {
                with (obj_enemy_spawner_mall)
                {
                    global.mall_spawn_id[k] = k
                    global.mall_spawn_x[k] = x
                    global.mall_spawn_y[k] = y
                    k++
                }
                var _list_spawn = ds_list_create()
                for (i = 0; i < array_length_1d(global.spmall_obj); i++)
                {
                    repeat global.spmall_chance[i]
                        ds_list_add(_list_spawn, i)
                }
                _random_size = ds_list_size(_list_spawn) - 1
                var _amount_indoor = 20
                repeat _amount_indoor
                {
                    var _quante_posizioni = array_length_1d(global.mall_spawn_id)
                    var _pos_id = irandom(_quante_posizioni - 1)
                    var _spawn_mall_x = global.mall_spawn_x[_pos_id]
                    var _spawn_mall_y = global.mall_spawn_y[_pos_id]
                    var _index = ds_list_find_value(_list_spawn, irandom(_random_size))
                    repeat global.spmall_amount[_index]
                        instance_create_depth(_spawn_mall_x, _spawn_mall_y, 0, global.spmall_obj[_index])
                }
                with (obj_enemy_spawner_mall)
                    instance_destroy()
            }
        }
        var player_spawn_x = train_start_x * 96
        var player_spawn_y = train_start_y * 96
        if (area == (8 << 0))
        {
            player_spawn_x = 2400
            player_spawn_y = 2860
        }
        var oggetto_train = instance_create_depth((train_start_x * 96), (train_start_y * 96 + 56), 0, obj_train)
        oggetto_train.stop_x = train_stop_x * 96
        oggetto_train.stop_y = train_stop_y * 96
        instance_create_depth(player_spawn_x, player_spawn_y, 0, obj_surface_aim)
        instance_create_depth(player_spawn_x, player_spawn_y, 0, obj_camera)
        can_draw_surf_floor2 = true
        obj_decor_parent.alarm[0] = 1
        obj_meteo_controller.alarm[0] = 10
        obj_object_shadow.alarm[0] = 1
        obj_minimap.alarm[0] = 2
        obj_controller.alarm[0] = 2
        with (obj_fog_setup)
            alarm[0] = 1
        break
    case (16 << 0):
        _amount = 12
        if (quest_is_active("the_war_ga") || quest_is_active("the_war_cc"))
            _amount = 20
        var _n_max_gruppi_disponibili = array_length_1d(global.d_npc_id)
        var _list = ds_list_create()
        for (i = 0; i < array_length_2d(global.d_npc_map, area); i++)
        {
            _list_amount_messi[i] = 0
            repeat global.d_npc_map[area][i]
                ds_list_add(_list, i)
        }
        _random_size = ds_list_size(_list) - 1
        var _messi = 0
        repeat (500)
        {
            if (_messi < _amount)
            {
                var _quale_mettere = ds_list_find_value(_list, irandom(_random_size))
                if (area == (2 << 0) && _messi == 0)
                    _quale_mettere = (9 << 0)
                var _aggiungere = true
                if (global.d_npc_unique[_quale_mettere] == true && _list_amount_messi[_quale_mettere] != 0)
                    _aggiungere = false
                var _quest_id = global.d_npc_quest_req[_quale_mettere]
                if (_quest_id != "")
                {
                    if (!quest_is_complete(_quest_id))
                        _aggiungere = false
                }
                if (_aggiungere == true)
                {
                    ds_list_add(global.list_dynamic_npc, _quale_mettere)
                    _list_amount_messi[_quale_mettere] += 1
                    _messi += 1
                }
            }
        }
        ds_list_destroy(_list)
        var _list_temp_x = ds_list_create()
        var _list_temp_y = ds_list_create()
        var _list_temp_free_x = ds_list_create()
        var _list_temp_free_y = ds_list_create()
        var _motion = obj_controller.grid_motion
        for (xx = 5; xx < (grid_tile_w - 5); xx++)
        {
            for (yy = 5; yy < (grid_tile_h - 5); yy++)
            {
                if (ds_grid_get(grid_tile, xx, yy) == -1)
                {
                    if (ds_grid_get(_motion, xx, yy) == 0 && ds_grid_get(grid_water, xx, yy) == -7 && ds_grid_get(grid_building, xx, yy) != (2 << 0))
                    {
                        ds_list_add(_list_temp_free_x, (xx * 16 + 8))
                        ds_list_add(_list_temp_free_y, (yy * 16 + 8))
                        ds_list_add(_list_temp_x, (xx * 16))
                        ds_list_add(_list_temp_y, (yy * 16))
                    }
                }
            }
        }
        repeat _amount
        {
            var _pos_trovata = false
            repeat (1000)
            {
                if (_pos_trovata == false)
                {
                    var _list_pos_size = ds_list_size(_list_temp_x)
                    var _id_pos = irandom(_list_pos_size - 1)
                    ds_list_add(global.list_dynamic_npc_x, ds_list_find_value(_list_temp_x, _id_pos))
                    ds_list_add(global.list_dynamic_npc_y, ds_list_find_value(_list_temp_y, _id_pos))
                    _pos_trovata = true
                }
            }
        }
        for (i = 0; i < _amount; i++)
        {
            var _id_group = array_get(global.d_npc_id, ds_list_find_value(global.list_dynamic_npc, i))
            var _create_x = ds_list_find_value(global.list_dynamic_npc_x, i)
            var _create_y = ds_list_find_value(global.list_dynamic_npc_y, i)
            _pos_trovata = false
            var _prova_x = []
            var _prova_y = []
            var _path_amount = 0
            var _path_amount_max = 3
            _list_pos_size = ds_list_size(_list_temp_free_x)
            repeat _path_amount_max
            {
                if (_path_amount < _path_amount_max)
                {
                    _id_pos = irandom(_list_pos_size - 1)
                    _prova_x[_path_amount] = ds_list_find_value(_list_temp_free_x, _id_pos)
                    _prova_y[_path_amount] = ds_list_find_value(_list_temp_free_y, _id_pos)
                    _path_amount++
                }
            }
            if (global.d_npc_amount[_id_group] > 0)
            {
                var list_new_x = ds_list_create()
                var list_new_y = ds_list_create()
                for (xx = -2; xx < 3; xx++)
                {
                    for (yy = -2; yy < 3; yy++)
                    {
                        var _gx = _create_x div 16
                        var _gy = _create_y div 16
                        if (ds_grid_get(obj_controller.grid_motion, (_gx + xx), (_gy + yy)) == 0 && ds_grid_get(grid_tile, (_gx + xx), (_gy + yy)) == -1 && ds_grid_get(grid_water, (_gx + xx), (_gy + yy)) == -7)
                        {
                            var _new_real_x = (_gx + xx) * 16
                            var _new_real_y = (_gy + yy) * 16
                            if (!(collision_line((_create_x + 8), (_create_y + 8), (_new_real_x + 8), (_new_real_y + 8), obj_solid, false, true)))
                            {
                                ds_list_add(list_new_x, (_gx + xx))
                                ds_list_add(list_new_y, (_gy + yy))
                            }
                        }
                    }
                }
                repeat global.d_npc_amount[_id_group]
                {
                    var _choose_index = irandom(ds_list_size(list_new_x) - 1)
                    var _new_x = (ds_list_find_value(list_new_x, _choose_index)) * 16
                    var _new_y = (ds_list_find_value(list_new_y, _choose_index)) * 16
                    var _group_created = instance_create_depth((_new_x + 8), (_new_y + 8), 0, global.d_npc_object[_id_group])
                    _group_created.follow_path = true
                    _group_created.path_goto_x = _prova_x
                    _group_created.path_goto_y = _prova_y
                }
                ds_list_destroy(list_new_x)
                ds_list_destroy(list_new_y)
            }
        }
        ds_list_destroy(_list_temp_x)
        ds_list_destroy(_list_temp_y)
        ds_list_destroy(_list_temp_free_x)
        ds_list_destroy(_list_temp_free_y)
        break
    case (17 << 0):
        j = 0
        with (obj_npc_parent)
        {
            if (y < obj_map_generator.map_height)
            {
                if (object_index != obj_enemy_rabbit)
                {
                    global.list_n_id[j] = id
                    global.list_n_npc_id[j] = npc_id
                    global.list_n_hp[j] = hp
                    global.list_n_x[j] = x
                    global.list_n_y[j] = y
                    global.list_n_follow_path[j] = follow_path
                    global.list_n_power[j] = npc_get_power(npc_id)
                    j++
                }
            }
        }
        with (obj_npc_parent)
            path_create_now = true
        if (!is_in_hub())
        {
            obj_controller.alarm[2] = 1
            obj_controller.alarm[4] = 2
            with (obj_npc_parent)
                state = npc_get_state_patrol(npc_id)
        }
        break
    case (18 << 0):
        break
}

if (state != (20 << 0) && debug == false)
    alarm[2] = time_beetween_generation
switch state
{
    case (0 << 0):
        state = (1 << 0)
        break
    case (1 << 0):
        state = (2 << 0)
        break
    case (2 << 0):
        state = (3 << 0)
        break
    case (3 << 0):
        state = (4 << 0)
        break
    case (4 << 0):
        state = (5 << 0)
        break
    case (5 << 0):
        state = (6 << 0)
        break
    case (6 << 0):
        state = (7 << 0)
        break
    case (7 << 0):
        state = (8 << 0)
        break
    case (8 << 0):
        state = (9 << 0)
        break
    case (9 << 0):
        state = (10 << 0)
        break
    case (10 << 0):
        state = (11 << 0)
        break
    case (11 << 0):
        state = (12 << 0)
        break
    case (12 << 0):
        state = (13 << 0)
        break
    case (13 << 0):
        state = (14 << 0)
        break
    case (14 << 0):
        state = (15 << 0)
        break
    case (15 << 0):
        state = (16 << 0)
        break
    case (16 << 0):
        state = (17 << 0)
        break
    case (17 << 0):
        state = (18 << 0)
        break
    case (18 << 0):
        state = (19 << 0)
        break
    case (19 << 0):
        break
}

