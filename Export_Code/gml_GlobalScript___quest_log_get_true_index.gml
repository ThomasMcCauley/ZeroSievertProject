function __quest_log_get_true_index(argument0) //gml_Script___quest_log_get_true_index
{
    var _i = 0
    repeat (30)
    {
        var _quest_state = global.quest_state[_i]
        if (_quest_state.id != "")
        {
            if (argument0 <= 0)
                return _i;
            argument0--
        }
        _i++
    }
    return undefined;
}

