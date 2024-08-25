function player_init_laser() //gml_Script_player_init_laser
{
    laser_on_general = false
    laser_container_array = array_create((17 << 0), undefined)
    var _i = 0
    repeat (17 << 0)
    {
        laser_container_array[_i] = new class_laser_container()
        _i++
    }
}

