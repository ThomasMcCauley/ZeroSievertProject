function player_get_hp(argument0) //gml_Script_player_get_hp
{
    if (argument0 == undefined)
        argument0 = 0
    var _player = player_get(argument0)
    return (instance_exists(_player) ? _player.hp : 0);
}

