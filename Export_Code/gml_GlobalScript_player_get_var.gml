function player_get_var(argument0, argument1, argument2) //gml_Script_player_get_var
{
    if (argument1 == undefined)
        argument1 = 0
    if (argument2 == undefined)
        argument2 = 0
    var _player = player_get(argument1)
    if instance_exists(_player)
        return variable_instance_get(_player, argument0);
    return argument2;
}

