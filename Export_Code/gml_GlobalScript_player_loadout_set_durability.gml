function player_loadout_set_durability(argument0, argument1) //gml_Script_player_loadout_set_durability
{
    var _loot = player_loadout_get_loot(player_get_local(), argument0)
    if (!item_exists(loot_get_item(_loot)))
        return;
    if (!(variable_struct_exists(_loot, "durability")))
    {
        _loot.durability = 100
        return;
    }
    _loot.durability = clamp(argument1, 0, 100)
}

