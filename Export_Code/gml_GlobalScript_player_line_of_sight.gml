function player_line_of_sight(argument0, argument1, argument2) //gml_Script_player_line_of_sight
{
    if (argument2 == undefined)
        argument2 = player_get_local_index()
    var _player = player_get(argument2)
    if (!instance_exists(_player))
        return undefined;
    var _player_x = _player.x
    var _player_y = _player.y
    if collision_line(argument0, argument1, _player_x, _player_y, obj_solid, true, true)
        return false;
    if (settings_get("FOG FOW") && (!(point_in_triangle(argument0, argument1, _player_x, _player_y, global.field_of_view_x1, global.field_of_view_y1, global.field_of_view_x2, global.field_of_view_y2))) && point_distance(argument0, argument1, _player_x, _player_y) > global.fow_minimun_dis)
        return false;
    return true;
}

