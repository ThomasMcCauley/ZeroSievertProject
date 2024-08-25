function quest_log_get_name(argument0) //gml_Script_quest_log_get_name
{
    var _quest_data = __quest_log_get_quest_data(argument0)
    if (_quest_data == undefined)
        return "???";
    return language_get_string(_quest_data.name);
}

