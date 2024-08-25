function world_space_to_gui_space(argument0, argument1) //gml_Script_world_space_to_gui_space
{
    var _multiplier_h = 4 * (window_get_width() / 1920)
    var _multiplier_v = 4 * (window_get_height() / 1080)
    var _x_return = map(argument0, camera_get_view_x(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), 0, (window_get_width() / _multiplier_h))
    var _y_return = map(argument1, camera_get_view_y(view_camera[0]), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), 0, (window_get_height() / _multiplier_v))
    return [_x_return, _y_return];
}

