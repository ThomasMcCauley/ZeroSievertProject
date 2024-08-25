function minimap_get_player_on_map() //gml_Script_minimap_get_player_on_map
{
    if (!player_exists_local())
        return false;
    return player_get_local().y <= obj_map_generator.map_height;
}

