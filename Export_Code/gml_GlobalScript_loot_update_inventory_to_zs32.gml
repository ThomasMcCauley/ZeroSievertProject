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
function loot_array_update_to_zs32(argument0, argument1) //gml_Script_loot_array_update_to_zs32
{
    switch argument1
    {
        case "player inventory":
            var _tolerance = 3
            var _i = 0
            repeat array_length(argument0)
            {
                var _loot = argument0[_i]
                with (_loot)
                {
                    if (item_get_category(item) == "weapon" && (!(is_struct(variable_struct_get(self, "mods")))))
                    {
                        mods = loot_mod_cont_create()
                        loot_mod_cont_copy_from_default(mods, item)
                    }
                }
                if (variable_struct_exists(_loot, "ammo_id") && (!(variable_struct_exists(_loot, "jammed"))))
                    _loot.jammed = false
                if (!(variable_struct_exists(_loot, "placement")))
                {
                    var _x = _loot.x
                    var _y = _loot.y
                    var _found = false
                    var _j = 0
                    repeat array_length(global.__legacy_inventory_hotspots)
                    {
                        var _hotspot = global.__legacy_inventory_hotspots[_j]
                        var _hotspot_l = _hotspot.x
                        var _hotspot_t = _hotspot.y
                        var _hotspot_r = _hotspot_l + _hotspot.width
                        var _hotspot_b = _hotspot_t + _hotspot.height
                        if point_in_rectangle(_x, _y, (_hotspot_l - _tolerance), (_hotspot_t - _tolerance), (_hotspot_r + _tolerance), (_hotspot_b + _tolerance))
                        {
                            _found = true
                            _loot.placement = _hotspot.name
                            if (_hotspot.type == "grid")
                            {
                                _loot.x -= _hotspot_l
                                _loot.y -= _hotspot_t
                            }
                            else
                            {
                                _loot.x = 0
                                _loot.y = 0
                            }
                            break
                        }
                        else
                            _j++
                    }
                }
                _i++
            }
            break
        case "player stash":
            _i = 0
            repeat array_length(argument0)
            {
                _loot = argument0[_i]
                with (_loot)
                {
                    if (item_get_category(item) == "weapon" && (!(is_struct(variable_struct_get(self, "mods")))))
                    {
                        if (!is_struct(_loot.mods))
                        {
                            _loot.mods = loot_mod_cont_create()
                            loot_mod_cont_copy_from_default(_loot.mods, _loot.item)
                        }
                    }
                }
                _i++
            }
            break
        case "trader inventory":
            _i = 0
            repeat array_length(argument0)
            {
                _loot = argument0[_i]
                with (_loot)
                {
                    if (!(is_string(variable_struct_get(self, "page"))))
                        loot_set_from_trader(self, min_level, item_get_trader_page(item))
                    if (item_get_category(item) == "weapon" && (!(is_struct(variable_struct_get(self, "mods")))))
                    {
                        mods = loot_mod_cont_create()
                        loot_mod_cont_copy_from_default(mods, item)
                    }
                }
                _i++
            }
            break
    }

}

