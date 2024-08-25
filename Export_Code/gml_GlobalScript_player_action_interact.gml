/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_action_open_chest

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_action_open_chest

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function player_action_interact() //gml_Script_player_action_interact
{
    var cam_x = camera_get_view_x(view_camera[0])
    var cam_y = camera_get_view_y(view_camera[0])
    switch ds_list_find_value(global.list_interact, global.p_int_instance_id)
    {
        case (1 << 0):
            gml_Script_player_action_open_chest(ds_list_find_value(global.list_interact_id, global.p_int_instance_id))
            break
        case (2 << 0):
            player_action_open_stash()
            break
        case (3 << 0):
            var _special = false
            var _get_instance_id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            var _get_object_index = _get_instance_id.object_index
            if (_get_object_index == 11)
            {
                _special = true
                scr_draw_npc_text(obj_sacriel, (148 << 0))
            }
            if (_special == false)
            {
                global.speaker_nearest = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
                player_action_talk_to_npc()
            }
            break
        case (4 << 0):
            gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/sleep.ui")
            player_set_local_state(gml_Script_scr_player_state_sleep)
            break
        case (5 << 0):
            var indoor_id = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            var _offy = 0
            if (y > obj_map_generator.area_height[obj_map_generator.area])
                _offy = -4
            x = indoor_id.tele_x
            y = indoor_id.tele_y + _offy
            can_run_after_exit_building = false
            obj_controller.can_pause = true
            obj_controller.alarm[4] = 2
            if instance_exists(obj_fog_setup)
                obj_fog_setup.alarm[0] = 3
            if instance_exists(obj_camera)
                obj_camera.alarm[1] = 1
            break
        case (6 << 0):
            break
        case (10 << 0):
            var _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            var _quest_id = global.quest_state[_quest_pos].id
            var _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id)
            if (_quest_id != "")
            {
                if (variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].type == "interact_obj" || variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].type == "place_analyzer")
                {
                    var _item_id = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].item_id
                    var _i_have_item = true
                    if (_item_id != -1)
                    {
                        _i_have_item = false
                        _i_have_item = inventory_item_exists(_item_id)
                    }
                    if (_i_have_item == true)
                    {
                        var _text_item = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_if_item
                        if (_text_item != -1)
                            scr_draw_npc_text(id, _text_item)
                        if (_item_id != -1)
                            inventory_remove_item(_item_id, 1)
                        global.quest_state[_quest_pos].amount_now[_task_pos] = 1
                        obj_controller.alarm[1] = 1
                        if (_quest_id == (37 << 0))
                        {
                            obj_quest_destroy_ghoul_lair_esplosione.alarm[1] = 3600
                            global.show_explosion_ghoul_lair = true
                        }
                    }
                    if (_i_have_item == false)
                    {
                        var _text_no_item = variable_struct_get(global.quest_database, _quest_id).objective[_task_pos].text_if_no_item
                        if (_text_no_item != -1)
                            scr_draw_npc_text(id, _text_no_item)
                    }
                }
            }
            break
        case (9 << 0):
            _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id)
            _quest_id = global.quest_state[_quest_pos].id
            global.quest_state[_quest_pos].amount_now[_task_pos] = 1
            obj_controller.alarm[1] = 1
            if (_quest_id == (89 << 0))
                scr_draw_npc_text(id, (41 << 0))
            if (_quest_id == (25 << 0))
                scr_draw_npc_text(id, (43 << 0))
            if (_quest_id == (30 << 0))
                scr_draw_npc_text(id, (46 << 0))
            if (_quest_id == (36 << 0))
                scr_draw_npc_text(id, (48 << 0))
            break
        case (7 << 0):
            gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/crafting.ui", "crafting layer")
            player_set_local_state(gml_Script_scr_player_state_craft)
            break
        case (8 << 0):
            var door_near = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            var d_id = door_near.id_door
            var have_key = inventory_item_exists(global.door_key_id[d_id])
            if (have_key == false)
                scr_draw_npc_text(id, (31 << 0))
            var togli_chiave = false
            if item_get_key_single_use(global.door_key_id[d_id])
                togli_chiave = true
            if (d_id == (8 << 0))
            {
                if instance_exists(obj_junk_trader)
                {
                    audio_play_sound(snd_electric_spark, 15, false)
                    player_damage_local(infinity)
                }
            }
            if (have_key == true)
            {
                with (door_near)
                {
                    if place_meeting(x, y, obj_solid)
                    {
                        var solid_my_poosition = instance_place(x, y, obj_solid)
                        with (solid_my_poosition)
                        {
                            var xx = x
                            var yy = y
                            instance_destroy()
                        }
                        if (togli_chiave == true)
                        {
                            inventory_remove_item(global.door_key_id[d_id], 1)
                            inventory_clean_up_empty_items()
                        }
                        sprite_index = global.door_sprite_open[d_id]
                        visible = true
                        x = xx
                        y = yy
                        depth = (-yy)
                        open = true
                    }
                }
            }
            break
        case (11 << 0):
            var closer = instance_place(x, y, obj_base_parent)
            var base_slot_ = closer.slot
            var closer_id = closer.id_base
            var c_id = obj_node_target_is_enemy
            if (closer_id == (9 << 0))
                c_id = obj_chest_material
            if (closer_id == (11 << 0))
                c_id = obj_chest_garden
            if (closer_id == (12 << 0))
                c_id = obj_chest_ammo
            if (closer_id == (10 << 0))
                c_id = obj_chest_scav
            if (c_id != obj_node_target_is_enemy)
            {
                instance_create_depth(x, y, 0, c_id)
                closer.preso = true
                db_open("general")
                db_write("Module preso", ("slot_" + string(base_slot_)), true)
                db_close()
            }
            break
        case (13 << 0):
            var i_have_the_kit = inventory_item_exists("repair_radio_tower")
            if (i_have_the_kit == true)
            {
                scr_complete_specific_q_type((62 << 0), (11 << 0))
                inventory_remove_item("repair_radio_tower", 1)
                scr_draw_text_with_box("Quest completed!")
            }
            else
                scr_draw_npc_text(id, (24 << 0))
            break
        case (14 << 0):
            var i_have_the_marker = inventory_item_exists("gps_marker")
            if (i_have_the_marker == true)
            {
                _quest_pos = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
                _quest_id = global.quest_state[_quest_pos].id
                _task_pos = ds_list_find_value(global.list_interact_task_pos, global.p_int_instance_id)
                global.quest_state[_quest_pos].amount_now[_task_pos] = 1
                obj_controller.alarm[1] = 1
                inventory_remove_item("gps_marker", 1)
            }
            else
                scr_draw_npc_text(id, (23 << 0))
            break
        case (15 << 0):
            var i_have_the_analyzer = inventory_item_exists("scientific_analyzer")
            if (i_have_the_analyzer == true)
            {
                global.save_quest_amount_now[i][0] = 1
                global.quest_state[i].amount_now[_task_pos] = 1
                obj_controller.alarm[1] = 1
                inventory_remove_item("scientific_analyzer", 1)
                scr_draw_text_with_box("Quest completed!")
            }
            else
                scr_draw_npc_text(id, (27 << 0))
            break
        case (16 << 0):
            var quest_pos_ = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            var i_have_repair_kit = inventory_item_exists("repair_radio_tower")
            if (i_have_repair_kit == true)
            {
                scr_complete_specific_q_type((170 << 0), (13 << 0))
                inventory_remove_item("repair_radio_tower", 1)
                scr_draw_text_with_box("Quest completed!")
            }
            else
                scr_draw_npc_text(id, (24 << 0))
            break
        case (17 << 0):
            quest_pos_ = ds_list_find_value(global.list_interact_id, global.p_int_instance_id)
            scr_complete_specific_q_type((171 << 0), (14 << 0))
            obj_controller.alarm[1] = 1
            scr_draw_text_with_box("Quest completed!")
            break
        case (18 << 0):
            break
        case (19 << 0):
            i_have_the_marker = inventory_item_exists("camera_crimson_quest")
            if (i_have_the_marker == true)
            {
                scr_complete_specific_q_type((19 << 0), (19 << 0))
                inventory_remove_item("camera_crimson_quest", 1)
                scr_draw_text_with_box("Quest completed!")
            }
            else
                scr_draw_npc_text(id, (34 << 0))
            break
        case (20 << 0):
            if (obj_faro.light_on == false)
            {
                obj_faro.light_start = true
                obj_spawner_ghoul_quest_swamp.alarm[0] = 480
                obj_faro.alarm[3] = 90
                with (obj_green_quest_swamp_leader)
                    scr_draw_npc_text(id, (99 << 0))
            }
            break
        case (21 << 0):
            scr_draw_npc_text(id, (38 << 0))
            break
        case (22 << 0):
            scr_draw_npc_text(id, (76 << 0))
            global.az_done[(15 << 0)] = true
            break
        case (23 << 0):
            if (global.luci_natale_on == true)
            {
                global.luci_natale_on = false
                scr_draw_text_with_box("Lights OFF")
            }
            else
            {
                global.luci_natale_on = true
                scr_draw_text_with_box("Lights ON")
            }
            with (obj_light_natale_parent)
                scale = scale_start
            break
        case (24 << 0):
            with (obj_light_natale_1)
            {
                colore_now += 1
                var _max = array_length_1d(colore_luce)
                if (colore_now >= (_max - 1))
                    colore_now = 0
                var _colore_now = colore_now
                db_open("general")
                db_write("Christman", "lights color 1", colore_now)
                db_close()
            }
            scr_draw_text_with_box(((language_get_string("Lights 1 - color")) + " " + string(_colore_now)), false)
            break
        case (25 << 0):
            with (obj_light_natale_2)
            {
                colore_now += 1
                _max = array_length_1d(colore_luce)
                if (colore_now >= (_max - 1))
                    colore_now = 0
                _colore_now = colore_now
                db_open("general")
                db_write("Christman", "lights color 2", colore_now)
                db_close()
            }
            scr_draw_text_with_box(((language_get_string("Lights 2 - color")) + " " + string(_colore_now)), false)
            break
        case (26 << 0):
            global.luci_natale_mode += 1
            if (global.luci_natale_mode > (2 << 0))
                global.luci_natale_mode = (0 << 0)
            if (global.luci_natale_mode == (2 << 0))
            {
                with (obj_light_natale_1)
                    scale = 0
                with (obj_light_natale_1)
                    scale = scale_start
            }
            db_open("general")
            db_write("Christman", "lights mode", global.luci_natale_mode)
            db_close()
            with (obj_light_natale_parent)
                luci_natale_timer_alternato = 0
            scr_draw_text_with_box(((language_get_string("Lights mode")) + " - " + string(global.luci_natale_mode)), false)
            break
        case (27 << 0):
            global.luci_natale_timer += 1
            if (global.luci_natale_timer > 4)
                global.luci_natale_timer = 0
            with (obj_light_natale_parent)
                luci_natale_timer_alternato = 0
            db_open("general")
            db_write("Christman", "lights timer", global.luci_natale_timer)
            db_close()
            scr_draw_text_with_box(((language_get_string("Lights timer")) + " - " + string(global.luci_natale_timer)), false)
            break
        case (28 << 0):
            if (!global.santa2023_given_milk)
            {
                if inventory_item_exists("milk")
                {
                    inventory_remove_item("milk", 1)
                    with (obj_santa_claus)
                        scr_draw_npc_text(id, (160 << 0))
                    global.santa2023_given_milk = true
                    obj_controller.alarm[3] = 1
                    audio_play_sound(snd_natale2023_woosh, 20, false)
                }
                else
                    scr_draw_npc_text(id, (85 << 0))
            }
            else
            {
                with (obj_santa_claus)
                    scr_draw_npc_text(id, (159 << 0))
            }
            break
    }

}

