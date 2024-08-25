/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_item_weapon_pos_get_default_id

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function npc_setup_weapon() //gml_Script_npc_setup_weapon
{
    arma_now = npc_get_weapon(npc_id)
    ammo_magazine = item_weapon_get_magazine(arma_now)
    ammo_now = ammo_magazine
    if item_weapon_get_moddable(arma_now)
    {
        loot_mod_cont_copy_from_default(mod_container, arma_now)
        if (npc_id == "killa")
        {
            loot_mod_cont_clear(mod_container)
            loot_mod_cont_set(mod_container, "stock", "mod_rpk_stock")
            loot_mod_cont_set(mod_container, "grip", "mod_rpk_grip")
            loot_mod_cont_set(mod_container, "handguard", "mod_rpk_handguard_1")
            loot_mod_cont_set(mod_container, "magazine", "mod_rpk_magazine")
            loot_mod_cont_set(mod_container, "scope", "mod_scope_mrs")
            loot_mod_cont_set(mod_container, "att_1", "mod_foregrip_1")
            loot_mod_cont_set(mod_container, "att_2", "mod_torch_2")
            loot_mod_cont_set(mod_container, "att_4", "mod_laser_rosso")
        }
        else
        {
            var _random_mods = npc_get_ammo_value(npc_id).npc_get_ammo_value(npc_id).Generate(variable_struct_get(global.item_possible_mod_data, arma_now))
            mod_container.mod_container.ChooseAll(_random_mods)
        }
        var _stats = item_weapon_get_modded_stats(arma_now, mod_container)
        recoil_arma = _stats.recoil
        ammo_now = item_weapon_get_modded_magazine_size(arma_now, mod_container)
    }
}

