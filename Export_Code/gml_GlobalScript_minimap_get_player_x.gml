function minimap_get_player_x() //gml_Script_minimap_get_player_x
{
    if (!player_exists_local())
        return (-infinity);
    return ((4 * player_get_local().x) div 16);
}

