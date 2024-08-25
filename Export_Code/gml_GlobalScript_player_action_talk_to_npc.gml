/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___uiFileEnsure

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___uiFileEnsure

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function player_action_talk_to_npc() //gml_Script_player_action_talk_to_npc
{
    gml_Script_uiGetData().npc_instance = global.speaker_nearest
    if instance_exists(global.speaker_nearest)
    {
        if (global.speaker_nearest.npc_speaker_id == "scientist_cristallo_viola")
            global.az_done[(5 << 0)] = true
    }
    var _root = uiFileExecute("ZS_vanilla/ui/npc.ui")
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop(_root, "npc")
    gml_Script_uiFind(_root, "left frame").gml_Script_uiFind(_root, "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_talk.ui")
    gml_Script_uiFind(_root, "right frame").gml_Script_uiFind(_root, "right frame").ReplaceFromFile("ZS_vanilla/ui/npc_right_talk.ui")
    player_set_local_state(gml_Script_scr_player_state_talk)
    return true;
}

