if is_in_raid()
{
    alarm[9] = 30
    var o = 131
    var quest_amount = 30
    for (var j = 0; j < quest_amount; j++)
    {
        var quest_id_ = global.quest_state[j].id
        if (quest_id_ != "")
        {
            for (var k = 0; k < array_length(variable_struct_get(global.quest_database, quest_id_).objective); k++)
            {
                if (variable_struct_get(global.quest_database, quest_id_).objective[k].type == (12 << 0))
                {
                    if (global.quest_state[j].amount_now[k] != variable_struct_get(global.quest_database, quest_id_).objective[k].amount_max)
                    {
                        if (obj_map_generator.area == global.place_analyzer_map[quest_id_][k])
                        {
                            for (var i = 0; i < 3; i++)
                            {
                                var quale_anomalia = noone
                                if (i == 0)
                                    quale_anomalia = obj_anomaly_fire_generator_big
                                if (i == 1)
                                    quale_anomalia = obj_anomaly_gas_generator_big
                                if (i == 2)
                                    quale_anomalia = obj_anomaly_electric_generator
                                if instance_exists(quale_anomalia)
                                {
                                    var anomaly_nearest = instance_nearest(x, y, quale_anomalia)
                                    if instance_exists(anomaly_nearest)
                                    {
                                        if (point_distance(x, y, anomaly_nearest.x, anomaly_nearest.y) < 256)
                                        {
                                            if (quale_anomalia == global.place_analyzer_anomaly[quest_id_][0])
                                            {
                                                anomaly_nearest = instance_nearest(x, y, quale_anomalia)
                                                var ano_radius = obj_controller.place_radius[anomaly_nearest.ano_id] * 16
                                                if (point_distance(x, y, anomaly_nearest.x, anomaly_nearest.y) > (ano_radius / 2) && point_distance(x, y, anomaly_nearest.x, anomaly_nearest.y) < (ano_radius * 1.5))
                                                {
                                                    quest_sono_vicino_anomalia = true
                                                    if (quest_place_analyzer_text_said_1 == false)
                                                    {
                                                        quest_place_analyzer_text_said_1 = true
                                                        scr_draw_npc_text(id, (25 << 0))
                                                    }
                                                }
                                                else
                                                    quest_sono_vicino_anomalia = false
                                                if (point_distance(x, y, anomaly_nearest.x, anomaly_nearest.y) < (ano_radius / 2))
                                                {
                                                    quest_posso_piazzare_analyzer = true
                                                    quest_scientific_analyzer_position_in_grid = j
                                                    if (quest_place_analyzer_text_said_2 == false)
                                                    {
                                                        quest_place_analyzer_text_said_2 = true
                                                        scr_draw_npc_text(id, (26 << 0))
                                                    }
                                                }
                                                else
                                                {
                                                    quest_scientific_analyzer_position_in_grid = -1
                                                    quest_posso_piazzare_analyzer = false
                                                }
                                                if (point_distance(x, y, anomaly_nearest.x, anomaly_nearest.y) > (ano_radius * 1.5))
                                                {
                                                    quest_place_analyzer_text_said_1 = false
                                                    quest_place_analyzer_text_said_2 = false
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        quest_sono_vicino_anomalia = false
                        quest_posso_piazzare_analyzer = false
                    }
                }
            }
        }
    }
}
