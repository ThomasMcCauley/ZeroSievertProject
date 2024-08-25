function player_collect_interactables() //gml_Script_player_collect_interactables
{
    if (instance_exists(obj_chest_grigoriy_ring) && point_distance(x, y, obj_chest_grigoriy_ring.x, obj_chest_grigoriy_ring.y) < 16)
    {
        ds_list_add(global.list_interact, (21 << 0))
        ds_list_add(global.list_interact_id, obj_chest_grigoriy_ring.id)
        ds_list_add(global.list_interact_task_pos, 0)
    }
    if is_in_hub()
    {
        var _near = instance_nearest(x, y, obj_letto_castello)
        if (instance_exists(_near) && distance_to_object(_near) < 16)
        {
            ds_list_add(global.list_interact, (4 << 0))
            ds_list_add(global.list_interact_id, _near)
            ds_list_add(global.list_interact_task_pos, 0)
        }
        _near = instance_nearest(x, y, obj_letto)
        if (instance_exists(_near) && distance_to_object(_near) < 16)
        {
            ds_list_add(global.list_interact, (4 << 0))
            ds_list_add(global.list_interact_id, _near)
            ds_list_add(global.list_interact_task_pos, 0)
        }
        _near = instance_nearest(x, y, obj_letto_2)
        if (instance_exists(_near) && distance_to_object(_near) < 16)
        {
            ds_list_add(global.list_interact, (4 << 0))
            ds_list_add(global.list_interact_id, _near)
            ds_list_add(global.list_interact_task_pos, 0)
        }
    }
    _near = instance_nearest(x, y, obj_door_parent)
    if (instance_exists(_near) && distance_to_object(_near) < 16)
    {
        if (!_near.open)
        {
            ds_list_add(global.list_interact, (8 << 0))
            ds_list_add(global.list_interact_id, _near)
            ds_list_add(global.list_interact_task_pos, 0)
        }
    }
    if quest_is_active("eliminate_the_spy")
    {
        _near = instance_nearest(x, y, obj_chest_general)
        if instance_exists(_near)
        {
            if (distance_to_object(_near) < 16)
            {
                if (_near.tipo == "quest_cc_spy")
                {
                    if (global.az_done[(15 << 0)] == false)
                    {
                        ds_list_add(global.list_interact, (22 << 0))
                        ds_list_add(global.list_interact_id, _near)
                        ds_list_add(global.list_interact_task_pos, 0)
                    }
                }
            }
        }
    }
    if place_meeting(x, y, obj_indoor)
    {
        ds_list_add(global.list_interact, (5 << 0))
        ds_list_add(global.list_interact_id, instance_nearest(x, y, obj_indoor))
        ds_list_add(global.list_interact_task_pos, 0)
    }
    if place_meeting(x, y, obj_indoor_specific_parent)
    {
        ds_list_add(global.list_interact, (5 << 0))
        ds_list_add(global.list_interact_id, instance_nearest(x, y, obj_indoor_specific_parent))
        ds_list_add(global.list_interact_task_pos, 0)
    }
    for (var i = 0; i < 30; i++)
    {
        var _quest_id = global.quest_state[i].id
        if (_quest_id != "")
        {
            for (var j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
            {
                var _struct_objective = variable_struct_get(global.quest_database, _quest_id).objective[j]
                if (_struct_objective.type == "interact_obj")
                {
                    var _object = _struct_objective.object
                    var _dis = _struct_objective.distance
                    if (global.quest_state[i].amount_now[j] == 0)
                    {
                        if instance_exists(_object)
                        {
                            if (point_distance(x, y, _object.x, _object.y) < _dis)
                            {
                                ds_list_add(global.list_interact, (10 << 0))
                                ds_list_add(global.list_interact_id, i)
                                ds_list_add(global.list_interact_task_pos, j)
                            }
                        }
                    }
                }
                if (_struct_objective.type == "place_analyzer")
                {
                    _object = _struct_objective.object
                    _dis = _struct_objective.distance
                    if (global.quest_state[i].amount_now[j] == 0)
                    {
                        if instance_exists(_object)
                        {
                            if (point_distance(x, y, _object.x, _object.y) < _dis)
                            {
                                ds_list_add(global.list_interact, (10 << 0))
                                ds_list_add(global.list_interact_id, i)
                                ds_list_add(global.list_interact_task_pos, j)
                            }
                        }
                    }
                }
            }
        }
    }
    var marked_id = obj_controller.marked_object_id
    if (marked_id != noone)
    {
        for (i = 0; i < 30; i++)
        {
            _quest_id = global.quest_state[i].id
            if (_quest_id != "")
            {
                for (j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
                {
                    if (variable_struct_get(global.quest_database, _quest_id).objective[j].type == "place_marker")
                    {
                        _object = variable_struct_get(global.quest_database, _quest_id).objective[j].object
                        _dis = 16
                        if instance_exists(obj_map_generator)
                        {
                            if (obj_map_generator.area == variable_struct_get(global.quest_database, _quest_id).objective[j].map)
                            {
                                if (global.quest_state[i].amount_now[j] == 0)
                                {
                                    if instance_exists(_object)
                                    {
                                        if instance_exists(marked_id)
                                        {
                                            if (distance_to_object(_object) < _dis)
                                            {
                                                ds_list_add(global.list_interact, (14 << 0))
                                                ds_list_add(global.list_interact_id, i)
                                                ds_list_add(global.list_interact_task_pos, j)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (quest_posso_piazzare_analyzer == true)
    {
        ds_list_add(global.list_interact, (15 << 0))
        ds_list_add(global.list_interact_id, marked_id)
        ds_list_add(global.list_interact_task_pos, 0)
    }
    if instance_exists(obj_quest_activate_gps)
    {
        var i_have_the_quest = scr_check_specific_q_type((170 << 0), (13 << 0))
        if (i_have_the_quest == true)
        {
            if (point_distance(x, y, obj_quest_activate_gps.x, obj_quest_activate_gps.y) < 16)
            {
                ds_list_add(global.list_interact, (16 << 0))
                ds_list_add(global.list_interact_id, 0)
                ds_list_add(global.list_interact_task_pos, 0)
            }
        }
    }
    if instance_exists(obj_quest_activate_sewer)
    {
        if (point_distance(x, y, obj_quest_activate_sewer.x, obj_quest_activate_sewer.y) < 16)
        {
            i_have_the_quest = scr_check_specific_q_type((171 << 0), (14 << 0))
            if (i_have_the_quest == true)
            {
                ds_list_add(global.list_interact, (17 << 0))
                ds_list_add(global.list_interact_id, 0)
                ds_list_add(global.list_interact_task_pos, 0)
            }
        }
    }
    if is_in_hub()
    {
        if instance_exists(obj_quest_crimson_place_camera)
        {
            if (point_distance(x, y, obj_quest_crimson_place_camera.x, obj_quest_crimson_place_camera.y) < 8)
            {
                if scr_check_specific_q_type((69 << 0), (19 << 0))
                {
                    ds_list_add(global.list_interact, (19 << 0))
                    ds_list_add(global.list_interact_id, 0)
                    ds_list_add(global.list_interact_task_pos, 0)
                }
            }
        }
    }
    if instance_exists(obj_faro)
    {
        if (point_distance(x, y, (obj_faro.x + 48), obj_faro.y) < 16)
        {
            if quest_is_active("clear_swamp")
            {
                if (obj_faro.light_on == false)
                {
                    ds_list_add(global.list_interact, (20 << 0))
                    ds_list_add(global.list_interact_id, 0)
                    ds_list_add(global.list_interact_task_pos, 0)
                }
            }
        }
    }
    if instance_exists(obj_quest_approach_parent)
    {
        var _nearest_id = instance_nearest(x, y, obj_quest_approach_parent)
        if (_nearest_id != noone)
        {
            var _obj_index = _nearest_id.object_index
            i_have_the_quest = false
            var quest_pos_ = -1
            for (i = 0; i < 30; i++)
            {
                _quest_id = global.quest_state[i].id
                if (_quest_id != "")
                {
                    for (j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
                    {
                        if (variable_struct_get(global.quest_database, _quest_id).objective[j].type == "approach")
                        {
                            if (global.quest_state[i].amount_now[j] < variable_struct_get(global.quest_database, _quest_id).objective[j].amount_max)
                            {
                                if (variable_struct_get(global.quest_database, _quest_id).objective[j].object == _obj_index)
                                {
                                    if (point_distance(x, y, _nearest_id.x, _nearest_id.y) < variable_struct_get(global.quest_database, _quest_id).objective[j].distance)
                                    {
                                        if (variable_struct_get(global.quest_database, _quest_id).objective[j].map == obj_map_generator.area)
                                        {
                                            i_have_the_quest = true
                                            quest_pos_ = i
                                            if (i_have_the_quest == true)
                                            {
                                                ds_list_add(global.list_interact, (9 << 0))
                                                ds_list_add(global.list_interact_id, quest_pos_)
                                                ds_list_add(global.list_interact_task_pos, 0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if is_in_hub()
    {
        if place_meeting(x, y, obj_base_parent)
        {
            var closer = instance_place(x, y, obj_base_parent)
            var base_slot_ = closer.slot
            var closer_id = closer.id_base
            if (closer.lvl_now > 0)
            {
                if (closer.preso == false && (closer_id == (9 << 0) || closer_id == (11 << 0) || closer_id == (12 << 0) || closer_id == (10 << 0)))
                {
                    ds_list_add(global.list_interact, (11 << 0))
                    ds_list_add(global.list_interact_id, closer)
                    ds_list_add(global.list_interact_task_pos, 0)
                }
            }
        }
    }
    if is_in_hub()
    {
        if (distance_to_object(obj_table_workbench_hub) < 8)
        {
            ds_list_add(global.list_interact, (7 << 0))
            ds_list_add(global.list_interact_id, 417)
            ds_list_add(global.list_interact_task_pos, 0)
        }
    }
    if is_in_hub()
    {
        if (global.luci_natale_built == true)
        {
            if instance_exists(obj_terminal_natale_luci)
            {
                if (distance_to_object(obj_terminal_natale_luci) < 5)
                {
                    ds_list_add(global.list_interact, (23 << 0))
                    ds_list_add(global.list_interact_id, -4)
                    ds_list_add(global.list_interact_task_pos, 0)
                    if (global.luci_natale_on == true)
                    {
                        ds_list_add(global.list_interact, (26 << 0))
                        ds_list_add(global.list_interact_id, -4)
                        ds_list_add(global.list_interact_task_pos, 0)
                        ds_list_add(global.list_interact, (24 << 0))
                        ds_list_add(global.list_interact_id, -4)
                        ds_list_add(global.list_interact_task_pos, 0)
                        ds_list_add(global.list_interact, (25 << 0))
                        ds_list_add(global.list_interact_id, -4)
                        ds_list_add(global.list_interact_task_pos, 0)
                        ds_list_add(global.list_interact, (27 << 0))
                        ds_list_add(global.list_interact_id, -4)
                        ds_list_add(global.list_interact_task_pos, 0)
                    }
                }
            }
        }
    }
    return true;
}

