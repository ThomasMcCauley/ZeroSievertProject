function ui_initialize_data_struct() //gml_Script_ui_initialize_data_struct
{
    with (gml_Script_uiGetData())
    {
        version = concat(0, ".", 51, ".", 3)
        most_recent_save = undefined
        tutorial_title = "Movement"
        tutorial_sprite = 2032
        tutorial_ui_path = "ZS_vanilla/ui/mm_tutorial.ui"
        settings_title = "Settings - Audio"
        settings_content = []
        max_save_slots = 3
        saveslot = undefined
        loadout = undefined
        difficulty_new_game = false
        difficulty_title = ""
        difficulty_name = ""
        difficulty_content = []
        sleep_minutes = 0
        pda_back_is_close = true
        tooltip_text = ""
        tooltip_loot = undefined
        tooltip_column_x = 200
        skill_chosen = undefined
        skill_specialization = undefined
        base_slot_selected = undefined
        base_module_selected = undefined
        npc_instance = undefined
        npc_question_index = undefined
        npc_quest_index = undefined
        map_selected = (1 << 0)
        reward_item = undefined
        reward_item_quantity = 0
        reward_only_cash = false
        loot_name = "Ground"
        chest_target = undefined
        chest_using = false
        stash_page = undefined
        trader_page = undefined
        trader_target = undefined
        debug_spawner_category = "weapon"
        crafting_mode = "medication"
        crafting_loot = undefined
        modding_loot = undefined
        modding_mod_pos = undefined
        context_menu_loot = undefined
        marker_id = undefined
        marker_popup_text = "???"
    }
}

