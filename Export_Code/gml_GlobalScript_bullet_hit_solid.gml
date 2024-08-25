function bullet_hit_solid(argument0, argument1) //gml_Script_bullet_hit_solid
{
    with (argument0)
    {
        var _impact = instance_create_depth(x, y, ((-y) - 64), obj_bullet_hit_wall)
        _impact.impact_direction = point_direction(hspd, vspd, 0, 0)
        var _decor_id = argument1.decor_id
        if (_decor_id >= 0)
        {
            if variable_instance_exists(131, "decor_material")
            {
                var _material = obj_controller.decor_material[_decor_id]
                if (_material != (0 << 0))
                {
                    _impact = instance_create_depth(x, y, 0, obj_bullet_impact)
                    _impact.sound_impact = global.bullet_impact[_material][irandom((array_length_2d(global.bullet_impact, _material)) - 1)]
                }
            }
        }
        instance_destroy()
    }
}

