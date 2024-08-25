var camx = camera_get_view_x(view_camera[0])
var camy = camera_get_view_y(view_camera[0])
if instance_exists(obj_train)
{
    if (obj_train.state == (8 << 0))
    {
        alarm[0] = 1
        return;
    }
}
if (!(settings_get("fog of war")))
    fog_of_war = false
else
{
    if (vb != undefined)
    {
        vertex_delete_buffer(vb)
        vb = undefined
    }
    vb = vertex_create_buffer()
    vertex_begin(vb, vf)
    var _vb = vb
    var _solid_trovati = false
    with (obj_solid)
    {
        if (point_distance(x, y, obj_controller.x, obj_controller.y) < 300)
        {
            _solid_trovati = true
            var x1 = bbox_left
            var y1 = bbox_top
            var x2 = bbox_right
            var y2 = bbox_bottom
            scr_quad(_vb, x1, y1, x2, y1)
            scr_quad(_vb, x1, y1, x1, y2)
            scr_quad(_vb, x2, y1, x2, y2)
            scr_quad(_vb, x1, y2, x2, y2)
        }
    }
    vertex_end(vb)
    if _solid_trovati
    {
        fog_of_war = true
        alarm[1] = 5
    }
    else
        fog_of_war = false
}
alarm[0] = intervallo_generate_vertex
