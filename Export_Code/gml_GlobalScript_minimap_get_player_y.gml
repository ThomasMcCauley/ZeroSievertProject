function minimap_get_player_y() //gml_Script_minimap_get_player_y
{
    if (!player_exists_local())
        return (-infinity);
    return ((4 * player_get_local().y) div 16);
}

