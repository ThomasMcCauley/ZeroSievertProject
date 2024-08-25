/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_stat_add_value

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_stat_add_value

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 235
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function trader_transfer_money(argument0, argument1, argument2) //gml_Script_trader_transfer_money
{
    argument1 = max(0, argument1)
    argument2 = max(0, argument2)
    var _net_value_for_trader = argument2 - argument1
    global.player_money -= _net_value_for_trader
    if (argument0 == undefined || is_in_hub())
    {
        global.trader_money_all += _net_value_for_trader
        db_open("general")
        db_write("traders", "money", global.trader_money_all)
        db_close()
        argument0 = global.speaker_nearest
    }
    else
    {
        argument0.money_trader += _net_value_for_trader
        db_open("general")
        db_write((global.speaker_nearest.npc_id + "_trader"), "money", argument0.money_trader)
        db_close()
    }
    scr_level_up_skill((12 << 0), (argument1 * global.rate_charisma))
    gml_Script_stat_add_value("tot_money", argument1)
    faction_add_rep("Player", npc_get_faction(argument0.npc_id), (0.0002 * (argument1 + argument2)))
}

