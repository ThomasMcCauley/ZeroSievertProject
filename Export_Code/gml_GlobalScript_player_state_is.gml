function player_state_is(argument0) //gml_Script_player_state_is
{
    var _state = player_get_state(argument0)
    if (_state == undefined)
        return false;
    var _i = 1
    repeat (argument_count - 1)
    {
        if (argument[_i] == _state)
            return true;
        _i++
    }
    return false;
}

