function scr_collision() //gml_Script_scr_collision
{
    var amount_ = 5
    if (hspd != 0)
    {
        var time_ = current_time
        if place_meeting((x + hspd), y, obj_solid)
        {
            while (!(place_meeting((x + sign(hspd)), y, obj_solid)))
            {
                x += sign(hspd)
                if (current_time > (time_ + amount_))
                    break
                else
                    continue
            }
            hspd = 0
        }
    }
    if (vspd != 0)
    {
        time_ = current_time
        if place_meeting(x, (y + vspd), obj_solid)
        {
            while (!(place_meeting(x, (y + sign(vspd)), obj_solid)))
            {
                y += sign(vspd)
                if (current_time > (time_ + amount_))
                    break
                else
                    continue
            }
            vspd = 0
        }
    }
    if (hspd != 0)
    {
        time_ = current_time
        if place_meeting((x + hspd), y, obj_solid_can_see)
        {
            while (!(place_meeting((x + sign(hspd)), y, obj_solid_can_see)))
            {
                x += sign(hspd)
                if (current_time > (time_ + amount_))
                    break
                else
                    continue
            }
            hspd = 0
        }
    }
    if (vspd != 0)
    {
        time_ = current_time
        if place_meeting(x, (y + vspd), obj_solid_can_see)
        {
            while (!(place_meeting(x, (y + sign(vspd)), obj_solid_can_see)))
            {
                y += sign(vspd)
                if (current_time > (time_ + amount_))
                    break
                else
                    continue
            }
            vspd = 0
        }
    }
    x += hspd
    y += vspd
}

