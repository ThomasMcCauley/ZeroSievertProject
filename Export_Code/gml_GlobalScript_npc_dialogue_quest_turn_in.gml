/*
WARNING: Recursive script decompilation (for asset type resolution) failed for gml_Script_db_force_save

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 280
   at UndertaleModLib.Decompiler.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 795
   at UndertaleModLib.Decompiler.Decompiler.DirectFunctionCall.DoTypePropagation(DecompileContext context, AssetIDType suggestedType) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Instructions\Decompiler.DirectFunctionCall.cs:line 139
*/
function npc_dialogue_quest_turn_in() //gml_Script_npc_dialogue_quest_turn_in
{
    var _npc_instance = gml_Script_uiGetData().npc_instance
    var _quest_index = gml_Script_uiGetData().npc_quest_index
    var _reward_item = gml_Script_uiGetData().reward_item
    var _reward_item_quantity = gml_Script_uiGetData().reward_item_quantity
    var _reward_only_cash = gml_Script_uiGetData().reward_only_cash
    var _quest_id = npc_dialogue_get_quest_id(_npc_instance, _quest_index)
    var _index = undefined
    var _i = 0
    repeat (30)
    {
        if (global.quest_state[_i].id == _quest_id)
        {
            _index = _i
            break
        }
        else
            _i++
    }
    if (_index == undefined)
    {
        scr_draw_text_with_box("You have not accepted this task yet!")
        return;
    }
    var _quest_state = global.quest_state[_index]
    if (!global.general_debug)
    {
        if (_quest_state.state != "completed" || _quest_state.giver != _npc_instance.npc_id)
        {
            scr_draw_text_with_box("You have not completed this task yet!")
            return;
        }
    }
    if _reward_only_cash
        _reward_item = "roubles"
    if (_reward_item == undefined)
    {
        scr_draw_text_with_box("You have to choose an item as your reward!")
        return;
    }
    if (!(inventory_check_for_space_for_quest([
    {
        item: _reward_item,
        amount: _reward_item_quantity
    }
])))
    {
        scr_draw_text_with_box("Not enough inventory space!")
        return;
    }
    with (obj_draw_something)
        instance_destroy()
    var _quest_data = variable_struct_get(global.quest_database, _quest_id)
    var _rep_reward = round(_quest_data.experience * (global.sk_k[(25 << 0)]))
    var _money_reward = round(_quest_data.money * (global.sk_k[(25 << 0)]) * gml_Script_difficulty_get("pro_quest_money"))
    var _rep_quest = round(_quest_data.reputation * gml_Script_difficulty_get("pro_quest_rep"))
    if player_exists_local()
    {
        var _text = instance_create_depth(player_get_local().x, player_get_local().y, (-player_get_local().y), obj_draw_something)
        _text.t = string(_money_reward) + " " + language_get_string("Roubles") + " / " + string(_rep_reward) + " " + language_get_string("experience")
    }
    global.player_money += _money_reward
    global.esperienza += _rep_reward
    gml_Script_stat_add_value("tot_money", _money_reward)
    inventory_add_item(_reward_item, _reward_item_quantity)
    faction_add_rep("Player", _quest_data.faction, _rep_quest)
    var _objectives_array = _quest_data.objective
    _i = 0
    repeat array_length(_objectives_array)
    {
        var _objectives_data = _objectives_array[_i]
        switch _objectives_data.type
        {
            case "collect":
            case "retrieve":
            case "retrieve_equipment":
            case "retrieve_analyzer":
                inventory_and_stash_remove_item(_objectives_data.item, _objectives_data.amount_max)
                break
        }

        _i++
    }
    global.quest_state[_index] = new class_quest_state()
    item_tracking_reset()
    db_open(inventory_target_db())
    var _npc_quest_array = _npc_instance.quest_array
    _i = 0
    repeat array_length(_npc_quest_array)
    {
        var _npc_quest_id = _npc_quest_array[_i]
        if (_quest_id == _npc_quest_id)
        {
            _npc_quest_array[_i] = ""
            var _npc_name = _npc_instance.npc_id + "_quest"
            db_write("NPC", _npc_name, _npc_quest_array)
        }
        _i++
    }
    db_close()
    quest_complete(_quest_id)
    quest_line_update()
    if is_in_hub()
    {
        gml_Script_db_force_save("pre_raid")
        quest_save()
        faction_save()
    }
    with (_npc_instance)
        lista_text()
    if (_quest_id == "igor_supplies")
    {
        gml_Script_uiOnionCurrent().gml_Script_uiOnionCurrent().LayerDelete(gml_Script_uiOnionCurrentLayer())
        player_set_local_state(gml_Script_scr_player_state_move)
    }
    else
    {
        gml_Script_uiFind(uiCurrentRoot(), "top left frame").gml_Script_uiFind(uiCurrentRoot(), "top left frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui")
        gml_Script_uiFind(uiCurrentRoot(), "left frame").gml_Script_uiFind(uiCurrentRoot(), "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_quest_selection.ui")
        gml_Script_uiFind(uiCurrentRoot(), "right frame").gml_Script_uiFind(uiCurrentRoot(), "right frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui")
    }
    gml_Script_uiGetData().reward_item = undefined
    gml_Script_uiGetData().reward_only_cash = false
}

