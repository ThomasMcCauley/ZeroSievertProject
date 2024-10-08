var _temp_local_var_7, _temp_local_var_9;
function hotfix_npc_quest_array() //gml_Script_hotfix_npc_quest_array
{
    function anon_hotfix_npc_quest_array_gml_GlobalScript_hotfix_npc_quest_array_142_hotfix_npc_quest_array_gml_GlobalScript_hotfix_npc_quest_array(argument0, argument1, argument2) //gml_Script_anon_hotfix_npc_quest_array_gml_GlobalScript_hotfix_npc_quest_array_142_hotfix_npc_quest_array_gml_GlobalScript_hotfix_npc_quest_array
    {
        var _dirty = false
        var _same_quest_index = array_find_index(argument0, argument1)
        if (_same_quest_index != undefined)
            trace("Hotfix: Warning! Quest \"", argument1, "\" already exists for \"", argument2, "\", ignoring duplicate")
        else
        {
            _dirty = true
            var _empty_index = array_find_index(argument0, "")
            if (_empty_index != undefined)
            {
                trace("Hotfix: Placing quest \"", argument1, "\" at index ", _empty_index, " for \"", argument2, "\"")
                argument0[_empty_index] = argument1
            }
            else
            {
                trace("Hotfix: Warning! No empty space for quest \"", argument1, "\" for \"", argument2, "\", appending to array (index=", array_length(argument0), ")")
                array_push(argument0, argument1)
            }
        }
        return _dirty;
    }

    quest_load()
    db_open("pre_raid")
    var _npc_questgiver_dict = SnapDeepCopy(db_section_read("NPC"))
    db_close()
    switch db_read_ext("general", "factions", "joined", undefined)
    {
        case "Green Army":
            self._func_place_quest(variable_struct_get(_npc_questgiver_dict, "leader_faction1_quest"), "find_convoy_ga", "leader_faction1")
            break
        case "Crimson Corporation":
            self._func_place_quest(variable_struct_get(_npc_questgiver_dict, "leader_crimson_base_quest"), "cctv_camera", "leader_crimson_base")
            break
    }

    var _npc_questgiver_array = variable_struct_get_names(_npc_questgiver_dict)
    var _i = 0
    repeat array_length(_npc_questgiver_array)
    {
        var _questgiver_name = _npc_questgiver_array[_i]
        if (_questgiver_name == "barman_quest" || _questgiver_name == "forest_trader_quest" || _questgiver_name == "junk_trader_quest")
        {
            var _first = undefined
            switch _questgiver_name
            {
                case "barman_quest":
                    _first = "first_step_1"
                    break
                case "forest_trader_quest":
                    _first = "igor_supplies"
                    break
                case "junk_trader_quest":
                    _first = "mr_junk_ring"
                    break
            }

            if (_first != undefined)
            {
                var _quest_array = variable_struct_get(_npc_questgiver_dict, _questgiver_name)
                self._func_place_quest(_quest_array, _first, _questgiver_name)
            }
        }
        _i++
    }
    _dirty = true
    while _dirty
    {
        _dirty = false
        _i = 0
        repeat array_length(_npc_questgiver_array)
        {
            _questgiver_name = _npc_questgiver_array[_i]
            _quest_array = variable_struct_get(_npc_questgiver_dict, _questgiver_name)
            var _j = 0
            if (_j < array_length(_quest_array))
            {
                var _quest_id = _quest_array[_j]
                if quest_is_complete(_quest_id)
                {
                    trace("Hotfix: Found completed quest \"", _quest_id, "\" at index ", _j, " in NPC array for \"", _questgiver_name, "\"")
                    var _quest_struct = variable_struct_get(global.quest_database, _quest_id)
                    var _next_quest_array = _quest_struct.quest_next
                    var _found_self = false
                    var _k = 0
                    repeat array_length(_next_quest_array)
                    {
                        var _next_quest_struct = _next_quest_array[_k]
                        var _next_quest_id = _next_quest_struct.id
                        if (_next_quest_id == _quest_id)
                        {
                            _found_self = true
                            break
                        }
                        else
                            _k++
                    }
                    if (!_found_self)
                    {
                        _quest_array[_j] = ""
                        _j--
                    }
                    _k = 0
                    repeat array_length(_next_quest_array)
                    {
                        _next_quest_struct = _next_quest_array[_k]
                        _next_quest_id = _next_quest_struct.id
                        var _next_quest_npc_id = _next_quest_struct.npc_id
                        trace("Hotfix: Trying to place subsequent quest \"", _next_quest_id, "\" for NPC \"", _next_quest_npc_id, "\"")
                        var _destination_quest_array = variable_struct_get(_npc_questgiver_dict, (_next_quest_npc_id + "_quest"))
                        if (!is_array(_destination_quest_array))
                        {
                            trace("Hotfix: Warning! Quest array for \"", _next_quest_npc_id, "\" doesn't exist, creating a new one")
                            _destination_quest_array = []
                        }
                        if self._func_place_quest(_destination_quest_array, _next_quest_id, _next_quest_npc_id)
                            _dirty = true
                        _k++
                    }
                }
                for (_j++; _j < array_length(_quest_array); _j++)
                {
                    var _quest_id = _quest_array[_j]
                    if quest_is_complete(_quest_id)
                    {
                        trace("Hotfix: Found completed quest \"", _quest_id, "\" at index ", _j, " in NPC array for \"", _questgiver_name, "\"")
                        var _quest_struct = variable_struct_get(global.quest_database, _quest_id)
                        var _next_quest_array = _quest_struct.quest_next
                        var _found_self = false
                        var _k = 0
                        var _temp_local_var_7 = array_length(_next_quest_array)
                        repeat array_length(_next_quest_array)
                        {
                            var _next_quest_struct = _next_quest_array[_k]
                            var _next_quest_id = _next_quest_struct.id
                            if (_next_quest_id == _quest_id)
                            {
                                _found_self = true
                                break
                            }
                            else
                                _k++
                        }
                        if (!_found_self)
                        {
                            _quest_array[_j] = ""
                            _j--
                        }
                        _k = 0
                        var _temp_local_var_9 = array_length(_next_quest_array)
                        repeat array_length(_next_quest_array)
                        {
                            _next_quest_struct = _next_quest_array[_k]
                            _next_quest_id = _next_quest_struct.id
                            var _next_quest_npc_id = _next_quest_struct.npc_id
                            trace("Hotfix: Trying to place subsequent quest \"", _next_quest_id, "\" for NPC \"", _next_quest_npc_id, "\"")
                            var _destination_quest_array = variable_struct_get(_npc_questgiver_dict, (_next_quest_npc_id + "_quest"))
                            if (!is_array(_destination_quest_array))
                            {
                                trace("Hotfix: Warning! Quest array for \"", _next_quest_npc_id, "\" doesn't exist, creating a new one")
                                _destination_quest_array = []
                            }
                            if self._func_place_quest(_destination_quest_array, _next_quest_id, _next_quest_npc_id)
                                _dirty = true
                            _k++
                        }
                    }
                }
            }
            _i++
        }
    }
    db_open("pre_raid")
    db_section_write("NPC", _npc_questgiver_dict)
    db_close()
}

