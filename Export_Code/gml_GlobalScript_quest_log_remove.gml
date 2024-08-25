function quest_log_remove(argument0) //gml_Script_quest_log_remove
{
    var _true_index = __quest_log_get_true_index(argument0)
    if (_true_index == undefined)
        return;
    if (!quest_log_get_removable(argument0))
    {
        scr_draw_text_with_box("You cannot remove this quest")
        return;
    }
    if (!is_in_hub())
        scr_draw_text_with_box("You can only remove quests in the bunker")
    global.quest_state[_true_index] = new class_quest_state()
    item_tracking_reset()
    gml_Script_uiFind(gml_Script___uiRootStackTop(), "pda frame").gml_Script_uiFind(gml_Script___uiRootStackTop(), "pda frame").ReplaceFromFile("ZS_vanilla/ui/pda_quest.ui")
}

