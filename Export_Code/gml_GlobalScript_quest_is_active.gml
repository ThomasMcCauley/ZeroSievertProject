function quest_is_active(argument0) //gml_Script_quest_is_active
{
    for (var j = 0; j < 30; j++)
    {
        var _quest_active_id = global.quest_state[j].id
        if (_quest_active_id == argument0)
            return true;
    }
    return false;
}

