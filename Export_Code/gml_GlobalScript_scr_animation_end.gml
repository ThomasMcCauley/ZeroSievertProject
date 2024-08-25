function scr_animation_end(argument0) //gml_Script_scr_animation_end
{
    var _s = argument0
    var _end = false
    if (ani_end == false)
    {
        if ((image_index + image_speed) >= image_number)
        {
            ani_end = true
            _end = true
        }
    }
    if (image_index > 0 && image_index < (image_number - 1))
        ani_end = false
    return _end;
}

