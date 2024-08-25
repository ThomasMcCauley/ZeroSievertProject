function scr_gamepad_calculate_dir_and_angle(argument0) //gml_Script_scr_gamepad_calculate_dir_and_angle
{
    argument0[(19 << 0)] = point_distance(0, 0, ((argument0[(16 << 0)]) - (argument0[(17 << 0)])), ((argument0[(15 << 0)]) - (argument0[(14 << 0)])))
    argument0[(26 << 0)] = point_distance(0, 0, ((argument0[(23 << 0)]) - (argument0[(24 << 0)])), ((argument0[(22 << 0)]) - (argument0[(21 << 0)])))
    argument0[(20 << 0)] = point_direction(0, 0, ((argument0[(17 << 0)]) - (argument0[(16 << 0)])), ((argument0[(15 << 0)]) - (argument0[(14 << 0)])))
    argument0[(27 << 0)] = point_direction(0, 0, ((argument0[(24 << 0)]) - (argument0[(23 << 0)])), ((argument0[(22 << 0)]) - (argument0[(21 << 0)])))
}

