function scr_draw_text_with_box(argument0, argument1) //gml_Script_scr_draw_text_with_box
{
    if (argument1 == undefined)
        argument1 = true
    with (obj_draw_something)
        instance_destroy()
    var _instance = instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, obj_draw_something)
    _instance.t = (argument1 ? language_get_string(argument0) : argument0)
}

