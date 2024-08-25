if (room == test_room)
{
    var _x = 209
    var _y = 234
}
else if is_in_hub()
{
    _x = db_read_ext(inventory_target_db(), "player", "x", 591)
    _y = db_read_ext(inventory_target_db(), "player", "y", 911)
}
else
{
    _x = x
    _y = y
}
player_create(_x, _y, player_get_local_index())
