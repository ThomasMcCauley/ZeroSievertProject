function player_action_open_trader(argument0) //gml_Script_player_action_open_trader
{
    with (gml_Script_uiGetData())
    {
        loot_name = argument0.npc_name
        trader_target = argument0
        trader_page = trader_pages_default_alias()
        chest_target = undefined
        chest_using = false
        stash_page = undefined
    }
    gml_Script___uiGlobal().__defaultOnion.gml_Script___uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/inventory_trader.ui", "inventory layer")
    player_set_local_state(gml_Script_scr_player_state_inventory)
    ui_player_inventory_populate(false)
    ui_trader_populate(argument0, trader_pages_default_alias())
    return true;
}

