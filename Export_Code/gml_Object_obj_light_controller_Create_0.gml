global.torch = false
surface_light = -4
surface_rain = -4
meteo_alpha = 0
meteo_alpha_max = 0.4
meteo_alpha_increase = 0.005
ciclo_now = (1 << 0)
color_surface = 16777215
darkness_max = 1
darkness_now = 0
var a = (0 << 0)
ciclo_time[a] = 6
ciclo_color[a] = 2429720
a = (1 << 0)
ciclo_time[a] = 9
ciclo_color[a] = 16777215
a = (2 << 0)
ciclo_time[a] = 18
ciclo_color[a] = 2429720
a = (3 << 0)
ciclo_time[a] = 21
ciclo_color[a] = 2429720
day_name[(1 << 0)] = "Monday"
day_name[(2 << 0)] = "Tuesday"
day_name[(3 << 0)] = "Wednesday"
day_name[(4 << 0)] = "Thursday"
day_name[(5 << 0)] = "Friday"
day_name[(6 << 0)] = "Saturday"
day_name[(7 << 0)] = "Sunday"
time_increase = 0.3
db_open("general")
game_seconds_remainder = 0
game_time_played = db_read("Game time played", "seconds", undefined)
real_time_played = db_read("Real time played", "seconds", 0)
if (game_time_played == undefined)
{
    var _second = db_read("Time", "Seconds", 0)
    var _minute = db_read("Time", "Minutes", 0)
    var _hour = db_read("Time", "Hour", 10)
    var _day = db_read("Time", "Day", 1)
    var _month = db_read("Time", "Month", 1)
    var _year = db_read("Time", "Year", 2018)
    trace("obj_light_controller: Found legacy game time")
    trace("obj_light_controller: Found timestamp ", _year, "-", _month, "-", _day, " ", _hour, ":", _minute, ".", _second)
    game_time_played = date_create_datetime(_year, _month, _day, _hour, _minute, _second)
    trace("obj_light_controller: Calculated game time as ", game_time_played, " (", date_datetime_string(game_time_played), ")")
    db_key_delete("Time", "Seconds")
    db_key_delete("Time", "Minutes")
    db_key_delete("Time", "Hour")
    db_key_delete("Time", "Day")
    db_key_delete("Time", "Month")
    db_key_delete("Time", "Year")
}
else
    trace("obj_light_controller: Found seconds as ", game_time_played, " (", date_datetime_string(game_time_played), ")")
db_close()
pos_center = shader_get_uniform(shd_night_vision_hud, "pos_center")
