/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_stat_increment

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_stat_increment

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function bullet_hit_npc(argument0, argument1) //gml_Script_bullet_hit_npc
{
    with (argument0)
    {
        if object_is_player(shooter_id)
        {
            damage *= global.sk_k[(58 << 0)]
            if (!object_is_player(argument1.target))
                damage *= global.sk_k[(12 << 0)]
        }
        var _npc_id = argument1.npc_id
        var _apply_glance = false
        if (shooter_id == player_get_local())
        {
            var _npc_angle_sweet = npc_get_sweet_angle(_npc_id)
            var _dir_player_bullethit = point_direction(player_get_local().x, player_get_local().y, x, y)
            var _dir_player_npc = point_direction(player_get_local().x, player_get_local().y, argument1.x, argument1.y)
            var _dir_npc_player = point_direction(argument1.x, (argument1.y + 2), player_get_local().x, player_get_local().y)
            var _angle_diff = abs(angle_difference(_dir_player_bullethit, _dir_player_npc))
            var _dis_player_npc = point_distance(player_get_local().x, player_get_local().y, argument1.x, argument1.y)
            var _dir_npc_bullethit = point_direction(argument1.x, (argument1.y + 2), x, y)
            _angle_diff = abs(angle_difference(_dir_npc_bullethit, _dir_npc_player))
            var _dis_to_mouse = point_distance(fin_x, fin_y, argument1.x, argument1.y)
            trace("angle diff: ", string(_angle_diff))
            var _npc_actual_angle = glance_angle(ammo_id_used, weapon_used, _npc_angle_sweet, _dis_player_npc, _dis_to_mouse)
            if (_angle_diff > _npc_actual_angle)
                _apply_glance = true
            if (scoped == true)
            {
                _apply_glance = false
                var _mult_dis_player = 1
                _mult_dis_player = glance_effective_range(ammo_id_used, weapon_used, _dis_player_npc)
                var _chance_scope_glance = _mult_dis_player * 100
                if (_mult_dis_player != 0)
                    _chance_scope_glance += item_weapon_get_scope_glance_flat_amount(weapon_used)
                if (!scr_chance(_chance_scope_glance))
                    _apply_glance = true
            }
            trace("glance: ", string(_apply_glance))
            if global.hud_glance_sysytem
            {
                var _obj = instance_create_depth(x, y, 0, obj_bullet_collision_debug)
                _obj.glance = _apply_glance
                _obj.angle = _angle_diff
                instance_create_depth((x - 0.5), (y - 0.5), 0, obj_bullet_collision_debug2)
                var _text = "HIT"
                var _sign = " < "
                if _apply_glance
                {
                    _text = "GLANCE"
                    _sign = " > "
                }
                scr_draw_text_with_box(_text + "  /  Angle: " + string(_angle_diff) + _sign + string(_npc_actual_angle))
                trace(_text + "  /  Angle: " + string(_angle_diff) + _sign + string(_npc_actual_angle))
            }
        }
        if _apply_glance
        {
            if glance_dis_is_beyond_max_range(ammo_id_used, weapon_used, _dis_player_npc)
                damage = 0
            else
                damage *= item_weapon_get_damage_glance_flat(weapon_used)
        }
        var _armor_id = argument1.armor_id
        var _dur = argument1.armor_dur
        var _c = 20
        var _blocked = false
        if item_exists(_armor_id)
        {
            var _armor_class = item_armor_get_class(_armor_id)
            var _armor_rel = item_armor_get_dur_damage(_armor_id)
            if (penetration <= (_armor_class * 10))
                var _chance = 0.9 + (penetration - 10 * _armor_class) / _c - (log10(_dur / 100)) * 2
            else
                _chance = 0.9 + ((penetration - 10 * _armor_class) / _c - (log10(_dur / 100)) * 2 * 0.15)
            _chance = clamp(_chance, 0, 1)
            var _armor_rel_k = (_armor_rel + 100) / 100
            if scr_chance(_chance * 100)
            {
                argument1.armor_dur -= (damage * 0.3 * _armor_rel_k)
                damage *= (_chance / 2 + 0.5)
            }
            else
            {
                argument1.armor_dur -= (damage * 0.15 * _armor_rel_k)
                damage = 0
                _blocked = true
            }
        }
        argument1.armor_dur = clamp(argument1.armor_dur, 0, 100)
        npc_damage(argument1, damage)
        argument1.shader_hit = "BULLET_HIT_SHADER_NORMAL"
        argument1.alarm[2] = 3
        if _blocked
        {
            argument1.shader_hit = "BULLET_HIT_SHADER_NORMAL_BLOCKED"
            argument1.alarm[2] = 3
        }
        if _apply_glance
        {
            argument1.shader_hit = "BULLET_HIT_SHADER_GLANCE"
            argument1.alarm[2] = 3
            if _blocked
            {
                argument1.shader_hit = "BULLET_HIT_SHADER_GLANCE_BLOCKED"
                argument1.alarm[2] = 3
            }
        }
        if (shooter_id == player_get_local())
        {
            scr_level_up_skill((8 << 0), (damage * global.rate_shooting * (global.sk_k[(57 << 0)])))
            var _my_faction = npc_get_faction(argument1.npc_id)
            if (_my_faction != "All Friend")
            {
                faction_set_rep_temp(_my_faction, "Player", 0)
                if (argument1.first_shot_from_player == false)
                {
                    argument1.first_shot_from_player = true
                    var _amount = variable_struct_get(global.struct_faction, _my_faction).rep_hit
                    faction_add_rep(_my_faction, "Player", _amount)
                }
            }
            if (argument1.hp <= 0)
            {
                if (argument1.bullet_checked == false)
                {
                    argument1.bullet_checked = true
                    kill_check_quest(argument1.npc_id)
                    kill_add_stat(argument1.object_index)
                    _amount = variable_struct_get(global.struct_faction, _my_faction).rep_hit
                    faction_add_rep(_my_faction, "Player", _amount)
                }
            }
        }
        var _shooter_id = shooter_id
        var _player = player_get_local()
        var _player_has_silencer = false
        if (_shooter_id == _player && instance_exists(_player))
            _player_has_silencer = item_weapon_get_modded_silenced(_player.arma_now, player_loadout_get_mod_container(_player, _player.weapon_slot_now))
        if (argument1.hp <= 0)
            argument1.id_of_the_killer = shooter_id
        if (argument1.state != "dummy")
        {
            if instance_exists(_shooter_id)
            {
                with (argument1)
                {
                    if (ammo_magazine >= 0)
                    {
                        if (target == -4 || target_relation == (0 << 0) || target_relation == (1 << 0))
                        {
                            if _player_has_silencer
                            {
                                target = _shooter_id
                                just_shot = 2
                                target_relation = (2 << 0)
                                faction_set_rep_temp(faction, _shooter_id.faction, 0)
                                if (shooted_first_time == 0)
                                    shooted_first_time = 1
                                if (shooted_first_time == 2)
                                {
                                    var _dir = (point_direction(x, y, _shooter_id.x, _shooter_id.y)) + (irandom_range(-30, 30))
                                    var _dis = (point_distance(x, y, _shooter_id.x, _shooter_id.y)) div 2
                                    last_seen_x = lengthdir_x(_dis, _dir)
                                    last_seen_y = lengthdir_y(_dis, _dir)
                                }
                            }
                            else
                            {
                                target = _shooter_id
                                faction_set_rep_temp(faction, _shooter_id.faction, 0)
                                target_relation = (2 << 0)
                                state = npc_get_state_alert(npc_id)
                                last_shot_x = _shooter_id.x
                                last_shot_y = _shooter_id.y
                                just_shot = 1
                                last_seen_x = _shooter_id.x
                                last_seen_y = _shooter_id.y
                                if (shooted_first_time == 0)
                                    shooted_first_time = 1
                            }
                        }
                        target_relation = ((2 << 0) && target == _shooter_id)
                        if _player_has_silencer
                        {
                            just_shot = 2
                            var _my_id = id
                            var _faction = faction
                            var _x = x
                            var _y = y
                            with (obj_npc_parent)
                            {
                                if (_my_id != id && faction == _faction)
                                {
                                    if (point_distance(x, y, _x, _y) < 64)
                                        just_shot = 2
                                }
                            }
                        }
                        else
                        {
                            just_shot = 1
                            last_seen_x = _shooter_id.x
                            last_seen_y = _shooter_id.y
                        }
                    }
                }
            }
        }
        if (argument1.state != "dummy")
        {
            if instance_exists(_shooter_id)
            {
                with (argument1)
                {
                    if (faction == "Mutants")
                    {
                        target = _shooter_id
                        target_relation = (2 << 0)
                        state = npc_get_state_alert(npc_id)
                    }
                }
            }
        }
        if (argument1.red_blood == true && _blocked == false && damage != 0)
        {
            part_create_blood((image_angle - 45), (image_angle + 45), (damage div 3))
            part_create_blood((image_angle + 180), (image_angle + 180), 2)
        }
        instance_destroy()
    }
}

