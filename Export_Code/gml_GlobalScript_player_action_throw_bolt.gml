function player_action_throw_bolt() //gml_Script_player_action_throw_bolt
{
    with (player_get_local())
    {
        var bolt = instance_create_depth(x, y, (-y), obj_bolt)
        bolt.dir = point_direction(x, y, aim_point_x, aim_point_y)
        bolt.spd = 3
        return true;
    }
}

