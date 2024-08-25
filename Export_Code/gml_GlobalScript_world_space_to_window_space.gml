function world_space_to_window_space(argument0, argument1) //gml_Script_world_space_to_window_space
{
    var _app_pos = application_get_position()
    var _x_return = map(argument0, camera_get_view_x(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), _app_pos[0], _app_pos[2])
    var _y_return = map(argument1, camera_get_view_y(view_camera[0]), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), _app_pos[1], _app_pos[3])
    return [_x_return, _y_return];
}

