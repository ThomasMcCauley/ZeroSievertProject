function player_loadout_set_ammo_item(argument0, argument1) //gml_Script_player_loadout_set_ammo_item
{
    var _loot = player_loadout_get_loot(player_get_local(), argument0)
    if (!item_exists(loot_get_item(_loot)))
        return;
    if (!(variable_struct_exists(_loot, "ammo_id")))
        return;
    _loot.ammo_id = argument1
}

