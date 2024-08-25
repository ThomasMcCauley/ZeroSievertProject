function gamedata_initialize_and_load() //gml_Script_gamedata_initialize_and_load
{
    gamedata_clear()
    gamedata_load("gamedata_order.json")
    gamedata_build_all_weapon_array()
    gamedata_build_possible_mod_dictionary()
    gamedata_fill_out_debug_spawner()
    gamedata_setup_chests()
    gamedata_build_caliber_lookup()
    gamedata_build_languages()
    stat_reset_all_values()
}

