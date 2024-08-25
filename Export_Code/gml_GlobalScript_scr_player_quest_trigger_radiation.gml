function scr_player_quest_trigger_radiation() //gml_Script_scr_player_quest_trigger_radiation
{
    if (global.status_state_now[(3 << 0)] == (3 << 0))
    {
        var i_have_the_quest = false
        var _quest_pos = -1
        for (var i = 0; i < 30; i++)
        {
            var _quest_id = global.quest_state[i].id
            if (_quest_id != "")
            {
                if (_quest_id == (65 << 0))
                {
                    if (global.quest_state[i].amount_now[0] < variable_struct_get(global.quest_database, _quest_id).objective[0].amount_max)
                    {
                        i_have_the_quest = true
                        _quest_pos = i
                    }
                }
            }
        }
        if (i_have_the_quest == true && _quest_pos != -1)
        {
            global.save_quest_amount_now[_quest_pos][0] = 1
            obj_controller.alarm[1] = 1
        }
    }
}

