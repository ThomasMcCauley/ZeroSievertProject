function player_distance(argument0, argument1, argument2) //gml_Script_player_distance
{
    if (argument2 == undefined)
        argument2 = 0
    var _player = player_get(argument2)
    if (!instance_exists(_player))
        return infinity;
    return point_distance(argument0, argument1, _player.x, _player.y);
}

