function quest_log_get_removable(argument0) //gml_Script_quest_log_get_removable
{
    _quest_data = __quest_log_get_quest_data(argument0)
    if (_quest_data == undefined)
        return undefined;
    return _quest_data.removable;
}

