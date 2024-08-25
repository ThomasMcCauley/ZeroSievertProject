function __quest_log_get_quest_data(argument0) //gml_Script___quest_log_get_quest_data
{
    var _id = quest_log_get_id(argument0)
    if (_id == undefined)
        return undefined;
    return variable_struct_get(global.quest_database, _id);
}

