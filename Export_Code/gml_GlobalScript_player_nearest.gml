function player_nearest(argument0, argument1) //gml_Script_player_nearest
{
    var _player = player_nearest_instance(argument0, argument1)
    return (instance_exists(_player) ? _player.mp_index : -1);
}

