function kill_check_quest(argument0) //gml_Script_kill_check_quest
{
    if is_in_raid()
    {
        var _exp = npc_get_esperienza(argument0)
        global.esperienza_kill += _exp
        for (var i = 0; i < 30; i++)
        {
            var quest_id_ = global.quest_state[i].id
            if (quest_id_ != "")
            {
                for (var j = 0; j < array_length(variable_struct_get(global.quest_database, quest_id_).objective); j++)
                {
                    switch variable_struct_get(global.quest_database, quest_id_).objective[j].type
                    {
                        case "kill":
                            var _map = variable_struct_get(global.quest_database, quest_id_).objective[j].map
                            if (_map == -1 || _map == obj_map_generator.area)
                            {
                                var _array_obj_to_kill = variable_struct_get(global.quest_database, quest_id_).objective[j].array_kill
                                var _obj_to_check = array_length(_array_obj_to_kill)
                                for (var k = 0; k < _obj_to_check; k++)
                                {
                                    if (argument0 == _array_obj_to_kill[k])
                                    {
                                        if (global.quest_state[i].amount_now[j] < variable_struct_get(global.quest_database, quest_id_).objective[j].amount_max)
                                            global.quest_state[i].amount_now[j] += 1
                                    }
                                }
                            }
                            break
                    }

                }
            }
        }
    }
}

