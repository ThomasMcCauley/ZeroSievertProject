function player_set_state(argument0, argument1) //gml_Script_player_set_state
{
    if (argument1 == undefined)
        argument1 = 0
    var _player = player_get(argument1)
    if instance_exists(_player)
        _player.state = argument0
}

