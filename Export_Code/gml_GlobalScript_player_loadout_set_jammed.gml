function player_loadout_set_jammed(argument0, argument1) //gml_Script_player_loadout_set_jammed
{
    var _loot = player_loadout_get_loot(player_get_local(), argument0)
    if (!item_exists(loot_get_item(_loot)))
        return;
    if (!(variable_struct_exists(_loot, "jammed")))
    {
        _loot.jammed = false
        return;
    }
    _loot.jammed = argument1
}

