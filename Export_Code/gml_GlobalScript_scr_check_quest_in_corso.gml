function scr_check_quest_in_corso(argument0) //gml_Script_scr_check_quest_in_corso
{
    var _id_to_check = argument0
    var _ret = (0 << 0)
    var o = 131
    for (var i = 0; i < 30; i++)
    {
        var _quest_id = global.quest_state[i].id
        if (_quest_id != "")
        {
            if (_quest_id == _id_to_check)
            {
                if (global.quest_state[i].state == "active")
                    _ret = (1 << 0)
                if (global.quest_state[i].state == "completed")
                    _ret = (2 << 0)
                var _quanti_obj = array_length(variable_struct_get(global.quest_database, _quest_id).objective)
                var _obj_fatti = 0
                for (var k = 0; k < _quanti_obj; k++)
                {
                    if (global.quest_state[i].amount_now[k] >= variable_struct_get(global.quest_database, _quest_id).objective[k].amount_max)
                        _obj_fatti += 1
                }
                if (_obj_fatti == _quanti_obj)
                    _ret = (2 << 0)
            }
        }
    }
    return _ret;
}

