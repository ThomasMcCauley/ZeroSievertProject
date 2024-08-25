/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gml_Script_uiFindAllType

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|3_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 563
*/
/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_uiFindAllType

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function ui_player_inventory_populate(argument0) //gml_Script_ui_player_inventory_populate
{
    if (!player_exists_local())
        return;
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", [])
    var _root = uiLayerGetRoot("inventory layer")
    var _failed_array = []
    var _ui_item_array = []
    var _i = 0
    repeat array_length(_loot_array)
    {
        var _loot = _loot_array[_i]
        if (_loot.quantity <= 0)
            trace("Warning! Loot quantity for player inventory is 0")
        else
        {
            var _placement = _loot.placement
            if (_placement == "sell inventory")
                _loot.placement = "player inventory"
            if (_placement != "player inventory" && (!argument0))
            {
                var _ui = ui_convert_loot_to_element(_loot, gml_Script_class_ui_item, _root.identifier)
                "active".("active").Set(false, _ui)
                "visible".("visible").Set(false, _ui)
            }
            else
            {
                _ui = ui_convert_loot_to_element(_loot, gml_Script_class_ui_item)
                if (_ui == undefined)
                {
                    array_push(_failed_array, _loot)
                    trace(["Failed items", _loot.placement])
                }
                else
                    array_push(_ui_item_array, _ui)
            }
        }
        _i++
    }
    if (array_length(_failed_array) > 0)
        trace("Failed to place at least one loot")
    gml_Script_uiFind(uiLayerGetRoot("inventory layer"), "player inventory").watch = true
    ui_inventory_check_weight()
    var _overlap = false
    _root = uiLayerGetRoot("inventory layer")
    var _player_inventory = gml_Script_uiFind(_root, "player inventory")
    var _item_array = _player_inventory.__children
    var _box_array = []
    if _overlap
        ui_inventory_sort(0)
}

