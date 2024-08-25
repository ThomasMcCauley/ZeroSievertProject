function player_meeting(argument0, argument1, argument2) //gml_Script_player_meeting
{
    if (argument2 == undefined)
        argument2 = 0
    var _player = player_get(argument2)
    return (instance_exists(_player) ? place_meeting(argument0, argument1, _player) : false);
}

