/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_force_save

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function npc_dialogue_quest_accept() //gml_Script_npc_dialogue_quest_accept
{
    var _npc_instance = gml_Script_uiGetData().npc_instance
    var _quest_index = gml_Script_uiGetData().npc_quest_index
    var _quest_id = npc_dialogue_get_quest_id(_npc_instance, _quest_index)
    if (npc_dialogue_get_quest_state(_npc_instance, _quest_index) != undefined)
    {
        scr_draw_text_with_box("You already have this quest!")
        return;
    }
    var _quest_data = variable_struct_get(global.quest_database, _quest_id)
    var _level_required = _quest_data.rep_min
    if (faction_get_rep("Player", _quest_data.faction) < _quest_data.rep_min)
    {
        var _text = language_get_string("Reputation level required")
        _text = string_replace(_text, "[REPUTATION_MINIMUM]", string(_quest_data.rep_min))
        scr_draw_text_with_box(_text, false)
        return;
    }
    var _empty_index = undefined
    var _i = 0
    repeat (30)
    {
        if (global.quest_state[_i].id == "")
        {
            _empty_index = _i
            break
        }
        else
            _i++
    }
    if (_empty_index == undefined)
    {
        scr_draw_text_with_box("You have reached the max task limit!")
        return;
    }
    var _array_item = _quest_data.initial_item
    if (!inventory_check_for_space_for_quest(_array_item))
        scr_draw_text_with_box("Not enough inventory space!")
    var _quest_state = new class_quest_state()
    _quest_state.id = _quest_id
    _quest_state.giver = _npc_instance.npc_id
    _quest_state.state = "active"
    global.quest_state[_empty_index] = _quest_state
    item_tracking_reset()
    _text = language_get_string("Quest accepted")
    _text = string_replace(_text, "[QUEST_NAME]", language_get_string(variable_struct_get(global.quest_database, _quest_id).name))
    scr_draw_text_with_box(_text)
    _i = 0
    repeat array_length(_array_item)
    {
        var _item_data = _array_item[_i]
        var _item_id = _item_data.item
        var _amount = _item_data.amount
        inventory_add_item(_item_id, _amount)
        _text = language_get_string("Item added to inventory")
        _text = string_replace(_text, "[ITEM_NAME]", item_get_name(_item_id))
        _text = string_replace(_text, "[ITEM_QUANTITY]", string(_amount))
        scr_draw_text_with_box(_text, false)
        _i++
    }
    if is_in_hub()
    {
        quest_save()
        obj_controller.alarm[1] = 1
    }
    gml_Script_uiFind(uiCurrentRoot(), "top left frame").gml_Script_uiFind(uiCurrentRoot(), "top left frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui")
    gml_Script_uiFind(uiCurrentRoot(), "left frame").gml_Script_uiFind(uiCurrentRoot(), "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_quest_selection.ui")
    gml_Script_uiFind(uiCurrentRoot(), "right frame").gml_Script_uiFind(uiCurrentRoot(), "right frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui")
}

