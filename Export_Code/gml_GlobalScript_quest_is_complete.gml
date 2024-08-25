function quest_is_complete(argument0) //gml_Script_quest_is_complete
{
    if (argument0 == undefined)
        return false;
    if (variable_struct_get(global.quest_line_progress, argument0) == true)
        return true;
    else
        return false;
}

