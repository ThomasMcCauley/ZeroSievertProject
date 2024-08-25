function player_get_state(argument0) //gml_Script_player_get_state
{
    if (argument0 == undefined)
        argument0 = 0
    var _player = player_get(argument0)
    return (instance_exists(_player) ? _player.state : undefined);
}

