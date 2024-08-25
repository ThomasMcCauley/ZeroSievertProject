var a = (0 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1549
global.grass_distribution[a] = 1
global.grass_range_min[a] = 64
global.grass_range_max[a] = 128
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (1 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1550
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (2 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1553
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (3 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1552
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (4 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1556
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 100000
a = (5 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1555
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 75000
a = (6 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1554
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 25000
a = (7 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1557
global.grass_distribution[a] = 1
global.grass_range_min[a] = 32
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (9 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1558
global.grass_distribution[a] = 1
global.grass_range_min[a] = 0
global.grass_range_max[a] = 140
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
a = (8 << 0)
global.grass_id[a] = a
global.grass_image[a] = 1988
global.grass_distribution[a] = 1
global.grass_range_min[a] = 16
global.grass_range_max[a] = 96
global.grass_potenza[a] = 1
global.grass_amount[a] = 150000
grass_wind = 0.7
grass_speed = 0.65
wind_hsp = 0
grass_wind_k = 0.0004
grass_speed_k = 0.003
wind_hsp_k = 0.0002
pattern_size_k = 0.05
alarm[2] = 60
uni_time = shader_get_uniform(shd_grass, "time")
uni_dist = shader_get_uniform(shd_grass, "wave_dist")
uni_slow = shader_get_uniform(shd_grass, "slow")
uni_spd = shader_get_uniform(shd_grass, "wind_spd")
uni_patbool = shader_get_uniform(shd_grass, "patbool")
uni_pattern = shader_get_uniform(shd_grass, "pattern")
region_pixel_width = 100
region_pixel_height = 100
region_width = ceil(room_width / region_pixel_width)
region_height = ceil(room_height / region_pixel_height)
vbuff_array = array_create((region_width * region_height), undefined)
var _i = 0
repeat array_length(vbuff_array)
{
    var _vbuff = vertex_create_buffer()
    vbuff_array[_i] = _vbuff
    vertex_begin(_vbuff, global.grass_vertex_format)
    repeat (3)
    {
        vertex_position_3d(_vbuff, 0, 0, 0)
        vertex_texcoord(_vbuff, 0, 0)
        vertex_float1(_vbuff, 0)
        vertex_float1(_vbuff, 0)
    }
    _i++
}
switch obj_map_generator.area
{
    case (1 << 0):
        scr_dynamic_grass((7 << 0), 8)
        scr_dynamic_grass((0 << 0), 400000)
        scr_dynamic_grass((1 << 0), 140000)
        scr_dynamic_grass((2 << 0), 300000)
        break
    case (2 << 0):
        scr_dynamic_grass((7 << 0), 8)
        scr_dynamic_grass((2 << 0), 340000)
        scr_dynamic_grass((0 << 0), 200000)
        scr_dynamic_grass((3 << 0), 150000)
        break
    case (3 << 0):
        scr_dynamic_grass((7 << 0), 8)
        scr_dynamic_grass((2 << 0), 350000)
        scr_dynamic_grass((3 << 0), 150000)
        break
    case (4 << 0):
        scr_dynamic_grass((4 << 0), 400000)
        scr_dynamic_grass((5 << 0), 250000)
        scr_dynamic_grass((6 << 0), 170000)
        scr_dynamic_grass((9 << 0), 2000)
        break
    case (6 << 0):
        scr_dynamic_grass((7 << 0), 8)
        scr_dynamic_grass((2 << 0), 340000)
        scr_dynamic_grass((0 << 0), 200000)
        scr_dynamic_grass((3 << 0), 150000)
        break
}

_i = 0
repeat array_length(vbuff_array)
{
    _vbuff = vbuff_array[_i]
    vertex_end(_vbuff)
    vertex_freeze(_vbuff)
    _i++
}
