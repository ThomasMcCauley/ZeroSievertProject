vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_texcoord()
vertex_format_add_custom(1, 4)
vertex_format_add_custom(1, 4)
global.grass_vertex_format = vertex_format_end()
function scr_dynamic_grass(argument0, argument1) //gml_Script_scr_dynamic_grass
{
    argument1 *= settings_get("amount grass")
    if (argument1 <= 0)
        return;
    var _region_pixel_width = region_pixel_width
    var _region_pixel_height = region_pixel_height
    var _region_width = region_width
    var _region_height = region_height
    var _vbuff_array = vbuff_array
    var g_w = obj_map_generator.grid_water
    var g_t = obj_map_generator.grid_tile
    var g_f2 = obj_map_generator.grid_floor2
    var _area = obj_map_generator.area
    var _area_is_mall = _area == (6 << 0)
    var _swampy_grass = (_area == (4 << 0) && argument0 == (6 << 0))
    var _check_chests = instance_exists(obj_chest_general)
    var _grass_image = global.grass_image[argument0]
    var _image_randomizer = sprite_get_number(_grass_image) - 1
    var spr_w = sprite_get_width(_grass_image)
    var spr_h = sprite_get_height(_grass_image)
    gpu_set_ztestenable(true)
    var _uv_cache_l = array_create(sprite_get_number(_grass_image), undefined)
    var _uv_cache_t = array_create(sprite_get_number(_grass_image), undefined)
    var _uv_cache_r = array_create(sprite_get_number(_grass_image), undefined)
    var _uv_cache_b = array_create(sprite_get_number(_grass_image), undefined)
    var _i = 0
    repeat sprite_get_number(_grass_image)
    {
        var _uvs = sprite_get_uvs(_grass_image, _i)
        _uv_cache_l[_i] = _uvs[0]
        _uv_cache_t[_i] = _uvs[1]
        _uv_cache_r[_i] = _uvs[2]
        _uv_cache_b[_i] = _uvs[3]
        _i++
    }
    if (argument0 == (7 << 0))
    {
        if instance_exists(obj_anomaly_emitter_parent)
        {
            with (obj_anomaly_emitter_parent)
            {
                repeat argument1
                {
                    var rand_dist = random(24)
                    var rand_dir = random(360)
                    var left = floor(x + (lengthdir_x(rand_dist, rand_dir)))
                    var top = floor(y + (lengthdir_y(rand_dist, rand_dir)))
                    if is_in_raid()
                    {
                        var _region_x = clamp(floor(left / _region_pixel_width), 0, (_region_width - 1))
                        var _region_y = clamp(floor(top / _region_pixel_height), 0, (_region_height - 1))
                        var _region_index = _region_x + _region_width * _region_y
                        var _vbuff = _vbuff_array[_region_index]
                        var xx = left + spr_w / 2
                        var yy = top + spr_h / 2
                        var x1 = xx div 16
                        var y1 = yy div 16
                        if _swampy_grass
                        {
                            if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                            {
                            }
                            else if (ds_grid_get(g_t, x1, y1) == -7)
                            {
                            }
                            else
                            {
                                var gf2 = ds_grid_get(g_f2, x1, y1)
                                if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                                {
                                    if scr_chance(95)
                                    {
                                    }
                                    else if (gf2 == 10 && argument0 != (9 << 0))
                                    {
                                    }
                                    else if _check_chests
                                    {
                                        var near = instance_nearest(xx, yy, obj_chest_general)
                                        if (point_distance(xx, yy, near.x, near.y) < 16)
                                        {
                                            if scr_chance(100)
                                            {
                                            }
                                            else if _area_is_mall
                                            {
                                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                                {
                                                }
                                                else
                                                {
                                                    var im_ind = irandom(_image_randomizer)
                                                    var uv_left = _uv_cache_l[im_ind]
                                                    var uv_top = _uv_cache_t[im_ind]
                                                    var uv_right = _uv_cache_r[im_ind]
                                                    var uv_bottom = _uv_cache_b[im_ind]
                                                    var right = left + spr_w
                                                    var bottom = top + spr_h
                                                    var dep = (-bottom) + 2
                                                    vertex_position_3d(_vbuff, left, top, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, top, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, top, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                }
                                            }
                                            else
                                            {
                                                var im_ind = irandom(_image_randomizer)
                                                var uv_left = _uv_cache_l[im_ind]
                                                var uv_top = _uv_cache_t[im_ind]
                                                var uv_right = _uv_cache_r[im_ind]
                                                var uv_bottom = _uv_cache_b[im_ind]
                                                var right = left + spr_w
                                                var bottom = top + spr_h
                                                var dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                var im_ind = irandom(_image_randomizer)
                                                var uv_left = _uv_cache_l[im_ind]
                                                var uv_top = _uv_cache_t[im_ind]
                                                var uv_right = _uv_cache_r[im_ind]
                                                var uv_bottom = _uv_cache_b[im_ind]
                                                var right = left + spr_w
                                                var bottom = top + spr_h
                                                var dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if (gf2 == 10 && argument0 != (9 << 0))
                                {
                                }
                                else if _check_chests
                                {
                                    var near = instance_nearest(xx, yy, obj_chest_general)
                                    if (point_distance(xx, yy, near.x, near.y) < 16)
                                    {
                                        if scr_chance(100)
                                        {
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                var im_ind = irandom(_image_randomizer)
                                                var uv_left = _uv_cache_l[im_ind]
                                                var uv_top = _uv_cache_t[im_ind]
                                                var uv_right = _uv_cache_r[im_ind]
                                                var uv_bottom = _uv_cache_b[im_ind]
                                                var right = left + spr_w
                                                var bottom = top + spr_h
                                                var dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    var im_ind = irandom(_image_randomizer)
                                    var uv_left = _uv_cache_l[im_ind]
                                    var uv_top = _uv_cache_t[im_ind]
                                    var uv_right = _uv_cache_r[im_ind]
                                    var uv_bottom = _uv_cache_b[im_ind]
                                    var right = left + spr_w
                                    var bottom = top + spr_h
                                    var dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                        }
                        else if (ds_grid_get(g_w, x1, y1) == -1)
                        {
                        }
                        else if (ds_grid_get(g_t, x1, y1) == -7)
                        {
                        }
                        else
                        {
                            var gf2 = ds_grid_get(g_f2, x1, y1)
                            if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                            {
                                if scr_chance(95)
                                {
                                }
                                else if (gf2 == 10 && argument0 != (9 << 0))
                                {
                                }
                                else if _check_chests
                                {
                                    var near = instance_nearest(xx, yy, obj_chest_general)
                                    if (point_distance(xx, yy, near.x, near.y) < 16)
                                    {
                                        if scr_chance(100)
                                        {
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                var im_ind = irandom(_image_randomizer)
                                                var uv_left = _uv_cache_l[im_ind]
                                                var uv_top = _uv_cache_t[im_ind]
                                                var uv_right = _uv_cache_r[im_ind]
                                                var uv_bottom = _uv_cache_b[im_ind]
                                                var right = left + spr_w
                                                var bottom = top + spr_h
                                                var dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    var im_ind = irandom(_image_randomizer)
                                    var uv_left = _uv_cache_l[im_ind]
                                    var uv_top = _uv_cache_t[im_ind]
                                    var uv_right = _uv_cache_r[im_ind]
                                    var uv_bottom = _uv_cache_b[im_ind]
                                    var right = left + spr_w
                                    var bottom = top + spr_h
                                    var dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if (gf2 == 10 && argument0 != (9 << 0))
                            {
                            }
                            else if _check_chests
                            {
                                var near = instance_nearest(xx, yy, obj_chest_general)
                                if (point_distance(xx, yy, near.x, near.y) < 16)
                                {
                                    if scr_chance(100)
                                    {
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            var im_ind = irandom(_image_randomizer)
                                            var uv_left = _uv_cache_l[im_ind]
                                            var uv_top = _uv_cache_t[im_ind]
                                            var uv_right = _uv_cache_r[im_ind]
                                            var uv_bottom = _uv_cache_b[im_ind]
                                            var right = left + spr_w
                                            var bottom = top + spr_h
                                            var dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        var im_ind = irandom(_image_randomizer)
                                        var uv_left = _uv_cache_l[im_ind]
                                        var uv_top = _uv_cache_t[im_ind]
                                        var uv_right = _uv_cache_r[im_ind]
                                        var uv_bottom = _uv_cache_b[im_ind]
                                        var right = left + spr_w
                                        var bottom = top + spr_h
                                        var dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    var im_ind = irandom(_image_randomizer)
                                    var uv_left = _uv_cache_l[im_ind]
                                    var uv_top = _uv_cache_t[im_ind]
                                    var uv_right = _uv_cache_r[im_ind]
                                    var uv_bottom = _uv_cache_b[im_ind]
                                    var right = left + spr_w
                                    var bottom = top + spr_h
                                    var dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    var im_ind = irandom(_image_randomizer)
                                    var uv_left = _uv_cache_l[im_ind]
                                    var uv_top = _uv_cache_t[im_ind]
                                    var uv_right = _uv_cache_r[im_ind]
                                    var uv_bottom = _uv_cache_b[im_ind]
                                    var right = left + spr_w
                                    var bottom = top + spr_h
                                    var dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                var im_ind = irandom(_image_randomizer)
                                var uv_left = _uv_cache_l[im_ind]
                                var uv_top = _uv_cache_t[im_ind]
                                var uv_right = _uv_cache_r[im_ind]
                                var uv_bottom = _uv_cache_b[im_ind]
                                var right = left + spr_w
                                var bottom = top + spr_h
                                var dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                    }
                    else
                    {
                        var im_ind = irandom(_image_randomizer)
                        var uv_left = _uv_cache_l[im_ind]
                        var uv_top = _uv_cache_t[im_ind]
                        var uv_right = _uv_cache_r[im_ind]
                        var uv_bottom = _uv_cache_b[im_ind]
                        var right = left + spr_w
                        var bottom = top + spr_h
                        var dep = (-bottom) + 2
                        vertex_position_3d(_vbuff, left, top, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, bottom, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                    }
                }
            }
        }
    }
    else if (argument0 == (9 << 0))
    {
        if instance_exists(obj_cristallo_viola)
        {
            var _range_min = global.grass_range_min[argument0]
            var _range_max = global.grass_range_max[argument0]
            with (obj_cristallo_viola)
            {
                repeat argument1
                {
                    rand_dist = irandom_range(_range_min, _range_max)
                    rand_dir = random(360)
                    left = floor(x + (lengthdir_x(rand_dist, rand_dir)))
                    top = floor(y + (lengthdir_y(rand_dist, rand_dir)))
                    if is_in_raid()
                    {
                        _region_x = clamp(floor(left / _region_pixel_width), 0, (_region_width - 1))
                        _region_y = clamp(floor(top / _region_pixel_height), 0, (_region_height - 1))
                        _region_index = _region_x + _region_width * _region_y
                        _vbuff = _vbuff_array[_region_index]
                        xx = left + spr_w / 2
                        yy = top + spr_h / 2
                        x1 = xx div 16
                        y1 = yy div 16
                        if _swampy_grass
                        {
                            if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                            {
                            }
                            else if (ds_grid_get(g_t, x1, y1) == -7)
                            {
                            }
                            else
                            {
                                gf2 = ds_grid_get(g_f2, x1, y1)
                                if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                                {
                                    if scr_chance(95)
                                    {
                                    }
                                    else if (gf2 == 10 && argument0 != (9 << 0))
                                    {
                                    }
                                    else if _check_chests
                                    {
                                        near = instance_nearest(xx, yy, obj_chest_general)
                                        if (point_distance(xx, yy, near.x, near.y) < 16)
                                        {
                                            if scr_chance(100)
                                            {
                                            }
                                            else if _area_is_mall
                                            {
                                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                                {
                                                }
                                                else
                                                {
                                                    im_ind = irandom(_image_randomizer)
                                                    uv_left = _uv_cache_l[im_ind]
                                                    uv_top = _uv_cache_t[im_ind]
                                                    uv_right = _uv_cache_r[im_ind]
                                                    uv_bottom = _uv_cache_b[im_ind]
                                                    right = left + spr_w
                                                    bottom = top + spr_h
                                                    dep = (-bottom) + 2
                                                    vertex_position_3d(_vbuff, left, top, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, top, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, top, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                                    vertex_float1(_vbuff, 1)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                    vertex_float1(_vbuff, 0)
                                                    vertex_float1(_vbuff, yy)
                                                }
                                            }
                                            else
                                            {
                                                im_ind = irandom(_image_randomizer)
                                                uv_left = _uv_cache_l[im_ind]
                                                uv_top = _uv_cache_t[im_ind]
                                                uv_right = _uv_cache_r[im_ind]
                                                uv_bottom = _uv_cache_b[im_ind]
                                                right = left + spr_w
                                                bottom = top + spr_h
                                                dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                im_ind = irandom(_image_randomizer)
                                                uv_left = _uv_cache_l[im_ind]
                                                uv_top = _uv_cache_t[im_ind]
                                                uv_right = _uv_cache_r[im_ind]
                                                uv_bottom = _uv_cache_b[im_ind]
                                                right = left + spr_w
                                                bottom = top + spr_h
                                                dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if (gf2 == 10 && argument0 != (9 << 0))
                                {
                                }
                                else if _check_chests
                                {
                                    near = instance_nearest(xx, yy, obj_chest_general)
                                    if (point_distance(xx, yy, near.x, near.y) < 16)
                                    {
                                        if scr_chance(100)
                                        {
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                im_ind = irandom(_image_randomizer)
                                                uv_left = _uv_cache_l[im_ind]
                                                uv_top = _uv_cache_t[im_ind]
                                                uv_right = _uv_cache_r[im_ind]
                                                uv_bottom = _uv_cache_b[im_ind]
                                                right = left + spr_w
                                                bottom = top + spr_h
                                                dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                        }
                        else if (ds_grid_get(g_w, x1, y1) == -1)
                        {
                        }
                        else if (ds_grid_get(g_t, x1, y1) == -7)
                        {
                        }
                        else
                        {
                            gf2 = ds_grid_get(g_f2, x1, y1)
                            if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                            {
                                if scr_chance(95)
                                {
                                }
                                else if (gf2 == 10 && argument0 != (9 << 0))
                                {
                                }
                                else if _check_chests
                                {
                                    near = instance_nearest(xx, yy, obj_chest_general)
                                    if (point_distance(xx, yy, near.x, near.y) < 16)
                                    {
                                        if scr_chance(100)
                                        {
                                        }
                                        else if _area_is_mall
                                        {
                                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                            {
                                            }
                                            else
                                            {
                                                im_ind = irandom(_image_randomizer)
                                                uv_left = _uv_cache_l[im_ind]
                                                uv_top = _uv_cache_t[im_ind]
                                                uv_right = _uv_cache_r[im_ind]
                                                uv_bottom = _uv_cache_b[im_ind]
                                                right = left + spr_w
                                                bottom = top + spr_h
                                                dep = (-bottom) + 2
                                                vertex_position_3d(_vbuff, left, top, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, top, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                                vertex_float1(_vbuff, 1)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, right, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                                vertex_position_3d(_vbuff, left, bottom, dep)
                                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                                vertex_float1(_vbuff, 0)
                                                vertex_float1(_vbuff, yy)
                                            }
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if (gf2 == 10 && argument0 != (9 << 0))
                            {
                            }
                            else if _check_chests
                            {
                                near = instance_nearest(xx, yy, obj_chest_general)
                                if (point_distance(xx, yy, near.x, near.y) < 16)
                                {
                                    if scr_chance(100)
                                    {
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                    }
                    else
                    {
                        im_ind = irandom(_image_randomizer)
                        uv_left = _uv_cache_l[im_ind]
                        uv_top = _uv_cache_t[im_ind]
                        uv_right = _uv_cache_r[im_ind]
                        uv_bottom = _uv_cache_b[im_ind]
                        right = left + spr_w
                        bottom = top + spr_h
                        dep = (-bottom) + 2
                        vertex_position_3d(_vbuff, left, top, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, bottom, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                    }
                }
            }
        }
    }
    else
    {
        var _max_y = (is_in_raid() ? (obj_map_generator.map_height - 16) : room_height)
        repeat argument1
        {
            left = irandom_range((-spr_w), room_width)
            top = irandom_range((-spr_h), _max_y)
            if is_in_raid()
            {
                _region_x = clamp(floor(left / _region_pixel_width), 0, (_region_width - 1))
                _region_y = clamp(floor(top / _region_pixel_height), 0, (_region_height - 1))
                _region_index = _region_x + _region_width * _region_y
                _vbuff = _vbuff_array[_region_index]
                xx = left + spr_w / 2
                yy = top + spr_h / 2
                x1 = xx div 16
                y1 = yy div 16
                if _swampy_grass
                {
                    if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                    {
                    }
                    else if (ds_grid_get(g_t, x1, y1) == -7)
                    {
                    }
                    else
                    {
                        gf2 = ds_grid_get(g_f2, x1, y1)
                        if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                        {
                            if scr_chance(95)
                            {
                            }
                            else if (gf2 == 10 && argument0 != (9 << 0))
                            {
                            }
                            else if _check_chests
                            {
                                near = instance_nearest(xx, yy, obj_chest_general)
                                if (point_distance(xx, yy, near.x, near.y) < 16)
                                {
                                    if scr_chance(100)
                                    {
                                    }
                                    else if _area_is_mall
                                    {
                                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                        {
                                        }
                                        else
                                        {
                                            im_ind = irandom(_image_randomizer)
                                            uv_left = _uv_cache_l[im_ind]
                                            uv_top = _uv_cache_t[im_ind]
                                            uv_right = _uv_cache_r[im_ind]
                                            uv_bottom = _uv_cache_b[im_ind]
                                            right = left + spr_w
                                            bottom = top + spr_h
                                            dep = (-bottom) + 2
                                            vertex_position_3d(_vbuff, left, top, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, top, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_top)
                                            vertex_float1(_vbuff, 1)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, right, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                            vertex_position_3d(_vbuff, left, bottom, dep)
                                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                            vertex_float1(_vbuff, 0)
                                            vertex_float1(_vbuff, yy)
                                        }
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else if (gf2 == 10 && argument0 != (9 << 0))
                        {
                        }
                        else if _check_chests
                        {
                            near = instance_nearest(xx, yy, obj_chest_general)
                            if (point_distance(xx, yy, near.x, near.y) < 16)
                            {
                                if scr_chance(100)
                                {
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else if _area_is_mall
                        {
                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                            {
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else
                        {
                            im_ind = irandom(_image_randomizer)
                            uv_left = _uv_cache_l[im_ind]
                            uv_top = _uv_cache_t[im_ind]
                            uv_right = _uv_cache_r[im_ind]
                            uv_bottom = _uv_cache_b[im_ind]
                            right = left + spr_w
                            bottom = top + spr_h
                            dep = (-bottom) + 2
                            vertex_position_3d(_vbuff, left, top, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, bottom, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                        }
                    }
                }
                else if (ds_grid_get(g_w, x1, y1) == -1)
                {
                }
                else if (ds_grid_get(g_t, x1, y1) == -7)
                {
                }
                else
                {
                    gf2 = ds_grid_get(g_f2, x1, y1)
                    if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                    {
                        if scr_chance(95)
                        {
                        }
                        else if (gf2 == 10 && argument0 != (9 << 0))
                        {
                        }
                        else if _check_chests
                        {
                            near = instance_nearest(xx, yy, obj_chest_general)
                            if (point_distance(xx, yy, near.x, near.y) < 16)
                            {
                                if scr_chance(100)
                                {
                                }
                                else if _area_is_mall
                                {
                                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                    {
                                    }
                                    else
                                    {
                                        im_ind = irandom(_image_randomizer)
                                        uv_left = _uv_cache_l[im_ind]
                                        uv_top = _uv_cache_t[im_ind]
                                        uv_right = _uv_cache_r[im_ind]
                                        uv_bottom = _uv_cache_b[im_ind]
                                        right = left + spr_w
                                        bottom = top + spr_h
                                        dep = (-bottom) + 2
                                        vertex_position_3d(_vbuff, left, top, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, top, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_top)
                                        vertex_float1(_vbuff, 1)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, right, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                        vertex_position_3d(_vbuff, left, bottom, dep)
                                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                        vertex_float1(_vbuff, 0)
                                        vertex_float1(_vbuff, yy)
                                    }
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else if _area_is_mall
                        {
                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                            {
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else
                        {
                            im_ind = irandom(_image_randomizer)
                            uv_left = _uv_cache_l[im_ind]
                            uv_top = _uv_cache_t[im_ind]
                            uv_right = _uv_cache_r[im_ind]
                            uv_bottom = _uv_cache_b[im_ind]
                            right = left + spr_w
                            bottom = top + spr_h
                            dep = (-bottom) + 2
                            vertex_position_3d(_vbuff, left, top, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, bottom, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                        }
                    }
                    else if (gf2 == 10 && argument0 != (9 << 0))
                    {
                    }
                    else if _check_chests
                    {
                        near = instance_nearest(xx, yy, obj_chest_general)
                        if (point_distance(xx, yy, near.x, near.y) < 16)
                        {
                            if scr_chance(100)
                            {
                            }
                            else if _area_is_mall
                            {
                                if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                {
                                }
                                else
                                {
                                    im_ind = irandom(_image_randomizer)
                                    uv_left = _uv_cache_l[im_ind]
                                    uv_top = _uv_cache_t[im_ind]
                                    uv_right = _uv_cache_r[im_ind]
                                    uv_bottom = _uv_cache_b[im_ind]
                                    right = left + spr_w
                                    bottom = top + spr_h
                                    dep = (-bottom) + 2
                                    vertex_position_3d(_vbuff, left, top, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, top, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_top)
                                    vertex_float1(_vbuff, 1)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, right, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                    vertex_position_3d(_vbuff, left, bottom, dep)
                                    vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                    vertex_float1(_vbuff, 0)
                                    vertex_float1(_vbuff, yy)
                                }
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else if _area_is_mall
                        {
                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                            {
                            }
                            else
                            {
                                im_ind = irandom(_image_randomizer)
                                uv_left = _uv_cache_l[im_ind]
                                uv_top = _uv_cache_t[im_ind]
                                uv_right = _uv_cache_r[im_ind]
                                uv_bottom = _uv_cache_b[im_ind]
                                right = left + spr_w
                                bottom = top + spr_h
                                dep = (-bottom) + 2
                                vertex_position_3d(_vbuff, left, top, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, top, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_top)
                                vertex_float1(_vbuff, 1)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, right, bottom, dep)
                                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                                vertex_position_3d(_vbuff, left, bottom, dep)
                                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                                vertex_float1(_vbuff, 0)
                                vertex_float1(_vbuff, yy)
                            }
                        }
                        else
                        {
                            im_ind = irandom(_image_randomizer)
                            uv_left = _uv_cache_l[im_ind]
                            uv_top = _uv_cache_t[im_ind]
                            uv_right = _uv_cache_r[im_ind]
                            uv_bottom = _uv_cache_b[im_ind]
                            right = left + spr_w
                            bottom = top + spr_h
                            dep = (-bottom) + 2
                            vertex_position_3d(_vbuff, left, top, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, bottom, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                        }
                    }
                    else if _area_is_mall
                    {
                        if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                        {
                        }
                        else
                        {
                            im_ind = irandom(_image_randomizer)
                            uv_left = _uv_cache_l[im_ind]
                            uv_top = _uv_cache_t[im_ind]
                            uv_right = _uv_cache_r[im_ind]
                            uv_bottom = _uv_cache_b[im_ind]
                            right = left + spr_w
                            bottom = top + spr_h
                            dep = (-bottom) + 2
                            vertex_position_3d(_vbuff, left, top, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, top, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_top)
                            vertex_float1(_vbuff, 1)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, right, bottom, dep)
                            vertex_texcoord(_vbuff, uv_right, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                            vertex_position_3d(_vbuff, left, bottom, dep)
                            vertex_texcoord(_vbuff, uv_left, uv_bottom)
                            vertex_float1(_vbuff, 0)
                            vertex_float1(_vbuff, yy)
                        }
                    }
                    else
                    {
                        im_ind = irandom(_image_randomizer)
                        uv_left = _uv_cache_l[im_ind]
                        uv_top = _uv_cache_t[im_ind]
                        uv_right = _uv_cache_r[im_ind]
                        uv_bottom = _uv_cache_b[im_ind]
                        right = left + spr_w
                        bottom = top + spr_h
                        dep = (-bottom) + 2
                        vertex_position_3d(_vbuff, left, top, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, top, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_top)
                        vertex_float1(_vbuff, 1)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, right, bottom, dep)
                        vertex_texcoord(_vbuff, uv_right, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                        vertex_position_3d(_vbuff, left, bottom, dep)
                        vertex_texcoord(_vbuff, uv_left, uv_bottom)
                        vertex_float1(_vbuff, 0)
                        vertex_float1(_vbuff, yy)
                    }
                }
            }
            else
            {
                im_ind = irandom(_image_randomizer)
                uv_left = _uv_cache_l[im_ind]
                uv_top = _uv_cache_t[im_ind]
                uv_right = _uv_cache_r[im_ind]
                uv_bottom = _uv_cache_b[im_ind]
                right = left + spr_w
                bottom = top + spr_h
                dep = (-bottom) + 2
                vertex_position_3d(_vbuff, left, top, dep)
                vertex_texcoord(_vbuff, uv_left, uv_top)
                vertex_float1(_vbuff, 1)
                vertex_float1(_vbuff, yy)
                vertex_position_3d(_vbuff, right, top, dep)
                vertex_texcoord(_vbuff, uv_right, uv_top)
                vertex_float1(_vbuff, 1)
                vertex_float1(_vbuff, yy)
                vertex_position_3d(_vbuff, left, bottom, dep)
                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                vertex_float1(_vbuff, 0)
                vertex_float1(_vbuff, yy)
                vertex_position_3d(_vbuff, right, top, dep)
                vertex_texcoord(_vbuff, uv_right, uv_top)
                vertex_float1(_vbuff, 1)
                vertex_float1(_vbuff, yy)
                vertex_position_3d(_vbuff, right, bottom, dep)
                vertex_texcoord(_vbuff, uv_right, uv_bottom)
                vertex_float1(_vbuff, 0)
                vertex_float1(_vbuff, yy)
                vertex_position_3d(_vbuff, left, bottom, dep)
                vertex_texcoord(_vbuff, uv_left, uv_bottom)
                vertex_float1(_vbuff, 0)
                vertex_float1(_vbuff, yy)
            }
        }
    }
}

