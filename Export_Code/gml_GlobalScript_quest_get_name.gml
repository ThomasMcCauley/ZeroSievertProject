function quest_get_name(argument0) //gml_Script_quest_get_name
{
    return variable_struct_get(global.quest_database, argument0).name;
}

