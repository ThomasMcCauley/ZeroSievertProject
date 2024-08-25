function player_action_open_minimap() //gml_Script_player_action_open_minimap
{
    player_action_open_pda()
    gml_Script_uiGetData().pda_back_is_close = false
    var _root = uiLayerGetRoot("pda layer")
    gml_Script_uiFind(_root, "pda frame").gml_Script_uiFind(_root, "pda frame").ReplaceFromFile("ZS_vanilla/ui/pda_map.ui")
    uiInputButtonConsume(_root, "map shortcut")
    return true;
}

