/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script___uiRootStackTop

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script___uiRootStackTop

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function ui_modding_populate(argument0) //gml_Script_ui_modding_populate
{
    var _weapon_item = loot_get_item(gml_Script_uiGetData().modding_loot)
    gml_Script_uiGetData().modding_mod_pos = argument0
    if global.general_debug
    {
        var _loot_array = []
        var _i = 0
        repeat array_length(global.item_data_array)
        {
            var _item = global.item_data_array[_i]
            if (item_mod_fits_weapon(_item, _weapon_item) && item_mod_fits_position(_item, argument0))
                array_push(_loot_array, new class_loot(_item, 1))
            _i++
        }
    }
    else
        _loot_array = inventory_and_stash_get_mod_array(_weapon_item, argument0)
    var _destination_struct = gml_Script_uiFind(uiLayerGetRoot("modding layer"), "mod inventory")
    _destination_struct._destination_struct.ChildrenClear()
    gml_Script_uiOpenExisting(_destination_struct)
    _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        var _remove = false
        uiOpen(gml_Script_class_ui_loot_modding)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _loot)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().AutoPlace(_destination_struct)
        gml_Script_uiClose()
        _i++
    }
    var _dest_struct = gml_Script_uiFind(uiLayerGetRoot("modding layer"), "installed mod inventory")
    _dest_struct._dest_struct.ChildrenClear()
    var _installed_item_id = loot_weapon_get_mod(gml_Script_uiGetData().modding_loot, argument0)
    if (_installed_item_id != "no_item")
    {
        var _installed_loot = new class_loot(_installed_item_id, 1)
        uiOpen(gml_Script_class_ui_loot_installed_mod)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().Set("loot", _installed_loot)
        gml_Script_uiCurrentOpen().gml_Script_uiCurrentOpen().AutoPlace(_dest_struct)
        gml_Script_uiClose()
    }
    gml_Script_uiClose()
    gml_Script_uiFind(gml_Script___uiRootStackTop(), "mod position list").gml_Script_uiFind(gml_Script___uiRootStackTop(), "mod position list").ReplaceFromFile("ZS_vanilla/ui/modding_exec_mod_position_list.ui")
    gml_Script_uiFind(gml_Script___uiRootStackTop(), "mod stats").gml_Script_uiFind(gml_Script___uiRootStackTop(), "mod stats").ReplaceFromFile("ZS_vanilla/ui/modding_exec_stats.ui")
}

