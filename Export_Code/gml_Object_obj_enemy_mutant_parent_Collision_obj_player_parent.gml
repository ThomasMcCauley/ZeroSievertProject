/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_player_loadout_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_player_loadout_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
if (player_get_hp(other.mp_index) > 0)
{
    if (!(player_state_is(other.mp_index, gml_Script_scr_player_state_start, gml_Script_scr_player_state_free_camera)))
    {
        if damage_on_hit
        {
            if (npc_get_damage_melee(npc_id) > 0)
            {
                if (!other.hit)
                {
                    other.hit = true
                    other.hit_shader = "BULLET_HIT_SHADER_NORMAL"
                    other.alarm[2] = 30
                    other.alarm[3] = 3
                    other.mutant_slow_multiplier = 0.5
                    other.alarm[6] = 60
                    scr_enemy_sound_attack()
                    if (player_get_local_index() == other.mp_index)
                    {
                        var player_amror = other.armor_now
                        var danno = npc_get_damage_melee(npc_id) * (1 - item_armor_get_pierce(player_amror)) * gml_Script_difficulty_get("enemy_mutant_damage")
                        player_damage(danno, other.mp_index)
                        if (other.hp <= 0)
                            global.who_killed_player_name = npc_name
                        if scr_chance(danno)
                            other.wound += floor(danno * 0.3)
                        if (danno != 0)
                        {
                            if scr_chance(danno * 2)
                                other.bleed += 1
                        }
                        var _durability_loss = npc_get_damage_melee(npc_id) * (item_armor_get_dur_damage(player_amror) / 100) * (global.sk_k[(32 << 0)])
                        player_loadout_set_durability("armor slot", ((gml_Script_player_loadout_get_durability(other, "armor slot")) - _durability_loss))
                        instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (-y), obj_hud_get_hit)
                    }
                }
            }
        }
    }
}
