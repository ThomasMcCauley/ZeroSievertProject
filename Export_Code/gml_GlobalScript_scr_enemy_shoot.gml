/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_ammo_item

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_ammo_item

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function scr_enemy_shoot() //gml_Script_scr_enemy_shoot
{
    riflessi++
    var target_distance = distance_to_object(target)
    if (reloading == false)
    {
        if (ammo_now > 0)
        {
            if (shooting == false)
            {
                if (riflessi >= riflessi_max)
                {
                    reflexes_can_change = true
                    reflexes_shot = true
                    recoil_total = item_weapon_get_precisione(arma_now) * npc_get_aim_factor(npc_id)
                    var dam = item_weapon_get_damage(arma_now)
                    var prec = (100 - item_weapon_get_precisione(arma_now)) * 0.04 * npc_get_aim_factor(npc_id)
                    if can_shoot_uneffective_range
                        prec = precision_uneffective_range
                    scr_shoot(weapon_pointing_direction, (0 << 0), dam, prec)
                    var _amount = recoil_arma * glance_get_npc_recoil_value_multiplier(item_weapon_get_type_effective_range(arma_now))
                    _amount._amount.IncreaseRadius(NPCrecoil)
                    shooting = true
                    ammo_now -= 1
                    recoil_shooting += recoil_arma
                    if (item_weapon_get_fire_mode(arma_now) == "semi_automatic")
                        alarm[1] = item_weapon_get_rate_of_fire(arma_now) + irandom(15) + 15
                    else
                        alarm[1] = item_weapon_get_rate_of_fire(arma_now) * npc_get_prob_attack(npc_id)
                    if (ammo_now <= 0)
                        have_to_reload = true
                    if instance_exists(target)
                    {
                        last_known_x = target.x
                        last_known_y = target.y
                    }
                    var _id = id
                    var shake_ = dam * item_ammo_get_number(ammo_id_now) / 10 * 2
                    var dir_ = weapon_pointing_direction
                    if instance_exists(obj_npc_weapon)
                    {
                        with (obj_npc_weapon)
                        {
                            if (follow_id == _id)
                            {
                                off_angle += shake_
                                off_amount += (shake_ / 2)
                                off_dir = (-dir_)
                            }
                        }
                    }
                }
            }
        }
    }
}

