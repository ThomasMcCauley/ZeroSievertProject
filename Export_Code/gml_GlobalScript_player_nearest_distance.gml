function player_nearest_distance(argument0, argument1) //gml_Script_player_nearest_distance
{
    var _player = player_nearest_instance(argument0, argument1)
    if (!instance_exists(_player))
        return infinity;
    return point_distance(argument0, argument1, _player.x, _player.y);
}

