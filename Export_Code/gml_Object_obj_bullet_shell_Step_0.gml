if (y >= stop_y)
{
    if (rimbalzo_max > 0 && rimbalzo < rimbalzo_max)
    {
        vspeed = -1.5
        rimbalzo++
        if (audio_can == true)
        {
            if (audio_done == false)
            {
                audio_done = true
                if is_in_raid()
                {
                    var sound_ = undefined
                    var sound_grass = choose(238, 239, 240)
                    var sound_concrete = choose(229, 230, 231)
                    var sound_wood = choose(235, 236, 237)
                    var sound_metal = choose(232, 233, 234)
                    var om = obj_map_generator
                    var os = obj_sound_controller
                    var x1 = x div 16
                    var y1 = (y - 4) div 16
                    if (y <= om.map_height)
                    {
                        sound_ = sound_grass
                        if (ds_grid_get(om.grid_floor2, x1, y1) == 1)
                            sound_ = sound_concrete
                        if (ds_grid_get(om.grid_floor2, x1, y1) == 5 || ds_grid_get(om.grid_floor2, x1, y1) == 5)
                            sound_ = sound_grass
                        if (ds_grid_get(om.grid_strada, (x div 96), (y div 96)) == true)
                            sound_ = sound_concrete
                    }
                    else
                    {
                        var get_cell = tilemap_get(om.layer_tileset_floor_indoor, x1, y1)
                        var celly = get_cell div 32
                        var cellx = get_cell - celly * 32
                        var material = ds_grid_get(os.grid_footstep, cellx, celly)
                        switch material
                        {
                            case (0 << 0):
                                sound_ = sound_concrete
                                break
                            case (1 << 0):
                                sound_ = sound_wood
                                break
                            case (2 << 0):
                                sound_ = sound_metal
                                break
                        }

                    }
                    if (sound_ != undefined)
                        audio_play_sound(sound_, 12, false)
                }
            }
        }
    }
    else
    {
        vspeed = 0
        hspeed = 0
        depth = (-y) + 15
    }
}
else
{
    depth = (-y)
    vspeed += grav
}
