function player_damage(argument0, argument1) //gml_Script_player_damage
{
    if (argument1 == undefined)
        argument1 = 0
    var _player = player_get(argument1)
    if instance_exists(_player)
    {
        _player.hp -= argument0
        if (_player.hp <= 0)
            _player.hp = -100
    }
}

