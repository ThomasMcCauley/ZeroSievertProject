player_follow_local()
if player_exists_local()
{
    if settings_get("FOG FOW")
    {
        var _dir = (point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y)) + 360
        var _off = 550
        var _angle_diff = global.angle_fow / 2
        global.field_of_view_x1 = x + (lengthdir_x(_off, (_dir + _angle_diff)))
        global.field_of_view_y1 = y + (lengthdir_y(_off, (_dir + _angle_diff)))
        global.field_of_view_x2 = x + (lengthdir_x(_off, (_dir - _angle_diff)))
        global.field_of_view_y2 = y + (lengthdir_y(_off, (_dir - _angle_diff)))
    }
}
depth = 35
