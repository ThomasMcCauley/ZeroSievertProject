function player_loadout_get_item(argument0, argument1) //gml_Script_player_loadout_get_item
{
    if (argument0.object_index != obj_player && argument0.object_index != obj_player_puppet)
        trace_error("Cannot read loadout from non-player (", object_get_name(argument0.object_index), ")")
    var _loot = player_loadout_get_loot(argument0, argument1)
    return (_loot == undefined ? "no_item" : _loot.item);
}

