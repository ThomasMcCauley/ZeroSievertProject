function player_step_emission_riparato() //gml_Script_player_step_emission_riparato
{
    if instance_exists(obj_exit_screen)
        return;
    if global.is_emission_now
    {
        emission_riparato = false
        var _x = x
        repeat (3)
        {
            if place_meeting(_x, y, obj_solid)
            {
                emission_riparato = true
                break
            }
            else
                _x -= 6
        }
    }
}

