function quest_objective_contract_is_active(argument0, argument1) //gml_Script_quest_objective_contract_is_active
{
    if (argument1 == undefined)
        argument1 = object_index
    for (var j = 0; j < 30; j++)
    {
        var _quest_active_id = global.quest_state[j].id
        if (_quest_active_id != "")
        {
            if (_quest_active_id == argument0)
            {
                for (var k = 0; k < array_length(variable_struct_get(global.quest_database, argument0).objective); k++)
                {
                    var _objective_struct = variable_struct_get(global.quest_database, argument0).objective[k]
                    if (_objective_struct.type == "contract")
                    {
                        if (_objective_struct.object == argument1)
                        {
                            if (global.quest_state[j].amount_now[k] < _objective_struct.amount_max)
                                return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}

