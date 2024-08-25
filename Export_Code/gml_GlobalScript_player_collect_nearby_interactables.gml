function player_collect_nearby_interactables() //gml_Script_player_collect_nearby_interactables
{
    with (obj_chest_general)
    {
        if (object_index != obj_chest_player)
        {
            if (point_distance(other.x, other.y, x, y) < 16)
            {
                ds_list_add(global.list_interact, (1 << 0))
                ds_list_add(global.list_interact_id, id)
                ds_list_add(global.list_interact_task_pos, 0)
            }
        }
    }
    if (looting == false)
    {
        var _faction = faction
        with (obj_npc_parent)
        {
            if (point_distance(x, y, other.x, other.y) < 16)
            {
                if (npc_speaker_id != "no_speaker")
                {
                    if (faction_get_rep_temp(_faction, faction) >= 0)
                    {
                        ds_list_add(global.list_interact, (3 << 0))
                        ds_list_add(global.list_interact_id, id)
                        ds_list_add(global.list_interact_task_pos, 0)
                    }
                }
            }
        }
    }
    if (looting == false)
    {
        with (obj_chest_player)
        {
            if (point_distance(x, y, other.x, other.y) < 16)
            {
                var chest_ = id
                ds_list_add(global.list_interact, (2 << 0))
                ds_list_add(global.list_interact_id, chest_)
                ds_list_add(global.list_interact_task_pos, 0)
            }
        }
    }
    return true;
}

