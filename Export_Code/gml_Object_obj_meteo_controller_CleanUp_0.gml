var _i = 0
repeat array_length(meteo_rain_list)
{
    var _list = meteo_rain_list[_i]
    if (_list != undefined)
        ds_list_destroy(_list)
    _i++
}
_i = 0
repeat array_length(meteo_fog_list)
{
    _list = meteo_fog_list[_i]
    if (_list != undefined)
        ds_list_destroy(_list)
    _i++
}
