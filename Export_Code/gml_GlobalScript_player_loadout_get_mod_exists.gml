function player_loadout_get_mod_exists(argument0, argument1, argument2) //gml_Script_player_loadout_get_mod_exists
{
    if (argument0.object_index != obj_player && argument0.object_index != obj_player_puppet)
        trace_error("Cannot read loadout from non-player (", object_get_name(argument0.object_index), ")")
    return loot_mod_cont_exists(player_loadout_get_mod_container(argument0, argument1), argument2);
}

