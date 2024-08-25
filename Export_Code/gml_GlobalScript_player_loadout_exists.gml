function player_loadout_exists(argument0, argument1) //gml_Script_player_loadout_exists
{
    return item_exists(player_loadout_get_item(argument0, argument1));
}

