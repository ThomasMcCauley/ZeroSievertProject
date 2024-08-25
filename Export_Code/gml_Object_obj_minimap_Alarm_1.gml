if (is_in_raid() && player_exists_local())
{
    var xx = player_get_local().x div 16
    var yy = player_get_local().y div 16
    ds_grid_set_disk(grid_surface_cover, xx, yy, raggio_cover, true)
}
alarm[1] = 60
