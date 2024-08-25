function quest_log_get_description(argument0) //gml_Script_quest_log_get_description
{
    var _quest_data = __quest_log_get_quest_data(argument0)
    if (_quest_data == undefined)
        return "???";
    return _quest_data.text;
}

