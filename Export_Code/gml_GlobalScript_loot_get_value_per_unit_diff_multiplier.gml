/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_loot_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_loot_get_durability

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function loot_get_value_per_unit_diff_multiplier(argument0) //gml_Script_loot_get_value_per_unit_diff_multiplier
{
    with (argument0)
    {
        var _value = item_get_value(item)
        var _multiplier = 1
        switch loot_get_category(argument0)
        {
            case "weapon":
                _multiplier = gml_Script_difficulty_get("trade_price_weapon")
                break
            case "armor":
                _multiplier = gml_Script_difficulty_get("trade_price_armor")
                break
            case "backpack":
                _multiplier = gml_Script_difficulty_get("trade_price_backpack")
                break
            case "ammo":
                _multiplier = gml_Script_difficulty_get("trade_price_ammo")
                break
            case "medication":
                _multiplier = gml_Script_difficulty_get("trade_price_medication")
                break
        }

        _value *= _multiplier
        _value *= (gml_Script_loot_get_durability(argument0) / 100)
        if item_weapon_get_moddable(item)
            _value += loot_mod_cont_get_value(mods)
        return _value;
    }
}

