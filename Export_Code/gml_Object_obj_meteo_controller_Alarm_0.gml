if is_in_raid()
{
    var map_ = obj_map_generator.area
    ds_list_shuffle(meteo_rain_list[map_])
    ds_list_shuffle(meteo_fog_list[map_])
    var list1 = meteo_rain_list[map_]
    var list2 = meteo_fog_list[map_]
    meteo_rain_prima = global.meteo_rain
    meteo_fog_prima = global.meteo_fog
    global.meteo_rain = ds_list_find_value(list1, 0)
    global.meteo_fog = ds_list_find_value(list2, 0)
    if (first_pool == true)
    {
        while (meteo_first_pool[global.meteo_rain] == false)
        {
            ds_list_shuffle(meteo_rain_list[map_])
            list1 = meteo_rain_list[map_]
            global.meteo_rain = ds_list_find_value(list1, 0)
        }
        first_pool = false
    }
    if (global.state_emission_now != (0 << 0))
    {
        global.meteo_rain = (0 << 0)
        global.meteo_fog = (4 << 0)
    }
    if (global.state_emission_now == (22 << 0) || global.emission_done == true)
        global.meteo_rain = (12 << 0)
    global.meteo_dark = meteo_dark[global.meteo_rain]
    var _mettere_rad = false
    var _rad_amount = 0
    if (global.meteo_rain == (10 << 0))
    {
        global.meteo_fog = (7 << 0)
        _mettere_rad = true
        _rad_amount = rad_rain_1_amount
    }
    if (global.meteo_rain == (11 << 0) || global.meteo_rain == (12 << 0))
    {
        global.meteo_fog = (8 << 0)
        _mettere_rad = true
        if (global.meteo_rain == (11 << 0))
            _rad_amount = rad_rain_2_amount
        if (global.meteo_rain == (12 << 0))
            _rad_amount = rad_rain_3_amount
    }
    if (_mettere_rad == true)
    {
        var _w = room_width div 8
        var _h = obj_map_generator.map_height div 8
        ds_grid_add_region(obj_map_generator.grid_radiation, 0, 0, _w, _h, _rad_amount)
    }
    var _togliere_rad = false
    if (meteo_rain_prima == (10 << 0))
    {
        _rad_amount = rad_rain_1_amount
        _togliere_rad = true
    }
    if (meteo_rain_prima == (11 << 0))
    {
        _rad_amount = rad_rain_2_amount
        _togliere_rad = true
    }
    if (meteo_rain_prima == (12 << 0))
    {
        _rad_amount = rad_rain_3_amount
        _togliere_rad = true
    }
    if (_togliere_rad == true)
    {
        _w = room_width div 8
        _h = obj_map_generator.map_height div 8
        ds_grid_add_region(obj_map_generator.grid_radiation, 0, 0, _w, _h, (-_rad_amount))
    }
    alarm[0] = change_meteo_time + (choose(-150, 150))
}
